# USDA PLANTS database

Plant species data from the USDA PLANTS database, including taxonomy,
growth habits, and duration for 32,800 plants in the United States.

## Usage

``` r
plants
```

## Format

A tibble with 32,800 rows and 9 columns:

- symbol:

  USDA PLANTS symbol (e.g., "QUAC" for *Quercus acutissima*). Unique
  identifier for each plant.

- scientific_name:

  Full scientific name including authority.

- common_name:

  Primary common name.

- group_name:

  Taxonomic group: Dicot, Monocot, Fern, Gymnosperm, Lichen, etc.

- rank:

  Taxonomic rank: Species, Subspecies, Variety, or Form.

- family:

  Plant family name.

- genus:

  Genus name.

- duration:

  Plant duration(s), comma-separated. Values include Perennial, Annual,
  and Biennial.

- growth_habit:

  Growth habit(s), comma-separated. Values include Tree, Shrub,
  Subshrub, Forb/herb, Graminoid, Vine, Lichenous, Nonvascular, and
  others.

## Source

USDA PLANTS Database: <https://plants.sc.egov.usda.gov/>

Data obtained from: <https://data.plantatlas.ai>

## Details

The `symbol` column is the primary key and can be used to join with
[plant_characteristics](https://kjhealy.github.io/usdaplants/reference/plant_characteristics.md)
and
[plant_distribution](https://kjhealy.github.io/usdaplants/reference/plant_distribution.md).

Multi-valued fields (`duration` and `growth_habit`) are stored as
comma-separated strings. Use
[`grepl()`](https://rdrr.io/r/base/grep.html) or
[`stringr::str_detect()`](https://stringr.tidyverse.org/reference/str_detect.html)
to filter, e.g., `dplyr::filter(plants, grepl("Tree", growth_habit))`.

## Examples

``` r
plants
#> # A tibble: 32,800 × 9
#>    symbol scientific_name     common_name group_name rank  family genus duration
#>    <chr>  <chr>               <chr>       <chr>      <chr> <chr>  <chr> <chr>   
#>  1 ECTE5  Echinoplaca tetrap… echinoplac… Lichen     Spec… Gomph… Echi… NA      
#>  2 ACSC5  Acarospora schleic… Schleicher… Lichen     Spec… Acaro… Acar… NA      
#>  3 BALO6  Bacidia lobarica P… dotted lic… Lichen     Spec… Bacid… Baci… NA      
#>  4 CLSU7  Cladina subtenuis … reindeer l… Lichen     Spec… Clado… Clad… NA      
#>  5 CLCR2  Cladonia cristatel… British so… Lichen     Spec… Clado… Clad… NA      
#>  6 ASDE19 Aspicilia desertor… desert asp… Lichen     Spec… Hymen… Aspi… NA      
#>  7 ASFR11 Aspicilia fruticul… NA          Lichen     Spec… Hymen… Aspi… NA      
#>  8 JADO   Japewiella dollypa… Dolly Part… Lichen     Spec… Lecan… Jape… NA      
#>  9 LEAN20 Lecanora anakeesti… Anakeesta … Lichen     Spec… Lecan… Leca… NA      
#> 10 LECO17 Lecanora conizaeoi… rim lichen  Lichen     Spec… Lecan… Leca… NA      
#> # ℹ 32,790 more rows
#> # ℹ 1 more variable: growth_habit <chr>

# Trees only
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
