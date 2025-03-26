# Antidepressant drug consumption per 1,000 people - Data package

This data package contains the data that powers the chart ["Antidepressant drug consumption per 1,000 people"](https://ourworldindata.org/grapher/antidepressants-per-capita?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website. It was downloaded on March 19, 2025.

### Active Filters

A filtered subset of the full data was downloaded. The following filters were applied:

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For normal countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

The third column is either "Year" or "Day". If the data is annual, this is "Year" and contains only the year as an integer. If the column is "Day", the column contains a date string in the form "YYYY-MM-DD".

The final column is the data column, which is the time series that powers the chart. If the CSV data is downloaded using the "full data" option, then the column corresponds to the time series below. If the CSV data is downloaded using the "only selected data visible in the chart" option then the data column is transformed depending on the chart type and thus the association with the time series might not be as straightforward.

## Metadata.json structure

The .metadata.json file contains metadata about the data package. The "charts" key contains information to recreate the chart, like the title, subtitle etc.. The "columns" key contains information about each of the columns in the csv, like the unit, timespan covered, citation for the data etc..

## About the data

Our World in Data is almost never the original producer of the data - almost all of the data we use has been compiled by others. If you want to re-use data, it is your responsibility to ensure that you adhere to the sources' license and to credit them correctly. Please note that a single time series may have more than one source - e.g. when we stich together data from different time periods by different producers or when we calculate per capita metrics using population data from a second source.

## Detailed information about the data


## N06A-Antidepressants (Consumption: DDD per 1,000 inhabitants per day)
This estimates of the daily intake of antidepressants per 1000 people, calculated as the 'defined daily dose' – the expected doses of antidepressants taken per 1000 people per day, according to the recommended dosages for each antidepressant. This enables us to compare overall levels of drug consumption, accounting for the fact that different antidepressants have different recommended dosages.
Last updated: May 1, 2023  
Date range: 2010–2021  
Unit: daily dose per 1,000 inhabitants per day  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
OECD (2022) – processed by Our World in Data

#### Full citation
OECD (2022) – processed by Our World in Data. “N06A-Antidepressants (Consumption: DDD per 1,000 inhabitants per day)” [dataset]. OECD (2022) [original data].
Source: OECD (2022) – processed by Our World In Data

### What you should know about this data

### Additional information about this data
The OECD Health Database offers the most comprehensive source of comparable statistics on health and health systems across OECD countries. It is an essential tool to carry out comparative analyses and draw lessons from international comparisons of diverse health systems.

This dataset is a subset of all the metrics in the database. More details at https://stats.oecd.org/OECDStat_Metadata/ShowMetadata.ashx?Dataset=HEALTH_PHMC&Lang=en


    