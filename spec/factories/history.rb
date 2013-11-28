require "factory_girl"

FactoryGirl.define do
  factory(:history) do
    title 'Miku'
    sequence(:video_id) { |n| "sm#{n}"}
    state 3
  end
end
