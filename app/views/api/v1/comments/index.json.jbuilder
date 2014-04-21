json.meta do
  json.count @total
end

json.data @comments do |comment|
  json.extract! comment, :id, :text, :screen_created_at, :user_name, :acl
end