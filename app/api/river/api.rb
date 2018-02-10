require_relative '../../../app/services/results_handler_service'

module River
  class API < Grape::API
    format :json
    prefix :api

    get :graph do
      ResultsHandlerService.new.render
    end

  end
end
