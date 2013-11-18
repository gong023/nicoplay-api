json.array!(@results) do |result|
  json.extract! result, :title, :video_id
end
