### compare ###
# Compare

#'
#'@export
cortical_compare <- function(text ,retina_name = "en_associative",
                             api_key_ = NULL){
  # tODO change the list to json. and check if valid
  json <- jsonlite::toJSON(text)
  # TODO check that text is utf-8.
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  response <- cortical_api_post(path = "rest/compare",
                                querylist = list(retina_name = retina_name),
                                body = json,
                                api_key = api_key_)
  response <- statuscode_decoder(response)
  response
}

# Compare bulk
cortical_compare_bulk <- function(text ,retina_name = "en_associative", api_key = NULL){
  # check that text is utf-8.
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  response <- cortical_api_post(path = "rest/compare/bulk",
                                querylist = list(retina_name = retina_name),
                                body = text,
                                api_key = api_key)
  response <- statuscode_decoder(response)
  response
}