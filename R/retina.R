# retina
#' Return information about the Retina
#'
#' This function is not that useful, it returns basic information about the
#' current state of the two retinas in use.
#'
#' @param retina_name one of NULL,  en_associative or en_synomous see retina.
#' @param api_key your key, if you saved the key in .renviron leave this NULL.
#'
#' @return information about the retina (database of words)
#' @export
cortical_retina <- function(retina_name = NULL,api_key = NULL){
  #input control
  retina_name <- retina_checker(retina_name)
  #response.
  response <- cortical_api(path = "rest/retinas",
                           querylist = list(
                             retina_name = retina_name
                           ),
                           api_key = api_key(api_key))
  response <- statuscode_decoder(response)
}


# response parser.
# Retina {
#   retinaName (string, optional): The identifier of a specific retina,
#   numberOfTermsInRetina (integer, optional): The number of terms contained in a specific retina,
#   numberOfRows (integer, optional): Number of rows of the fingerprints,
#   numberOfColumns (integer, optional): Number of columns of the fingerprints,
#   description (string, optional): The description of a specific retina
# }