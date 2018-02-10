require_relative 'results_handler_service'

module River
  class API < Grape::API
    format :json
    prefix :api

    get :graph do
      ResultsHandlerService.new(params).render
    end

  end
end
