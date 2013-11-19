require "factory_girl"

FactoryGirl.define do
  factory(:history) do
    title 'Miku'
    video_id 'sm123'
    state '3'
  end
end
