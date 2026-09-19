#!/bin/bash

# National Panel Survey 2019-2020
wget -O nps_2019_2020.csv \
  "https://microdata.worldbank.org/catalog/3902/download/50136"

# # FAOSTAT crop production - Africa
# wget -O production_crops_livestock_africa.zip \
#   "https://bulks-faostat.fao.org/production/Production_Crops_Livestock_E_Africa.zip"

# CHIRPS rainfall data for Uganda
wget -O chirps_uganda.zip \
"https://climateserv.servirglobal.net/api/getFileForJobID/?id=6d6bc493-0a8f-49a9-a25a-5c3b0664bd0e"