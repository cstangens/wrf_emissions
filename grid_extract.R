setwd("/home/christian/Seafile/BOKU/code/R/wrf/wrf_emis")

wrf_grid <- readLines("grid.wrf")

gridext <-grep('gridID 2', wrf_grid)

wrf_grid <- wrf_grid[1:gridext-1]

writeLines(wrf_grid, "grid.wrf")
