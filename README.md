== River

River reads aggregate data from a very specific instance Elasticseach and returns it in a few different ways, including a histograph.

An app with one endpoint, which takes POST requests.
Hit it with a client like `Postman`. 

`{"urls": [], "before": #time_stamp, "after": #time_stamp, "interval": '10m' }`

You can request a JSON response for pure data, or a HTML response which will give you a graph.

`api/page_views/graph.json`
`api/page_views/graph.html`


=== Setup

Requires Ruby `2.3.1` and Rails `5.1.4`. 
Won't run without a `.env` file. You'll need the following vars:
`ES_ENDPOINT`, `ES_USERNAME` and `ES_PASSWORD`.

