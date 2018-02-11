# River

River reads aggregate data from a very specific instance Elasticseach and returns it in a few different ways, including a histograph.

An app with one endpoint, which takes POST requests.
Hit it with a client like `Postman`. 

`{"urls": ['array_of_urls'], "before": #time_stamp, "after": #time_stamp, "interval": 10 }`

Currently, the endpoint returns a set of aggregated data, per  URL provided, divided by the `interval`.<br />
TODO: Make a graph to show the data

`api/api/page_views/aggregate`

### Setup

Requires Ruby `2.3.1` and Rails `5.1.4`. 
Won't run without a `.env` file. You'll need the `ES_URL` var in the format `username:password@host:port`

Run `rails s` in your terminal, and access the endpoint with a HTTP request app, like _postman_.  
