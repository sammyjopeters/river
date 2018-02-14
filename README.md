# River

River reads aggregate data from a very specific instance Elasticseach and returns it in a few different ways, including a histograph.


## Setup

Requires Ruby `2.3.1` and Rails `5.1.4`. 
Won't run without a `.env` file. You'll need the `ES_URL` var in the format `username:password@host:port`

Run `rails s` in your terminal.

## Usage

### With a HTTP app (like Postman)
Hit the endpoint `histogram` with a POST request with the following body:

`urls` - Comma seperated urls without quotes (eg `google.com, facbook.com` )<br />
`before` - Date in any standard format, eg `23-05-2018`<br />
`after` - Date in any standard format, eg `23-05-2018`<br />
`interval` - Number followed by a letter symbolising units, eg `10m`, `2h` etc.<br />

The app will return the pure ES query data.

### With a browser

Head to `/` and fill in the form (defaults are entered if you're lazy) and hit 'get histogram'

*Currently just splats out the ES results, but should take you to `/histogram` to show you... y'know, a **histogram** .*


