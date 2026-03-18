# This project

We are making a convenience data package for R. 

The dataset is the USDA PLANTS database, providing characteristics data for plant species in the USA. A typical page constructed (in part) from these data can be found here: <https://plants.sc.egov.usda.gov/plant-profile/GLTR>


We have two sources for the same dataset. The first is the file in `./data-raw/raw/usda-plants-8-1-2023.json`. This data come from this GitHub thread created after the previous API was removed: <https://github.com/USDA/USDA-APIs/issues/7> and specifically this comment: <https://github.com/USDA/USDA-APIs/issues/7#issuecomment-557136892> 

The second is the database downloadable from <https://data.plantatlas.ai>, which should be the same data. It is provided in `./data-raw/raw/plants.db`. Based on the website, the schema for the database is as follows:

```
:: plants
- Main plant data with JSON arrays for multi-valued fields
Column	Type	Description
id	INTEGER PRIMARY KEY	Plant ID
symbol	TEXT UNIQUE	USDA symbol (e.g., QUAC)
scientific_name	TEXT	Full scientific name
common_name	TEXT	Primary common name
growth_habits	TEXT (JSON)	JSON array: ["Tree", "Shrub"]
durations	TEXT (JSON)	JSON array: ["Perennial", "Annual"]

:: plant_distribution
- Native/introduced status by state (PRIMARY SOURCE)
Column	Type	Description
plant_id	INTEGER	References plants.id
native_states	TEXT (JSON)	JSON array of native states
introduced_states	TEXT (JSON)	JSON array of introduced states

:: plant_taxonomic_paths
- Pre-computed taxonomic hierarchy
Column	Type	Description
plant_id	INTEGER PRIMARY KEY	References plants.id
family	TEXT	Plant family
genus	TEXT	Plant genus
species	TEXT	Species name

:: plant_characteristics
- Growth and habitat data (~70 fields)
Column	Type	Description
plant_id	INTEGER	References plants.id
drought_tolerance	TEXT	High/Medium/Low/None
shade_tolerance	TEXT	Tolerant/Intolerant/Intermediate
height_mature_feet	TEXT	Mature height
ph_minimum	REAL	Min soil pH
ph_maximum	REAL	Max soil pH
```

From the database we are mostly interested in the `plants` and `plant_characteristics` tables.

Our goal is a tibble where each row is a plant. Eventually I will want to integrate some of this data with a separate package (on New York street trees). The data on plants and plant characteristics probably will not require any kind of database interface; it should fit into a tibble.