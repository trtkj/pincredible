json.array! @search_pins do |pin|
  json.text pin.title
  json.id pin.id
end
