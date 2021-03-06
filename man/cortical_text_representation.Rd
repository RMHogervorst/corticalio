% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/text.R
\name{cortical_text_representation}
\alias{cortical_text_representation}
\title{Get a retina representation of a text}
\usage{
cortical_text_representation(text, retina_name = "en_associative",
  api_key = NULL)
}
\arguments{
\item{text}{input a character vector:  "a small lamb walked ..."}

\item{retina_name}{one of en_associative or en_synomous see retina.}

\item{api_key}{your key, if you saved the key in .renviron leave this NULL.}
}
\value{
a representation of the text
}
\description{
Returns a representation of the text.
}
\seealso{
Other text: \code{\link{cortical_text_keywords}},
  \code{\link{cortical_text_language}},
  \code{\link{cortical_text_slices}},
  \code{\link{cortical_text_tokenize}}
}
