class Api::HistoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
    results = History.where({created_at: 15.days.ago..Time.now}, state: 3).all
    respond_to {|format| format.json { render :json => create_json(results) } }
  end

  private
  def create_json(ret)
    ret.inject([]) do |arr, r|
      ctime = r.created_at.to_s.sub(/\ .*\ UTC$/, '');
      arr << {
        :title => r.title,
        :path => "/resource/audio/#{ctime}/#{r.video_id}.mp3"
      }
    end.to_json
  end
end
