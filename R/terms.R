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
  response <- httr::GET(url =  modify_url(url = "http://api.cortical.io/", port = 80, path = "rest/terms",
                                               query = list(retina_name = retina_name,
                                                            term = term,
                                                            start_index = start_index,
                                                            max_results = max_results,
                                                            get_fingerprint = get_fingerprint
                                               )),
            add_headers(`api-key`= api_key(api_key)))
  response <- statuscode_decoder(response)
  # do something with response.
  response

}

object3 <- cortical_terms(term = "hotdog")
object_with_fingerprint <- cortical_terms(term = "shoe", get_fingerprint = TRUE)
status_code(object3)
# works!.
#
#
# terms/contexts
# retina name term start index, max_results. get fingerprint
cortical_terms_context <- function(term,retina_name = "en_associative", start_index=0,
                                   max_results = 10, get_fingerprint = FALSE, api_key = NULL){
  response <- httr::GET(url =  modify_url(url = "http://api.cortical.io/", port = 80, path = "rest/terms/contexts",
                                          query = list(retina_name = retina_name,
                                                       term = term,
                                                       start_index = start_index,
                                                       max_results = max_results,
                                                       get_fingerprint = get_fingerprint
                                          )),
                        add_headers(`api-key`= api_key(api_key)))
  response <- statuscode_decoder(response)
  # do something with response.
  response

}
#
terms_context_response <- cortical_terms_context(term = "keyring")


# terms/similar_terms
#
#