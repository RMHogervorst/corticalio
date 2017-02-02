# TERM
#
#
#
# terms/
# Implementation Notes
# When the term parameter for this endpoint is not specified, a listing of all terms in the retina will be returned. Otherwise this endpoint returns a term object with meta-data for an exact match, or a list of potential retina terms if the string contains one or more of the wildcard characters, '*' and '?'. The wildcard characters must be initially preceded by at least 3 characters.
# The asterisk wildcard, '*', represents zero or more characters.
# The question mark wildcard, '?', represents exactly one character.
# If the start_index parameter for this method is not specified, the default of 0 will be assumed.
# If the max_results parameter for this method is not specified, the default of 10 will be assumed.
# For this method the maximum number of results per page is limited to 1000.
#
# retina_name = "en_associative", term, start_index=0, max_results = 10, get fingerprint = FALSE
cortical_terms <- function(term,retina_name = "en_associative", start_index=0,
                           max_results = 10, get_fingerprint = FALSE, api_key = NULL){
  #url <- cortical_api("terms/")
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  response <- cortical_api(path = "rest/terms",
                          querylist = list(retina_name = retina_name,
                                           term = term,
                                           start_index = start_index,
                                           max_results = max_results,
                                           get_fingerprint = get_fingerprint
                          ))
   response <- statuscode_decoder(response)
  # do something with response.
  response

}

#
#
# terms/contexts
# retina name term start index, max_results. get fingerprint
cortical_terms_context <- function(term,retina_name = "en_associative", start_index=0,
                                   max_results = 10, get_fingerprint = FALSE, api_key = NULL){
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  response <- cortical_api(path = "rest/terms/contexts",
                           querylist = list(
                             retina_name = retina_name,
                             term = term,
                             start_index = start_index,
                             max_results = max_results,
                             get_fingerprint = get_fingerprint
                           ),
                           api_key = api_key)
  response <- statuscode_decoder(response)
  # do something with response.
  response

}
#

# terms/similar_terms
#
cortical_similar_terms <- function(term,retina_name = "en_associative", start_index=0,
                                   max_results = 10,pos_type = NULL, get_fingerprint = FALSE, api_key = NULL){
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  if(!is.null(pos_type)){
    if(!pos_type %in% c("NOUN", "ADJECTIVE", "VERB")){
      stop("pos_type needs to be NULL, NOUN, ADJECTIVE, VERB")
    }
  }
  response <- cortical_api(path = "rest/terms/similar_terms",
                           querylist = list(
                             retina_name = retina_name,
                             term = term,
                             start_index = start_index,
                             max_results = max_results,
                             pos_type = pos_type,
                             get_fingerprint = get_fingerprint
                           ),
                           api_key = api_key)
  response <- statuscode_decoder(response)
  # do something with response.
  response
}
