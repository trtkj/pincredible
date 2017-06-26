json.board_title @board.title
json.array! @errors do |error|
  json.error error
end
