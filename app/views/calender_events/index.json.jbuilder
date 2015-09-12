json.array!(@calender_events) do |calender_event|
  json.extract! calender_event, :id
  json.url calender_event_url(calender_event, format: :json)
end
