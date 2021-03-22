
#Get grid_data
cdo griddes "wrfinput_d01" >> grid.wrf
#Keep gridID 1, remove all other grid information
Rscript grid_extract.R



