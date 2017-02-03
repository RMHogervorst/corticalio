# TERM
#
#
#
# terms/
# Implementation Notes
# When the term parameter for this endpoint is not specified, a listing of all
# terms in the retina will be returned.
# Otherwise this endpoint returns a term object with meta-data for an exact
# match, or a list of potential retina terms if the string contains one or
# more of the wildcard characters, '*' and '?'. The wildcard characters must
# be initially preceded by at least 3 characters.
# The asterisk wildcard, '*', represents zero or more characters.
# The question mark wildcard, '?', represents exactly one character.
# If the start_index parameter for this method is not specified, the default of 0 will be assumed.
# If the max_results parameter for this method is not specified, the default of 10 will be assumed.
# For this method the maximum number of results per page is limited to 1000.
#
# retina_name = "en_associative", term, start_index=0, max_results = 10, get fingerprint = FALSE

#' Find word in retina
#'
#' This function returns what the term means for the retina.
#' Results include df, score, and position types such as adjective, or noun.
#'
#' @section Advanced Search:
#' This endpoint returns a term object with meta-data for an exact match, or
#' a list of potential retina terms if the string contains one or more of the
#' wildcard characters, '*' and '?'. The wildcard characters must be initially
#' preceded by at least 3 characters. The asterisk wildcard, '*', represents
#' zero or more characters. The question mark wildcard, '?', represents
#' exactly one character.
#' Information copied straight from the website \link{http://api.cortical.io/}
#'
#' @param term the search word that you would like to search for
#' @param retina_name one of en_associative or en_synomous see retina.
#' @param start_index start of the index (if multiple pages are returned)
#' @param max_results maximum number of result per page.
#' @param get_fingerprint true or false, return sparse matrix representation
#' @param api_key your key, if you saved the key in .renviron leave this NULL.
#' @family terms
#'
#' @return a description of the word in the retina.
#' @export
#'
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

#' Find context where this word is used in the retina
#'
#' Describes what contexts this word is used in.
#' @inheritParams cortical_terms
#' @family terms
#'
#' @return a description of the context of this word in the retina.
#' @export
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


#' Find similar words in retina
#'
#' Returns similar words. For instance cat would return tiger.
#'
#' @param term the search word that you would like to search for
#' @param retina_name one of en_associative or en_synomous see retina.
#' @param start_index start of the index (if multiple pages are returned)
#' @param max_results maximum number of result per page.
#' @param get_fingerprint true or false, return sparse matrix representation
#' @param api_key your key, if you saved the key in .renviron leave this NULL.
#' @family terms
#'
#' @return similar words
#' @export
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
