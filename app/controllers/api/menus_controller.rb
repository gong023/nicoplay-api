class Api::MenusController < ApplicationController
  require 'nokogiri'
  skip_before_filter :verify_authenticity_token

  def search
    ret = Menu.where({:created_at => 15.days.ago..Time.now, :state => 0}).all
    respond_to do |format|
      format.json {render :json => create_json(ret)}
    end
  end

  private
  def create_json(ret)
    ret = ret.inject([]) do |arr, r|
      ctime = r.created_at.to_s.sub(/\ .*\ UTC$/, '');
      arr << {
        :title => r.title,
        :path => "/resource/audio/#{ctime}/#{r.video_id}.mp3"
      }
    end
    ret.to_json
  end
end
