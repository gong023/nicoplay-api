class HistoriesController < ApplicationController
  before_filter :create_header

  def index
    @results = History.page_formatted 1
  end

  def show
    @results = History.page_formatted params[:id]
  end

  private
  def create_header
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost'
    response.headers["Access-Control-Allow-Headers"] = "Content-Type, X-Requested-With"
    response.headers["Access-Control-Allow-Methods"] = "GET"
  end
end
