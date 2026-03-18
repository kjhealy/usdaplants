# USDA PLANTS state-level distribution

Native and introduced status by state and territory for plant species in
the USDA PLANTS database. Long format with one row per plant-state
combination.

## Usage

``` r
plant_distribution
```

## Format

A tibble with 241,601 rows and 3 columns:

- symbol:

  USDA PLANTS symbol. Join key to
  [plants](https://kjhealy.github.io/usdaplants/reference/plants.md).

- status:

  Factor with levels "native" and "introduced".

- state:

  State, territory, or province name (e.g., "New York", "Puerto Rico").

## Source

USDA PLANTS Database: <https://plants.sc.egov.usda.gov/>

Data obtained from: <https://data.plantatlas.ai>

## Details

Includes US states, territories (Puerto Rico, Virgin Islands, etc.), and
some Canadian provinces. Plants with no distribution data are excluded.

## Examples

``` r
plant_distribution
#> # A tibble: 241,601 × 3
#>    symbol status     state           
#>    <chr>  <fct>      <chr>           
#>  1 DRAD2  native     New Jersey      
#>  2 DRAD2  native     New York        
#>  3 DRADG  native     New York        
#>  4 CATA5  introduced California      
#>  5 EQAR   native     Alabama         
#>  6 EQAR   native     Alaska          
#>  7 EQAR   native     Alberta         
#>  8 EQAR   native     Arizona         
#>  9 EQAR   native     Arkansas        
#> 10 EQAR   native     British Columbia
#> # ℹ 241,591 more rows

# Plants native to New York
plant_distribution[
  plant_distribution$state == "New York" &
    plant_distribution$status == "native",
]
#> # A tibble: 3,439 × 3
#>    symbol status state   
#>    <chr>  <fct>  <chr>   
#>  1 DRAD2  native New York
#>  2 DRADG  native New York
#>  3 EQAR   native New York
#>  4 EQFE   native New York
#>  5 EQFL   native New York
#>  6 EQHY   native New York
#>  7 EQHYA  native New York
#>  8 EQLA   native New York
#>  9 EQLI   native New York
#> 10 EQMA   native New York
#> # ℹ 3,429 more rows
```
