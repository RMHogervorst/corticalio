# helperfunctions
#
cortical_api <- function(path, querylist, api_key = NULL){
  object <- httr::GET(url =  httr::modify_url(url = "http://api.cortical.io/", port = 80, path = path,
                              query = querylist),
            httr::add_headers(`api-key`= api_key(api_key)),
            httr::user_agent("https://github.com/RMHogervorst/corticalio"))
  object
}

cortical_api_post <- function(path, querylist, body , api_key_ = NULL){
  key <- api_key(api_key_)
  object <- httr::POST(url =  httr::modify_url(url = "http://api.cortical.io/",
                                         port = 80,
                                         path = path,
                                         query = querylist),
                       httr::add_headers(`api-key`= key),
                       httr::user_agent("https://github.com/RMHogervorst/corticalio"),
                       body = body,
                       encode = "json"
                       )
  object
}



# extract_content <- function(object){
#   jsonlite::fromJSON(
#     rawToChar(object[["content"]])
#   )
#
# }
# $content %>% rawToChar( ) %>% fromJSON()
# request_get <- function(endpoint, term){
#   GET(url = cortical_api(path = endpoint), query = construct_query_(term = term),
#       add_headers(`api-key`= ))
# }


#' Find or define API key for cortical.io
#'
#' This function is not for direct use.
#'
#' @param key "quoted" key or by default searches in .Renviron en Sys.setenv
#'
#' @return key
api_key <- function(key = NULL){
  if(is.null(key)){
    key <- find_cortical_token()
  }#else{
  #  message("Setting key for this session")
  #  Sys.setenv(CORTICALIO_KEY = key)
  #}
  key
}


# This function tries to find the
# api key necessary for this api to work.
#
#
find_cortical_token <- function(){
  # if the key is already loaded, there is no need for other actions.
  if(Sys.getenv("CORTICALIO_KEY")==""){
    location <- normalizePath("~/.Renviron")
    # if the file exists read the key.
    if(file.exists(location)){
      token <- Sys.getenv("CORTICALIO_KEY")
      if(token == ""){
        key <- set_corticalio_key()
      }
    }else{ # if there is no file, offer to create file.
      message("you have no .Renviron file")
      choice <- readline("Do you  want to create that file? (y/n) ")
      if(choice== "y"){
        writeLines("CORTICALIO_KEY = ",file.path(normalizePath("~/"), ".Rtest") )
        utils::file.edit(file.path(normalizePath("~/"), ".Renviron"))
      }else if(choice == "n"){
        message("You will have this message every time")
        key <- set_corticalio_key()
      }
    }
  }else{
    key <- Sys.getenv("CORTICALIO_KEY")
  }
  key
}

check_api_key <- function(){
  Sys.getenv("CORTICALIO_KEY")
}


# key writing function
# don't export, internal function.
# returns error or key (also sets it in local env)
set_corticalio_key <- function(){
  message("No corticalio key found")
  key <- readline("Please enter your corticalio api key: ")
  key <- ifelse(grepl("\\D",key),-1,key)
  if(is.na(key)|key== ""){stop("no key given")
  }else{
    message("writing key, \nif you don't want to repeat this process every time \n use the function add_key_to_renviron()")
    Sys.setenv(CORTICALIO_KEY = key)
  }
  key
}

# return object when statuscode is 200, otherwise
# throws error and type of error.
statuscode_decoder <- function(object){
  stopifnot(class(object)=="response")
  stat_code <- object[["status_code"]]
  if(stat_code != 200){
   type <- ifelse(stat_code == 400, "incorrect request: ",
                  ifelse(stat_code == 404, "resource not found: ",
                         ifelse(stat_code == 500, " possible database or I/O error: ",
                                ifelse(stat_code ==401, "Unauthorized Access: ",
                                       paste0("other error type: ",stat_code )))))
    stop(type,rawToChar(object$content) )
  }else{
    output <- object
  }
  output

}

# result <- content(object3,as = "text")
# str(unlist(result))
# jsonlite::fromJSON(result)
#
# content(object3, as = "parsed")[[1]]$fingerprint



# term_response_to_dataframe(object3)
# term_response_to_dataframe(object_with_fingerprint)

# work in this later.
# Probably sparse matrix, have to find a way to
# put these values into a Sparse Matrix.
# I guess that the values are the numbers that are active.
# get_fingerprint <- function(object){
#   fingerprint <- content(object, as = "parsed")[[1]]$fingerprint
#   as_matrix(fingerprint)
# }
# get_fingerprint(object_with_fingerprint)
#
# bla <- content(object_with_fingerprint)[[1]]$fingerprint
# View(as.matrix(bla$positions,nrow = 128, ncol = 128, byrow = FALSE) )


# terms_context_response
# reply <- content(terms_context_response, as = "parsed")


#term_context_to_dataframe(terms_context_response)


retina_checker <- function(retina_name = NULL){
  if(!is.null(retina_name) ){
    if(!retina_name %in% c("en_associative", "en_synonymous") ){
      stop("retina_name needs to be empty, en_associative or en_synonymous")
    }
  }
  retina_name
}

# to json decoder.
# load jsonfile
# give example list that are converted to json.
# option raw, file, list
# check list for valid things?