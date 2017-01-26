#get context

#Returns a listing of all the contexts of this term.
#http://api.cortical.io:80/rest/terms/contexts?retina_name=en_synonymous&term=hound&start_index=0&max_results=10&get_fingerprint=false
#
murl <- cortical_api("rest/terms/contexts")
query <- "retina_name=en_synonymous&term=hound&start_index=0&max_results=10&get_fingerprint=TRUE"
result <- GET(murl,query= query)
result$content  %>% rawToChar() %>% fromJSON()
# or .. httr::content(result)
#    context_label positions context_id
# 1             dog      NULL          0
# 2 sherlock holmes      NULL          1
# 3       etymology      NULL          2
# 4         stories      NULL          3
#-h "api-key: yourApiKey"
#

result <- GET(murl,query= query,add_headers(`api-key`= ) )
result$status_code # yes! works.

construct_query_()

