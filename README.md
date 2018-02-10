== River

River reads aggregate data from a very specific instance Elasticseach and returns it in a few different ways, including a histograph.

An app with one endpoint, which takes POST requests.
Hit it with a client like `Postman`. 

`{"urls": [], "before": #time_stamp, "after": #time_stamp, "interval": '10m' }`

Currently the route will return pure JSON data.<br />
TODO: Make a graph to show the data

`api/page_views/graph/


=== Setup

Requires Ruby `2.3.1` and Rails `5.1.4`. 
Won't run without a `.env` file. You'll need the `ES_URL` var in the format `username:password@host:port`
