#### responses to dataframe ####
####

term_response_to_dataframe <- function(object){
  reply <- httr::content(object, as = "parsed")
  result <- data.frame(
    term = reply[[1]][["term"]],
    df =   reply[[1]][["df"]],
    score = reply[[1]][["score"]],
    pos_type = as.list(reply[[1]][["pos_types"]]),
    stringsAsFactors = FALSE
  )
  result
}

get_fingerprint <- function(object){
  fingerprint <- httr::content(object, as = "parsed")[[1]]$fingerprint
  result <- base::as_matrix(fingerprint)
  result
}
# get_fingerprint(object_with_fingerprint)
term_context_to_dataframe <- function(object){
  reply <- httr::content(object, as = "parsed")
  result <- data.frame(
    contextlabel = reply[[1]][["context_label"]],
    contextid = reply[[1]][["context_id"]],
    stringsAsFactors = FALSE
  )
  result
}

