json.array!(@attachmentdirs) do |attachmentdir|
  json.extract! attachmentdir, :id
  json.url attachmentdir_url(attachmentdir, format: :json)
end
