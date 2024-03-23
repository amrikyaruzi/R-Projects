# radian

library(tidyverse)
library(httr2)

# WHO

## list of dimensions
httr2::request("https://ghoapi.azureedge.net/api/Dimension") %>%
  req_perform() %>%
  resp_body_json() %>%
  glimpse()


## indicator list
httr2::request("https://ghoapi.azureedge.net/api/Indicator") %>%
  req_perform() %>%
  resp_body_json() %>%
  glimpse()

indicator_body <- httr2::request("https://ghoapi.azureedge.net/api/Indicator") %>%
  req_perform() %>%
  resp_body_json()


indicator_body %>%
  pluck("value", 1, "IndicatorCode")


indicator_body %>%
  pluck("value", 1, "IndicatorName")


indicators_length <- pluck(indicator_body, "value") %>% length()

indicators <- map_dfr(1:indicators_length,
                      .f = ~data.frame(
                        IndicatorCode = indicator_body %>% pluck("value", .x, "IndicatorCode"),
                        IndicatorName = indicator_body %>% pluck("value", .x, "IndicatorName")
                      ))

indicators <- map_dfr(1:indicators_length,
                      \(x) tibble(
                        IndicatorCode = indicator_body %>% pluck("value", x, "IndicatorCode"),
                        IndicatorName = indicator_body %>% pluck("value", x, "IndicatorName")
                      ))


map_dfr(1:indicators_length,
        .f = ~data.frame(
          IndicatorCode = indicator_body %>% pluck("value", .x, "IndicatorCode"),
          IndicatorName = indicator_body %>% pluck("value", .x, "IndicatorName")
        ))

### Caesarean section data (Births by caesarean section (in the two or three years preceding the survey) (%))
csection <- httr2::request("https://ghoapi.azureedge.net/api/csection") %>%
  req_perform() %>%
  resp_body_json() #%>% glimpse()


tictoc::tic()
csection_data <- future_map_dfr(1:length(pluck(csection, "value")),
                                \(x) tibble(
                                  Id = csection %>% pluck("value", x, "Id"),
                                  IndicatorCode = csection %>% pluck("value", x, "IndicatorCode"),
                                  SpatialDimType = csection %>% pluck("value", x, "SpatialDimType"),
                                  SpatialDim = csection %>% pluck("value", x, "SpatialDim"),
                                  ParentLocationCode = csection %>% pluck("value", x, "ParentLocationCode"),
                                  TimeDimType = csection %>% pluck("value", x, "TimeDimType"),
                                  ParentLocation = csection %>% pluck("value", x, "ParentLocation"),
                                  Dim1Type = csection %>% pluck("value", x, "Dim1Type"),
                                  TimeDim = csection %>% pluck("value", x, "TimeDim"),
                                  Dim1 = csection %>% pluck("value", x, "Dim1"),
                                  DataSourceDimType = csection %>% pluck("value", x, "DataSourceDimType"),
                                  DataSourceDim = csection %>% pluck("value", x, "DataSourceDim"),
                                  Value = csection %>% pluck("value", x, "Value"),
                                  NumericValue = csection %>% pluck("value", x, "NumericValue"),
                                  Low = csection %>% pluck("value", x, "Low"),
                                  High = csection %>% pluck("value", x, "High"),
                                  Date = csection %>% pluck("value", x, "Date"),
                                  TimeDimensionValue = csection %>% pluck("value", x, "TimeDimensionValue"),
                                  TimeDimensionBegin = csection %>% pluck("value", x, "TimeDimensionBegin"),
                                  TimeDimensionEnd = csection %>% pluck("value", x, "TimeDimensionEnd")
                                ))

tictoc::toc()

# UNDP

undp_base_url <- "https://api.open.undp.org/"
undp_response <- request(undp_base_url)

## CRS-Index
undp_crs_json_response <- undp_response %>%
  req_url_path("/api/crs-index.json/") %>%
  req_perform() %>%
  resp_body_json()


undp_crs_index <- map_dfr(
  .x = 1:length(undp_crs_json_response),
  .f = \(x) tibble(
    name = pluck(undp_crs_json_response, x, "name"),
    id = pluck(undp_crs_json_response, x, "id")
    ))



## Donor Countries
donor_countries_json_response <- undp_response %>% 
  req_url_path("/api/donor-country-index.json") %>%
  req_perform() %>%
  resp_body_json()

donor_countries_json_response %>%
  glimpse()

donor_countries_json_response %>%
  pluck(2)
