require_relative '../../../app/services/results_handler_service'

module River
  class API < Grape::API
    format :json
    prefix :api


    resources :page_views do
      get :show_graph do
        'nothin yet.'
      end

      params do
        requires :urls, type: Array[String]
        requires :before, type: DateTime
        requires :after, type: DateTime
        requires :interval, type: Integer, desc: 'interval, in minutes'
      end
      post :aggregate do
        ResultsHandlerService.new(params).render
      end
    end

  end
end
