# test terms
context("terms part of the api")
# call objects
cortical_terms_object<- cortical_terms(term = "hotdog", api_key = NULL)
terms_context_response <- cortical_terms_context(term = "keyring")
terms_context_similar <- cortical_similar_terms(term = "shoe")


test_that("terms return valid responses", {
  expect_equal(status_code(cortical_terms_object), 200)
  expect_equal(status_code(terms_context_response), 200)
  expect_equal(status_code(terms_context_similar), 200)
})


# test parsers.
term_context_to_dataframe(terms_context_response)


test_that("fingerprint works", {
  object_with_fingerprint <- cortical_terms(term = "shoe", get_fingerprint = TRUE)

})

