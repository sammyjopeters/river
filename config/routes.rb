River::Application.routes.draw do

  root to: 'application#new_search'
  post '/histogram', to: 'application#histogram'

end
