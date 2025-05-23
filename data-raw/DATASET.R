# This is how the models in this package were stored initially to save runtime
# however please see the file MODELS.R for how they were created
ep_model <- fastrmodels::ep_model
wp_model <- fastrmodels::wp_model
wp_model_spread <- fastrmodels::wp_model_spread
fg_model <- fastrmodels::fg_model
cp_model <- fastrmodels::cp_model
xyac_model <- fastrmodels::xyac_model
xpass_model <- fastrmodels::xpass_model

# xgboost >= 1.6.0 warned the user because of old serialization formats.
# So we save the models in the suggested serialized json format, read them
# back in and save the in the package again.
#
# UPDATE 2023-07-28: had to do this again with xgboost 1.7.5.1
# UPDATE 2024-01-24: had to do this again with xgboost 1.7.6.1
# I am concerned we will have to do this every year, or even multiple times per year smh.
# See you all in 2024 with xgboost 1.8.x
# UPDATE 2024-06-05: Models re-exported with xgboost 1.7.7.1
# UPDATE 2025-05-12: re-exporting under each version doesn't make any sense.
#                    Trying new approach by saving as raw vectors.
#                    Requires update of nflfastR
xgboost::xgb.save(ep_model, "ep_model.ubj")
xgboost::xgb.save(wp_model, "wp_model.ubj")
xgboost::xgb.save(wp_model_spread, "wp_model_spread.ubj")
xgboost::xgb.save(cp_model, "cp_model.ubj")
xgboost::xgb.save(xyac_model, "xyac_model.ubj")
xgboost::xgb.save(xpass_model, "xpass_model.ubj")

# these are raw model vectors now. xgboost constructs the models of them
# this will be compatible with future versions
# MODELS NOW LIVE IN https://github.com/nflverse/fastrmodels/releases/tag/model_archive
ep_model <- xgboost::xgb.load("data-raw/ep_model.ubj") |> xgboost::xgb.Booster.complete() |> xgboost::xgb.save.raw()
wp_model <- xgboost::xgb.load("data-raw/wp_model.ubj") |> xgboost::xgb.Booster.complete() |> xgboost::xgb.save.raw()
wp_model_spread <- xgboost::xgb.load("data-raw/wp_model_spread.ubj") |> xgboost::xgb.Booster.complete() |> xgboost::xgb.save.raw()
fg_model <- fastrmodels::fg_model
cp_model <- xgboost::xgb.load("data-raw/cp_model.ubj") |> xgboost::xgb.Booster.complete() |> xgboost::xgb.save.raw()
xyac_model <- xgboost::xgb.load("data-raw/xyac_model.ubj") |> xgboost::xgb.Booster.complete() |> xgboost::xgb.save.raw()
xpass_model <- xgboost::xgb.load("data-raw/xpass_model.ubj") |> xgboost::xgb.Booster.complete() |> xgboost::xgb.save.raw()

# save models to use in package
usethis::use_data(
  ep_model,
  wp_model,
  wp_model_spread,
  fg_model,
  cp_model,
  xyac_model,
  xpass_model,
  internal = FALSE,
  overwrite = TRUE,
  compress = "xz",# one of "gzip", "bzip2", or "xz"
  version = 3
)
