class HistoriesController < ApplicationController
  before_filter :set_page

  def index
    @results = History.page_formatted params[:page]
  end

  def show
    @results = History.page_formatted params[:page]
  end

  private
  def set_page
    params[:page] ||= 0
  end
end
