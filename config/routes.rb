River::Application.routes.draw do

  get '/', to: 'application#new_search'
  post '/histogram', to: 'application#histogram'

end
