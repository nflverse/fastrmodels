
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
# UPDATE 2025-12-06: Above didn't work with release of xgboost 3.0.0 on CRAN,
#                    newest xgboost docs suggest that saveRDS will magically
#                    work again. I think in the 2026 offseason we will need to
#                    adapt nflfastR to cache the ubj files from github at predict
#                    time (and deprecate this package altogether).  - Tan

# UBJ MODELS LIVE IN https://github.com/nflverse/fastrmodels/releases/tag/model_archive
piggyback::pb_download(tag = "model_archive", dest = "data-raw")
usethis::use_git_ignore("data-raw/*.ubj")

ep_model <- xgboost::xgb.load("data-raw/ep_model.ubj")
wp_model <- xgboost::xgb.load("data-raw/wp_model.ubj")
wp_model_spread <- xgboost::xgb.load("data-raw/wp_model_spread.ubj")
fg_model <- fastrmodels::fg_model
cp_model <- xgboost::xgb.load("data-raw/cp_model.ubj")
xyac_model <- xgboost::xgb.load("data-raw/xyac_model.ubj")
xpass_model <- xgboost::xgb.load("data-raw/xpass_model.ubj")

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
