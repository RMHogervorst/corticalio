# expressions
#
#' Expression
#'
#' This method returns a retina representation (a Fingerprint) of the
#' result of the input expression. An expression can contain Terms,
#' Fingerprints, Texts and even nested expressions. The expression must be
#' passed in the body of the method call. The sparsity parameter can be used
#' to sparsify the evaluated expression to a given percentage. The parameter
#' is only interpreted when in the range (0,1), and only applied, if the
#' fingerprint is more dense than the desired sparsity level.
#' \url{http://api.cortical.io/Expression.htm#!/expressions/resolveExpression_post_0}
#' @param retina_name one of en_associative or en_synomous see retina.
#' @param text input a character vector:  "a small lamb walked ..."
#' @param sparsity standard 1.0, measure of sparsity.
#' @param api_key your key, if you saved the key in .renviron leave this NULL.
#' @export
#' @family expressions
cortical_expressions <- function(text ,sparsity = 1.0,
                                 retina_name = "en_associative", api_key = NULL){
  # check that text is utf-8.
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  response <- cortical_api_post(path = "rest/expressions",
                                querylist = list(retina_name = retina_name,
                                                 sparsity = sparsity),
                                body = text,
                                api_key = api_key)
  response <- statuscode_decoder(response)
  response
}

# does not work yet. need to work on the expression part.