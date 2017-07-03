json.pin_id @pin.id
json.errors do
  json.array! @pin.errors.full_messages do |message|
    json.message message
  end
end
