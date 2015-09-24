json.array!(@pnms) do |pnm|
  json.extract! pnm, :id, :name
  json.url pnm_url(pnm, format: :json)
end
