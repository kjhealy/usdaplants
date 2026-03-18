library(tidyverse)
library(DBI)
library(jsonlite)

con <- dbConnect(RSQLite::SQLite(), "data-raw/raw/plants.db")

# --- Helper functions ---

strip_html <- function(x) {
  gsub("</?i>", "", x)
}

extract_italic <- function(x) {
  out <- if_else(
    grepl("<i>", x, fixed = TRUE),
    gsub(".*<i>([^<]+)</i>.*", "\\1", x),
    x
  )
  trimws(out)
}

parse_json_array <- function(x) {
  vapply(
    x,
    function(val) {
      if (is.na(val) || val == "[]") {
        return(NA_character_)
      }
      parsed <- fromJSON(val)
      if (length(parsed) == 0) NA_character_ else paste(parsed, collapse = ", ")
    },
    character(1),
    USE.NAMES = FALSE
  )
}

yes_no_to_logical <- function(x) {
  case_when(x == "Yes" ~ TRUE, x == "No" ~ FALSE, .default = NA)
}

# --- plants ---

raw_plants <- dbReadTable(con, "plants") |> as_tibble()
raw_taxonomy <- dbReadTable(con, "plant_taxonomic_paths") |> as_tibble()

plants <- raw_plants |>
  left_join(raw_taxonomy, by = c("id" = "plant_id")) |>
  transmute(
    symbol,
    scientific_name = strip_html(scientific_name),
    common_name,
    group_name,
    rank,
    family = extract_italic(family),
    genus = extract_italic(genus),
    duration = parse_json_array(durations),
    growth_habit = parse_json_array(growth_habits)
  )

# --- plant_characteristics ---

raw_chars <- dbReadTable(con, "plant_characteristics") |> as_tibble()

yn_cols <- c(
  "coppice_potential",
  "fall_conspicuous",
  "fire_resistant",
  "flower_conspicuous",
  "fruit_seed_conspicuous",
  "known_allelopath",
  "leaf_retention",
  "low_growing_grass",
  "resprout_ability",
  "adapted_to_coarse_textured_soils",
  "adapted_to_fine_textured_soils",
  "adapted_to_medium_textured_soils",
  "cold_stratification_required",
  "fruit_seed_persistence",
  "propagated_by_bare_root",
  "propagated_by_bulb",
  "propagated_by_container",
  "propagated_by_corm",
  "propagated_by_cuttings",
  "propagated_by_seed",
  "propagated_by_sod",
  "propagated_by_sprigs",
  "propagated_by_tubers",
  "small_grain",
  "berry_nut_seed_product",
  "christmas_tree_product",
  "fodder_product",
  "lumber_product",
  "naval_store_product",
  "nursery_stock_product",
  "palatable_human",
  "post_product",
  "pulpwood_product",
  "veneer_product"
)

num_cols <- c(
  "height_at_20_years_maximum_feet",
  "height_mature_feet",
  "frost_free_days_minimum",
  "planting_density_per_acre_maximum",
  "planting_density_per_acre_minimum",
  "precipitation_maximum",
  "precipitation_minimum",
  "root_depth_minimum",
  "temperature_minimum_f",
  "seed_per_pound"
)

plant_characteristics <- raw_chars |>
  left_join(
    raw_plants |> select(id, symbol),
    by = c("plant_id" = "id")
  ) |>
  select(-id, -plant_id) |>
  relocate(symbol) |>
  mutate(
    across(all_of(yn_cols), yes_no_to_logical),
    across(all_of(num_cols), as.numeric)
  )

# --- plant_distribution ---

raw_dist <- dbReadTable(con, "plant_distribution") |> as_tibble()

plant_distribution <- raw_dist |>
  select(plant_symbol, native_states, introduced_states) |>
  rename(symbol = plant_symbol) |>
  pivot_longer(
    c(native_states, introduced_states),
    names_to = "status",
    values_to = "states_json"
  ) |>
  filter(states_json != "[]") |>
  mutate(
    status = if_else(status == "native_states", "native", "introduced"),
    state = map(states_json, fromJSON)
  ) |>
  select(-states_json) |>
  unnest(state) |>
  mutate(
    state = gsub("_", " ", state),
    status = factor(status, levels = c("native", "introduced"))
  )

dbDisconnect(con)

# --- Save ---

usethis::use_data(plants, overwrite = TRUE, compress = "xz")
usethis::use_data(plant_characteristics, overwrite = TRUE, compress = "xz")
usethis::use_data(plant_distribution, overwrite = TRUE, compress = "xz")
