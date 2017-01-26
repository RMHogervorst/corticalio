# similar terms
#
# http://api.cortical.io:80/rest/terms/similar_terms?retina_name=en_associative&term=wizard&start_index=0&max_results=10&pos_type=NOUN&get_fingerprint=false
# url part : http://api.cortical.io
# port = 80
# path = /rest/terms/similar_terms
#
# query =
# retina_name=en_associative&
# term=wizard&
# start_index=0&
# max_results=10&
# pos_type=NOUN
# &get_fingerprint=false
GET("http://api.cortical.io:80/rest/terms/similar_terms?retina_name=en_associative&term=wizard&start_index=0&max_results=10&pos_type=NOUN&get_fingerprint=false")
# Response Class
#
# Model
# Model Schema
#
# Term {
#   pos_types (array[string], optional): The pos types of the term.,
#   fingerprint (Fingerprint, optional): The Fingerprint of this term.,
#   term (string, optional): The term as a string.,
#   df (number, optional): The df value of this term.,
#   score (number, optional): The score of this term.
# }
#
GET(url = "http://api.cortical.io")


murl <- cortical_api("rest/terms/similar_terms")
object2<- GET(url = murl, query = "retina_name=en_associative&term=wizard&start_index=0&max_results=10&pos_type=NOUN&get_fingerprint=false")
object2$content  %>% rawToChar() %>% fromJSON()
content(object2)
# dit werkt, maar zonder api key

r<- GET(url = murl, query = construct_query_(term = "wizard"),
        add_headers(`api-key`= )
extract_content(r)

test<- request_get(endpoint = "rest/terms/similar_terms", term = "banana")
extract_content(test)
