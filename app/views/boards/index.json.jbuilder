json.array! @search_boards do |board|
  json.text board.title
  json.id board.id
end
