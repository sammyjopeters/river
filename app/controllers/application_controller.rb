class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception



  def histogram
    @results = ResultsHandlerService.new(request_params).render
    respond_to do |format|
      if @results
        format.json do
          render json: ResultsHandlerService.new(request_params).render
        end
        format.html do
          render 'layouts/application', data: request_params
        end
      else
        render json: 'could not render results'
      end

    end
  endgi


  def request_params
      params.permit(:urls, :before, :after, :interval)
    end

  end
