json.board_title @board_pin.board.title
json.pin_image @board_pin.pin.image.thumb
json.errors do
  json.array! @board_pin.errors.full_messages do |message|
    json.message message
  end
end
