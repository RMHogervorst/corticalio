# test text part of cortical.io api
content("test the text part")

text_object <- cortical_text_representation("This is written on a windows computer in two thousand and seventeen")
text_similar <- cortical_text_keywords(text = "This is written on a windows computer in two thousand and seventeen")
text_tokenize <- cortical_text_tokenize(text = "This is written on a windows computer in two thousand and seventeen",pos_tags = "NNS")
text_slices <- cortical_text_slices(text = )
test_that("response is correct", {
  expect_equal(status_code(text_object), 200)
  expect_equal(status_code(text_similar), 200)
  expect_equal(status_code(text_tokenize), 200)
})



rm(text_object, text_similar,text_tokenize)