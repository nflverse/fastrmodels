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
xgboost::xgb.save(ep_model, "ep_model.ubj")
xgboost::xgb.save(wp_model, "wp_model.ubj")
xgboost::xgb.save(wp_model_spread, "wp_model_spread.ubj")
xgboost::xgb.save(cp_model, "cp_model.ubj")
xgboost::xgb.save(xyac_model, "xyac_model.ubj")
xgboost::xgb.save(xpass_model, "xpass_model.ubj")

ep_model <- xgboost::xgb.load("ep_model.ubj") |> xgboost::xgb.Booster.complete()
wp_model <- xgboost::xgb.load("wp_model.ubj") |> xgboost::xgb.Booster.complete()
wp_model_spread <- xgboost::xgb.load("wp_model_spread.ubj") |> xgboost::xgb.Booster.complete()
fg_model <- fastrmodels::fg_model
cp_model <- xgboost::xgb.load("cp_model.ubj") |> xgboost::xgb.Booster.complete()
xyac_model <- xgboost::xgb.load("xyac_model.ubj") |> xgboost::xgb.Booster.complete()
xpass_model <- xgboost::xgb.load("xpass_model.ubj") |> xgboost::xgb.Booster.complete()

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
