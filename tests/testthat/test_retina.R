# test retina
context("retina endpoint")
retina_object <- cortical_retina()
test_that("retina function works", {
  expect_error(cortical_retina(retina_name = "beehive"), regexp = "retina_name needs to be empty, en_associative or en_synonymous")
  expect_equal(status_code(retina_object), 200)
  })
