# USDA PLANTS growth characteristics

Detailed growth and habitat characteristics for 2,162 plant species from
the USDA PLANTS database.

## Usage

``` r
plant_characteristics
```

## Format

A tibble with 2,162 rows and 81 columns. Key columns include:

- symbol:

  USDA PLANTS symbol. Join key to
  [plants](https://kjhealy.github.io/usdaplants/reference/plants.md).

- active_growth_period:

  Period of active growth (e.g., "Spring", "Spring and Summer").

- bloat:

  Bloat potential for livestock: None, Low, Medium, or High.

- c_n_ratio:

  Carbon to nitrogen ratio: Low, Medium, or High.

- drought_tolerance:

  Drought tolerance: None, Low, Medium, or High.

- shade_tolerance:

  Shade tolerance: Intolerant, Intermediate, or Tolerant.

- height_mature_feet:

  Mature height in feet (numeric).

- height_at_20_years_maximum_feet:

  Maximum height at 20 years in feet (numeric).

- ph_minimum:

  Minimum soil pH (numeric).

- ph_maximum:

  Maximum soil pH (numeric).

- temperature_minimum_f:

  Minimum temperature in Fahrenheit (numeric).

- precipitation_minimum:

  Minimum precipitation in inches (numeric).

- precipitation_maximum:

  Maximum precipitation in inches (numeric).

- flower_color:

  Flower color.

- foliage_color:

  Foliage color.

- growth_rate:

  Growth rate: Slow, Moderate, or Rapid.

- bloom_period:

  Bloom period (e.g., "Early Spring", "Late Summer").

- toxicity:

  Toxicity level: None, Slight, Moderate, or Severe.

- fire_resistant:

  Fire resistant (logical).

- nitrogen_fixation:

  Nitrogen fixation ability: None, Low, Medium, or High.

## Source

USDA PLANTS Database: <https://plants.sc.egov.usda.gov/>

Data obtained from: <https://data.plantatlas.ai>

## Details

Only 2,162 of the 32,800 plants in
[plants](https://kjhealy.github.io/usdaplants/reference/plants.md) have
characteristics data.

Boolean columns (e.g., `fire_resistant`, `propagated_by_seed`,
`berry_nut_seed_product`) are stored as logical (`TRUE`/`FALSE`/`NA`).
Numeric columns (e.g., `height_mature_feet`, `ph_minimum`) have been
converted from text to double.

## Examples

``` r
plant_characteristics
#> # A tibble: 2,162 × 81
#>    symbol active_growth_period bloat c_n_ratio coppice_potential
#>    <chr>  <chr>                <chr> <chr>     <lgl>            
#>  1 ABAM   Spring and Summer    None  High      FALSE            
#>  2 ABBA   Spring and Summer    None  High      FALSE            
#>  3 ABCO   Spring and Summer    None  High      FALSE            
#>  4 ABFR   Spring and Summer    None  High      FALSE            
#>  5 ABGR   Spring and Summer    None  High      FALSE            
#>  6 ABGR4  Spring, Summer, Fall None  High      FALSE            
#>  7 ABLA   Spring and Summer    None  High      FALSE            
#>  8 ABMA   Spring and Summer    None  High      FALSE            
#>  9 ABMAS  Spring and Summer    None  High      FALSE            
#> 10 ABPR   Spring and Summer    None  High      FALSE            
#> # ℹ 2,152 more rows
#> # ℹ 76 more variables: fall_conspicuous <lgl>, fire_resistant <lgl>,
#> #   flower_color <chr>, flower_conspicuous <lgl>, foliage_color <chr>,
#> #   foliage_porosity_summer <chr>, foliage_porosity_winter <chr>,
#> #   foliage_texture <chr>, fruit_seed_color <chr>,
#> #   fruit_seed_conspicuous <lgl>, growth_form <chr>, growth_rate <chr>,
#> #   height_at_20_years_maximum_feet <dbl>, height_mature_feet <dbl>, …
```
