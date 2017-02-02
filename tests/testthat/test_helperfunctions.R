## tests
context("test helperfunctions")
## save object2 or do a request without api key.
## expect_error (http_decoder(object2), "Unauthorized Access")
## expect_silent(http_decoder(test))
## expect error ( do incorrect request, 400)
test_that("", {
  expect_error(retina_checker("bla"), "retina_name needs to be empty, en_associative or en_synonymous")
  expect_equal(retina_checker(), NULL)
})

##
##