json.array!(@todolists) do |todolist|
  json.extract! todolist, :id
  json.url todolist_url(todolist, format: :json)
end
