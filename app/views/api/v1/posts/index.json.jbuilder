json.meta do
  json.count @total
end

json.data @posts do |post|
  json.extract! post, :id, :title, :preview, :screen_created_at, :user_name, :user_id,:acl
end