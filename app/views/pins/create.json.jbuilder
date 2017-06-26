json.pin_id @pin.id
json.array! @errors do |error|
  json.error error
end
