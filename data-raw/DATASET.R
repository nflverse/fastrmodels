# This is how the models in this package were stored initially to save runtime
# however please see the file MODELS.R for how they were created
ep_model <- nflfastR:::ep_model
wp_model <- nflfastR:::wp_model
wp_model_spread <- nflfastR:::wp_model_spread
fg_model <- nflfastR:::fg_model
cp_model <- nflfastR:::cp_model

# xyac
load(url("https://github.com/guga31bb/nflfastR-data/blob/master/models/xyac_model.Rdata?raw=true"))

# xpass
load(url("https://github.com/guga31bb/nflfastR-data/blob/master/models/xpass_model.Rdata?raw=true"))

# save models to use in package
usethis::use_data(
  ep_model,
  wp_model,
  wp_model_spread,
  fg_model,
  cp_model,
  xyac_model,
  xpass_model,
  internal = TRUE,
  overwrite = TRUE,
  compress = "xz",# one of "gzip", "bzip2", or "xz"
  version = 3
)

tools::checkRdaFiles("R")
