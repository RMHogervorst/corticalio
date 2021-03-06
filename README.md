A Package to interact with the Cortical.io API
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Project Status: Abandoned – Initial development has started, but there has not yet been a stable, usable release; the project has been abandoned and the author(s) do not intend on continuing development.](http://www.repostatus.org/badges/latest/abandoned.svg)](http://www.repostatus.org/#abandoned)

**Main points:** Main functions all work, You only have to put your api key in .Renviron and corticalio will find it and use it in all calls. The bulk functions of the api do not yet work. I can't get the images to work and I haven't found a usefull way to transform the sparse matrix return in json format into a matrix object that is useful within R. Since I do not intend to continue this project, feel free to fork and also feel free to contact me. I will react to issues.

[![packageversion](https://img.shields.io/badge/Package%20version-0.1.0-orange.svg?style=flat-square)](commits/master) [![Last-changedate](https://img.shields.io/badge/last%20change-2017--03--19-yellowgreen.svg)](/commits/master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/corticalioapi)](https://cran.r-project.org/package=corticalioapi) [![minimal R version](https://img.shields.io/badge/R%3E%3D-3.3.0-6666ff.svg)](https://cran.r-project.org/)

Basic idea is to use the Cortical.io API from within R. Call all the endpoints from a function. Result is always a useful data frame or other result.

Got the basic functionality fixed.

### Working

\[x\] - Term endpoint, GET 3 of the 3 types with response \[x\] - basic api key function that finds the correct key in Renviron or asks you for one. \[x\] - retina endpoint GET one function (not that usefull per se, could be used for demo purpose) \[x\] - 5 of the 6 text inputs

### TODO

\[\] default in every call to search for token, if not found, give error: make it that api\_key = NULL, so it can be used. but defaults to key &lt;- api\_key(api) So that internally the api search is called. if the api key is not null use the one provided. don't do anything else.

\[\] create parsers for every type of output to dataframe.

\[\] find a way to handle the retina returns. parse to sparse matrix.

\[\] bulk post to text.

-   Retina, GET 1 type
-   Term, GET 3 types \[x\]
-   Text, POST 6 types
-   Expression, POST 6 types.
-   Compare, POST 2 types compare and compare bulk JSON input
-   Image, POST/ 3 types
-   Classify post, need FilterTraininObject and name for filter.

Background information
======================

according to website: [cortical.io](http://www.cortical.io/technology.html) WARNING a lot of BIG data terms and buzzwords.

In short, the Retina is a sparse distributed semantic space (also referred to as Distributional Memory \[Baroni2010\]).

api has two types of retinas "retinaName": "en\_synonymous","An English language retina focusing on synonymous similarity.", and "retinaName": "en\_associative", "description": "An English language retina balancing synonymous and associative similarity."

HTTP Status Code Reason 200 Indicates a successful operation. 404 Indicates that the resource was not found. Returns a JSON object with a detailed error message and a description of a possible resolution.

REST API

The API endpoints related to term input are:

    terms retrieve semantic representation for a term

"<http://api.cortical.io/rest/terms?retina_name=en_associative&term=computer&start_index=0&max_results=10&get_fingerprint=false>" terms/similar\_terms get similar terms for a term "<http://api.cortical.io/rest/terms/similar_terms?retina_name=en_associative&term=apple&start_index=0&max_results=10&pos_type=NOUN&get_fingerprint=false>" terms/contexts get contexts for a term "<http://api.cortical.io/rest/terms/contexts?retina_name=en_associative&term=apple&start_index=0&max_results=5&get_fingerprint=false>"
