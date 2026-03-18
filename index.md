# usdaplants

usdaplants is a convenience data package providing the USDA PLANTS
database as tibbles. It includes plant taxonomy, growth characteristics,
and state-level distribution data for over 32,000 plant species in the
United States.

## Installation

You can install the development version of usdaplants from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("kjhealy/usdaplants")
```

## Datasets

The package provides three datasets:

- **`plants`** – 32,800 plants with taxonomy, duration, and growth
  habit.
- **`plant_characteristics`** – Growth and habitat characteristics for
  2,162 species.
- **`plant_distribution`** – Native/introduced status by state (241,601
  rows).

All three datasets are linked by the `symbol` column (the USDA PLANTS
identifier).

## Examples

``` r
library(usdaplants)
#> Loading required package: tibble

plants
#> # A tibble: 32,800 × 9
#>    symbol scientific_name     common_name group_name rank  family genus duration
#>    <chr>  <chr>               <chr>       <chr>      <chr> <chr>  <chr> <chr>   
#>  1 ECTE5  Echinoplaca tetrap… echinoplac… Lichen     Spec… Gomph… Echi… <NA>    
#>  2 ACSC5  Acarospora schleic… Schleicher… Lichen     Spec… Acaro… Acar… <NA>    
#>  3 BALO6  Bacidia lobarica P… dotted lic… Lichen     Spec… Bacid… Baci… <NA>    
#>  4 CLSU7  Cladina subtenuis … reindeer l… Lichen     Spec… Clado… Clad… <NA>    
#>  5 CLCR2  Cladonia cristatel… British so… Lichen     Spec… Clado… Clad… <NA>    
#>  6 ASDE19 Aspicilia desertor… desert asp… Lichen     Spec… Hymen… Aspi… <NA>    
#>  7 ASFR11 Aspicilia fruticul… <NA>        Lichen     Spec… Hymen… Aspi… <NA>    
#>  8 JADO   Japewiella dollypa… Dolly Part… Lichen     Spec… Lecan… Jape… <NA>    
#>  9 LEAN20 Lecanora anakeesti… Anakeesta … Lichen     Spec… Lecan… Leca… <NA>    
#> 10 LECO17 Lecanora conizaeoi… rim lichen  Lichen     Spec… Lecan… Leca… <NA>    
#> # ℹ 32,790 more rows
#> # ℹ 1 more variable: growth_habit <chr>
```

``` r
# Filter to trees
plants[grepl("Tree", plants$growth_habit), ]
#> # A tibble: 3,468 × 9
#>    symbol scientific_name     common_name group_name rank  family genus duration
#>    <chr>  <chr>               <chr>       <chr>      <chr> <chr>  <chr> <chr>   
#>  1 ALAM5  Alsophila amintae … forest als… Fern       Spec… Cyath… Also… Perenni…
#>  2 ALBR4  Alsophila bryophil… helecho gi… Fern       Spec… Cyath… Also… Perenni…
#>  3 ALPO7  Alsophila portoric… Puerto Ric… Fern       Spec… Cyath… Also… Perenni…
#>  4 CYAN   Cyathea andina (Ka… parrotfeat… Fern       Spec… Cyath… Cyat… Perenni…
#>  5 CYAR   Cyathea arborea (L… West India… Fern       Spec… Cyath… Cyat… Perenni…
#>  6 CYAR13 Cyathea armata (Sw… creeping t… Fern       Spec… Cyath… Cyat… Perenni…
#>  7 CYCO18 Cyathea cooperi (H… Cooper's c… Fern       Spec… Cyath… Cyat… Perenni…
#>  8 CYFU   Cyathea furfuracea… Jamaican t… Fern       Spec… Cyath… Cyat… Perenni…
#>  9 CYLU5  Cyathea lunulata (… Pacific tr… Fern       Spec… Cyath… Cyat… Perenni…
#> 10 CYNI7  Cyathea nigricans … treefern    Fern       Spec… Cyath… Cyat… Perenni…
#> # ℹ 3,458 more rows
#> # ℹ 1 more variable: growth_habit <chr>
```

``` r
# Characteristics for drought-tolerant plants
plant_characteristics[plant_characteristics$drought_tolerance == "High", c("symbol", "drought_tolerance", "height_mature_feet")]
#> # A tibble: 544 × 3
#>    symbol drought_tolerance height_mature_feet
#>    <chr>  <chr>                          <dbl>
#>  1 ACCY2  High                              12
#>  2 ACHY   High                               2
#>  3 ACLE9  High                               2
#>  4 ACLEL  High                               3
#>  5 ACLO   High                              20
#>  6 ACME   High                              40
#>  7 ACNE2  High                              60
#>  8 ACNED  High                               3
#>  9 ACOCO  High                               2
#> 10 ACSP12 High                               2
#> # ℹ 534 more rows
```

``` r
# Plants native to New York
ny_native <- plant_distribution[
  plant_distribution$state == "New York" & plant_distribution$status == "native",
]
ny_native
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
