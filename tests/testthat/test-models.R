test_that("models are structured as expected", {
  # test raw model types
  expect_type(ep_model, "raw")
  expect_type(cp_model, "raw")
  expect_type(wp_model, "raw")
  expect_type(wp_model_spread, "raw")
  expect_type(xpass_model, "raw")
  expect_type(xyac_model, "raw")
  expect_type(fg_model, "list")

  # test length of raw model vectors
  expect_length(ep_model, 9737490L)
  expect_length(cp_model, 925080L)
  expect_length(wp_model, 106989L)
  expect_length(wp_model_spread, 1219925L)
  expect_length(xpass_model, 8378743L)
  expect_length(xyac_model, 48418214L)
  expect_length(fg_model, 54L)

  # load raw models in xgboost
  parsed_ep_model <- xgboost::xgb.load.raw(ep_model)
  parsed_cp_model <- xgboost::xgb.load.raw(cp_model)
  parsed_wp_model <- xgboost::xgb.load.raw(wp_model)
  parsed_wp_model_spread <- xgboost::xgb.load.raw(wp_model_spread)
  parsed_xpass_model <- xgboost::xgb.load.raw(xpass_model)
  parsed_xyac_model <- xgboost::xgb.load.raw(xyac_model)

  # verify class of all parsed models
  expect_s3_class(parsed_ep_model, "xgb.Booster")
  expect_s3_class(parsed_cp_model, "xgb.Booster")
  expect_s3_class(parsed_wp_model, "xgb.Booster")
  expect_s3_class(parsed_wp_model_spread, "xgb.Booster")
  expect_s3_class(parsed_xpass_model, "xgb.Booster")
  expect_s3_class(parsed_xyac_model, "xgb.Booster")
  expect_s3_class(fg_model, c("bam", "gam", "glm", "lm"), exact = TRUE)

  # snapshot print method of xgboost models
  # just as an additional layer of security guarding against breaking
  # xgboost changes
  expect_snapshot(print(parsed_ep_model), cran = TRUE)
  expect_snapshot(print(parsed_cp_model), cran = TRUE)
  expect_snapshot(print(parsed_wp_model), cran = TRUE)
  expect_snapshot(print(parsed_wp_model_spread), cran = TRUE)
  expect_snapshot(print(parsed_xpass_model), cran = TRUE)
  expect_snapshot(print(parsed_xyac_model), cran = TRUE)
})
