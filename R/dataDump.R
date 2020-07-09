library(data.table)
library(here)
library(readxl)
library(tidyverse)

files <- list.files(here("drive-download-20200709T182239Z-001/"), full.names = TRUE)[1:9]

# TODO
# Convert Elapsed_CallRcvdInQueue to seconds
# Multiplying it by 5
raw_df <- files %>%
    map_dfr(~read_excel(., col_types = c("text", "date", "text",
                                         "text", "text","text",
                                         "text","text","text",
                                         "text","text","text",
                                         "text","text","text",
                                         "text","text","text",
                                         "numeric","numeric","numeric",
                                         "numeric", "numeric", "numeric")))

df <- raw_df %>%
    mutate(Elapsed_CallRcvd2InQueue = Elapsed_CallRcvd2InQueue %>%
               as.numeric())
