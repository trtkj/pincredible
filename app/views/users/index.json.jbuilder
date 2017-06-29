json.array! @search_users do |user|
  json.text user.nickname
  json.id user.id
end
