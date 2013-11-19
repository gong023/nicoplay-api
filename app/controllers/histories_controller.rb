class HistoriesController < ApplicationController
  def show
    @results = History.where({:created_at => 15.days.ago..Time.now, :state => 3})
  end
end
