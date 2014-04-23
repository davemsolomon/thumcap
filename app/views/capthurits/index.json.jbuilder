json.array!(@capthurits) do |capthurit|
  json.extract! capthurit, :id, :filename, :stationname, :capthurstart
  json.url capthurit_url(capthurit, format: :json)
end
