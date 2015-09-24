json.array!(@statics) do |static|
  json.extract! static, :id, :prev, :current, :next
  json.url static_url(static, format: :json)
end
