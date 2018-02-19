class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception


  def new_search
    render 'layouts/form'
  end

  def histogram
    results         = ResultsHandlerService.new(request_params).render
    agg_transformer = AggregatePresenter.new(results)
    chart_data      = agg_transformer.transform!
    url_labels      = agg_transformer.url_labels
    respond_to do |format|
      if results
        format.json { render json: chart_data }
        format.html { render 'layouts/graph', locals: { data: chart_data, labels: url_labels } }
      else
        format.html { redirect_to :new_search, notice: 'Something went wrong.' }
        format.json { render json: 'something went wrong.', status: :unprocessable_entity }
      end
    end
  end


  def request_params
    params.permit(:urls, :before, :after, :interval)
  end

  end
