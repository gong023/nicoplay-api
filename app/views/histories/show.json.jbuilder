json.array!(@results) do |result|
  json.extract! result, :title, :path
end
