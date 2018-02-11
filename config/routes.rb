River::Application.routes.draw do

  post '/histogram', to: 'application#histogram'
end
