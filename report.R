## Prepare plots and tables for report

## Before:
## After:

library(icesTAF)

mkdir("report")

source("report-plots-and-tables.R")

rmarkdown::render("report-ETC_1.6.1.2_CLIM015-MAR011.Rmd")

# create a readme for the zip
cat(
"README

The contents of this zip file contains several csv files and images.
There are results for both ICES divisions and MSFD european sea
regions, indicated by a suffix on the file name.

",
  file = "report/README.txt"
)

# create upload zip
files <-
  c(
    file.path("model", dir("model")),
    file.path("output", dir("output")),
    file.path("report", dir("report")),
    dir(pattern = "*.docx")
  )

zip("report/CLIM015-MAR011.zip", files, extras = "-j")
