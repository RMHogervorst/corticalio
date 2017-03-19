# Text
# A bit more complicated because of the post requirement.


#' Get a retina representation of a text
#'
#' Returns a representation of the text.
#'
#' @param text input a character vector:  "a small lamb walked ..."
#' @param retina_name one of en_associative or en_synomous see retina.
#' @param api_key your key, if you saved the key in .renviron leave this NULL.
#'
#' @return a representation of the text
#' @export
#'
#' @family text
cortical_text_representation <- function(text ,retina_name = "en_associative", api_key = NULL){
  # check that text is utf-8.
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  response <- cortical_api_post(path = "rest/text",
                                querylist = list(retina_name = retina_name),
                                body = text,
                                api_key = api_key)
  response <- statuscode_decoder(response)
  response
}


#
# post /text/keywords
# Get a list of keywords from the text
# body
#

#' Get a list of keywords that represent the text according to Cortical.io
#'
#' @inheritParams cortical_text_representation
#' @return a list of keywords
#' @family text
#' @export
cortical_text_keywords <- function(text ,retina_name = "en_associative", api_key = NULL){
  # check that text is utf-8.
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  response <- cortical_api_post(path = "rest/text/keywords",
                                querylist = list(retina_name = retina_name),
                                body = text,
                                api_key = api_key)
  response <- statuscode_decoder(response)
  response
}

#
# post /text/tokenize
# Get tokenized input text
#
# body. POStags (opt)
#' Tokenize the words or return only the part of speech (POS) parts
#'
#' Send a text and return seperate words or only nouns, verbs,adjectives, etc
#' or a combination.
#' \url{http://documentation.cortical.io/working_with_text.html#pos-tags}
#'
#' @inheritParams cortical_text_representation
#' @param pos_tags a character representation such as "NNS" for nouns. see the link.
#' @return seperate words or only the part of speech you asked for
#' @family text
#' @export
cortical_text_tokenize <- function(text, pos_tags = NULL,retina_name = "en_associative", api_key = NULL){
  # check that text is utf-8.
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  response <- cortical_api_post(path = "rest/text/tokenize",
                                querylist = list(retina_name = retina_name,
                                                 POStags = pos_tags),
                                body = text,
                                api_key = api_key)
  response <- statuscode_decoder(response)
  response
}
#
# post /text/slices
# Get a list of slices of the text
# body, start_index, max result, get fingerprint. (part of query)

#' Slice the text up
#'
#' Returns an ordered list of text objects (ordered according to where the text
#' slice appears in the input text). A Text object consists of a text slice
#' (defined as a slice by the Retina) and a Fingerprint object corresponding
#' to the text slice.
#'
#' @inheritParams cortical_text_representation
#' @param start_index start of the index (if multiple pages are returned)
#' @param max_results maximum number of result per page.
#' @param get_fingerprint true or false, return sparse matrix representation
#' @return results
#' @export
#' @family text
cortical_text_slices <- function(text, retina_name = "en_associative",
                                   start_index=0,
                                   max_results = 10, get_fingerprint = FALSE,
                                   api_key = NULL){
  # check that text is utf-8.
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  response <- cortical_api_post(path = "rest/text/slices",
                                querylist = list(retina_name = retina_name,
                                                 start_index=start_index,
                                                 max_results = max_results,
                                                 get_fingerprint = get_fingerprint),
                                body = text,
                                api_key = api_key)
  response <- statuscode_decoder(response)
  response
}


#
# post /text/bulk
# Bulk get Fingerprint for text.
# # a bit more complicated, needs json list of texts.
# # a special constructor needed. { "text" : "the text"},{ "text" : "the text"}, etc
# # body

#
# post /text/detect_language
# body

#' Detect language of a text
#'
#' Post a piece of text to cortical.io to detect the language.
#' This endpoint will detect the language of an input text. It is capable
#' of identifying more than 50 languages. For best results it is recommended
#' that input texts consist of a minimum of 10 words (approximately 40 to 50
#' characters).
#' \url{http://api.cortical.io/Text.htm#!/text/getLanguage_post_5}
#'
#' @param text input a character vector:  "a small lamb walked ..."
#' @param api your key, if you saved the key in .renviron leave this NULL.
#' @return a list of language, iso tag and possible link to wikipedia
#' @export
#' @family text
cortical_text_language <- function(text,
                                 api_key = NULL){
  # check that text is utf-8.
  response <- cortical_api_post(path = "rest/text/detect_language",
                                querylist = NULL,
                                body = text,
                                api_key = api_key)
  response <- statuscode_decoder(response)
  response
}

