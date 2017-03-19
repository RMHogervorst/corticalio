## images ##
#' Return visualisation of expression
#'
#' Implementation Notes
#' This method returns a visualization of the specified expression.
#' The expression must be passed in the body of the method call. The
#' image_scalar parameter defines the scale of the output image.
#'
#' The plot_shape parameter defines the shape of the output image.
#' If this parameter is unspecified, (null), then the default circle will be
#' used. The image_encoding parameter specifies the type of image encoding used
#' (in this UI it can only be displayed using "base64/png").
#'
#' The sparsity parameter can be used to sparsify the evaluated expression to a
#' given percentage. The parameter is only interpreted when in the range (0,1),
#' and only applied, if the fingerprint is more dense than the desired sparsity
#' level. The following simple example can be used to get an image for a single
#' input term.
#' @param text the search
#' @param retina_name one of en_associative or en_synomous see retina.
#' @param image_scalar defaults to 2
#' @param plot_shape circle or square
#' @param sparsity defaults to 1
#' @param image_encoding defaults to base64/png
#' @param api_key your key, if you saved the key in .renviron leave this NULL.
#' @export
cortical_image <- function(text ,retina_name = "en_associative",
                           image_scalar = 2, plot_shape = "circle",
                           image_encoding = "base64/png", sparsity = 1.0,
                           api_key = NULL){
  retina_name <- retina_checker(retina_name)
  if(is.null(retina_name)){ retina_name <- "en_associative"}
  if(!image_scalar %in% c(2, 5)){ stop("image_scalar needs to be 2 or 5")}
  if(!plot_shape %in% c("circle", "square")){stop("plot shape needs to be a circle or square")}
  if(!image_encoding %in% c("base64/png", "binary/png")){stop("image encoding needs to be base64/png, or binary/png")}
  response <- cortical_api_post(path = "rest/image",
                                querylist = list(
                                  retina_name = retina_name,
                                  image_scalar = image_scalar,
                                  plot_shape = plot_shape,
                                  image_encoding = image_encoding,
                                  sparsity = sparsity),
                                body = text,
                                api_key = api_key)
  response <- statuscode_decoder(response)
  response
}

