## Prepare plots and tables for report

## Before:
## After:

library(icesTAF)

mkdir("report")

source("report-plots-and-tables.R")

rmarkdown::render("report-ETC_1.6.1.2_CLIM015-MAR011.Rmd")

# create upload zip
files <-
  c(
    file.path("output", dir("output")),
    file.path("report", dir("report")),
    dir(pattern = "*.docx")
  )

zip("report/CLIM015-MAR011.zip", files, extras = "-j")
