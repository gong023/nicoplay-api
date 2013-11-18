class History < ActiveRecord::Base
  attr_accessible :state, :title, :video_id
  validates :video_id, format: { with: /\D{2}\d+/ }
  validates :video_id, presence: true
  validates :state, presence: true
  validates :title, presence: true
end
