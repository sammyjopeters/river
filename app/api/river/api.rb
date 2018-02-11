require_relative '../../../app/services/results_handler_service'

module River
  class API < Grape::API
    format :json
    prefix :api


    resources :page_views do

      params do
        requires :urls, type: Array[String]
        requires :before, type: DateTime
        requires :after, type: DateTime
        requires :interval, type: String, desc: 'interval with unit, eg 10m'
      end
      post :aggregate do
        ResultsHandlerService.new(params).render
      end
    end

  end
end
