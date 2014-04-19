json.description @post.description
json.created_at @post.created_at
json.updated_at @post.updated_at
json.address @post.address
json.latitude @post.latitude
json.longitude @post.longitude
json.author @post.user.username
json.url post_url(@post)
json.comments @post.comments do |comment|
  json.author comment.user.username
  json.content comment.content
end