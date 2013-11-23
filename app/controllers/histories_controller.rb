class HistoriesController < ApplicationController
  before_filter :set_page
  def show
    @results = History.order(:created_at).page params[:page]
  end

  private
  def set_page
    params[:page] ||= 0
  end
end
