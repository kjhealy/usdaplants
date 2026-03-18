#' USDA PLANTS database
#'
#' Plant species data from the USDA PLANTS database, including taxonomy,
#' growth habits, and duration for 32,800 plants in the United States.
#'
#' @format A tibble with 32,800 rows and 9 columns:
#' \describe{
#'   \item{symbol}{USDA PLANTS symbol (e.g., "QUAC" for \emph{Quercus
#'     acutissima}). Unique identifier for each plant.}
#'   \item{scientific_name}{Full scientific name including authority.}
#'   \item{common_name}{Primary common name.}
#'   \item{group_name}{Taxonomic group: Dicot, Monocot, Fern, Gymnosperm,
#'     Lichen, etc.}
#'   \item{rank}{Taxonomic rank: Species, Subspecies, Variety, or Form.}
#'   \item{family}{Plant family name.}
#'   \item{genus}{Genus name.}
#'   \item{duration}{Plant duration(s), comma-separated. Values include
#'     Perennial, Annual, and Biennial.}
#'   \item{growth_habit}{Growth habit(s), comma-separated. Values include
#'     Tree, Shrub, Subshrub, Forb/herb, Graminoid, Vine, Lichenous,
#'     Nonvascular, and others.}
#' }
#'
#' @details
#' The `symbol` column is the primary key and can be used to join with
#' [plant_characteristics] and [plant_distribution].
#'
#' Multi-valued fields (`duration` and `growth_habit`) are stored as
#' comma-separated strings. Use [grepl()] or [stringr::str_detect()] to
#' filter, e.g., `dplyr::filter(plants, grepl("Tree", growth_habit))`.
#'
#' @source
#' USDA PLANTS Database: <https://plants.sc.egov.usda.gov/>
#'
#' Data obtained from: <https://data.plantatlas.ai>
#'
#' @examples
#' plants
#'
#' # Trees only
#' plants[grepl("Tree", plants$growth_habit), ]
"plants"


#' USDA PLANTS growth characteristics
#'
#' Detailed growth and habitat characteristics for 2,162 plant species from
#' the USDA PLANTS database.
#'
#' @format A tibble with 2,162 rows and 81 columns. Key columns include:
#' \describe{
#'   \item{symbol}{USDA PLANTS symbol. Join key to [plants].}
#'   \item{active_growth_period}{Period of active growth (e.g., "Spring",
#'     "Spring and Summer").}
#'   \item{bloat}{Bloat potential for livestock: None, Low, Medium, or High.}
#'   \item{c_n_ratio}{Carbon to nitrogen ratio: Low, Medium, or High.}
#'   \item{drought_tolerance}{Drought tolerance: None, Low, Medium, or High.}
#'   \item{shade_tolerance}{Shade tolerance: Intolerant, Intermediate, or
#'     Tolerant.}
#'   \item{height_mature_feet}{Mature height in feet (numeric).}
#'   \item{height_at_20_years_maximum_feet}{Maximum height at 20 years in
#'     feet (numeric).}
#'   \item{ph_minimum}{Minimum soil pH (numeric).}
#'   \item{ph_maximum}{Maximum soil pH (numeric).}
#'   \item{temperature_minimum_f}{Minimum temperature in Fahrenheit
#'     (numeric).}
#'   \item{precipitation_minimum}{Minimum precipitation in inches
#'     (numeric).}
#'   \item{precipitation_maximum}{Maximum precipitation in inches
#'     (numeric).}
#'   \item{flower_color}{Flower color.}
#'   \item{foliage_color}{Foliage color.}
#'   \item{growth_rate}{Growth rate: Slow, Moderate, or Rapid.}
#'   \item{bloom_period}{Bloom period (e.g., "Early Spring", "Late Summer").}
#'   \item{toxicity}{Toxicity level: None, Slight, Moderate, or Severe.}
#'   \item{fire_resistant}{Fire resistant (logical).}
#'   \item{nitrogen_fixation}{Nitrogen fixation ability: None, Low, Medium,
#'     or High.}
#' }
#'
#' @details
#' Only 2,162 of the 32,800 plants in [plants] have characteristics data.
#'
#' Boolean columns (e.g., `fire_resistant`, `propagated_by_seed`,
#' `berry_nut_seed_product`) are stored as logical (`TRUE`/`FALSE`/`NA`).
#' Numeric columns (e.g., `height_mature_feet`, `ph_minimum`) have been
#' converted from text to double.
#'
#' @source
#' USDA PLANTS Database: <https://plants.sc.egov.usda.gov/>
#'
#' Data obtained from: <https://data.plantatlas.ai>
#'
#' @examples
#' plant_characteristics
"plant_characteristics"


#' USDA PLANTS state-level distribution
#'
#' Native and introduced status by state and territory for plant species
#' in the USDA PLANTS database. Long format with one row per plant-state
#' combination.
#'
#' @format A tibble with 241,601 rows and 3 columns:
#' \describe{
#'   \item{symbol}{USDA PLANTS symbol. Join key to [plants].}
#'   \item{status}{Factor with levels "native" and "introduced".}
#'   \item{state}{State, territory, or province name (e.g., "New York",
#'     "Puerto Rico").}
#' }
#'
#' @details
#' Includes US states, territories (Puerto Rico, Virgin Islands, etc.),
#' and some Canadian provinces. Plants with no distribution data are
#' excluded.
#'
#' @source
#' USDA PLANTS Database: <https://plants.sc.egov.usda.gov/>
#'
#' Data obtained from: <https://data.plantatlas.ai>
#'
#' @examples
#' plant_distribution
#'
#' # Plants native to New York
#' plant_distribution[
#'   plant_distribution$state == "New York" &
#'     plant_distribution$status == "native",
#' ]
"plant_distribution"
