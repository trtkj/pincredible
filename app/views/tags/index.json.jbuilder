json.array! @search_tags do |tag|
  json.text "#" + tag.name
  json.id tag.id
end
