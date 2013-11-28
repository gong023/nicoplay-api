class History < ActiveRecord::Base
  paginates_per 20
  default_scope { order("id desc") }
  MEDIA_ROOT = "https://s3-ap-northeast-1.amazonaws.com/nicomedia/audio"

  class << self
    def page_formatted index
      format(page(index))
    end

    def format history
      history.map { |h| {title: h.title, path: create_path(h)} }
    end

    def create_path history
      "#{MEDIA_ROOT}/#{parse_to_Ymd(history.created_at)}/#{history.video_id}.mp3"
    end

    def parse_to_Ymd date
      date.to_s.match(/\d{4}-\d{2}-\d{2}/).to_s
    end
  end
end
