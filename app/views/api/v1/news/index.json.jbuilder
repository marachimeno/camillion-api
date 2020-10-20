json.array! @news do |n|
  json.extract! n, :id, :title, :content
end
