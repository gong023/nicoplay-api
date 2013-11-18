class HistoriesController < ApplicationController
  def show
    @results = History.all
  end
end
