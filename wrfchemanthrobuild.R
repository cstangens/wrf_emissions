###Anthropogenic emissions for WRF
setwd("/home/christian/Seafile/BOKU/code/R/wrf/wrf_emis")

library(eixport)
library(ncdf4)
library(raster)
library(sp)


###### Emission data 
#emis_input <- nc_open("~/BOKU_lok/data/cams_reg_ap/CAMS-REG-AP_EUR_0.05x0.1_anthro_CH4_yearly.nc")




vars_to_add <- readLines("vars_for_bdy")

wrfinput <- nc_open("wrfinput_d01")
t_wrfinput <- ncvar_get(wrfinput,"T")


## Weg geht anscheinend nur über ncvar +

##https://ibarraespinosa.github.io/VEINBOOK/ep.html


#plot(lon, lat)

#####Create wrf emision input file

wrfinput <- "wrfinput_d01"

wrfgrid <- wrf_grid(wrfinput, as_raster = T)

wrf_create(
  wrfinput_dir = getwd(),
  wrfchemi_dir = getwd(),
  domains = 1,
  frames_per_auxinput5 = 1,
  auxinput5_interval_m = 60,
  day_offset = 0,
  io_style_emissions = 2,
  kemit = 1,
  variables = "eradmsorg",
  n_aero = 14,
  COMPRESS = NA,
  force_ncdf4 = FALSE,
  title = "Anthropogenic emissions for WRF V4.0",
  separator = "default",
  verbose = FALSE
)

data("emis_opt")


list.files()
emis_file = nc_open(".nc")
emis_var = ncvar_get(emis_file,"SumAllSectors")

wrf_add("wrfchemi_d01_2017-12-25_23:00:00", name = "E_CH4", emis_var[,,1])

ncvar_def()

###### WRFINPUT anschauen 



#####Preproc

starttime = as.POSIXct("2021-07-01 00:00:00")
endtime = as.POSIXct("2021-12-31 00:00:00")
endtime - starttime  




