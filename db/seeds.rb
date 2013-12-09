History.delete_all

30.times do |i|
  History.create(video_id: "sm#{i}", title: "mikumiku#{i}", state: 3)
end

History.create(video_id: "sm#{rand(1000)}", title: "unvisible_state", state: 2)
