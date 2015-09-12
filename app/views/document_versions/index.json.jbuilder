json.array!(@document_versions) do |document_version|
  json.extract! document_version, :id
  json.url document_version_url(document_version, format: :json)
end
