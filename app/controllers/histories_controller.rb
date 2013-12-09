class HistoriesController < ApplicationController
  def index
    @results = History.page_formatted 1
  end

  def show
    @results = History.page_formatted params[:id]
  end
end
