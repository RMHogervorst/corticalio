# retina
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