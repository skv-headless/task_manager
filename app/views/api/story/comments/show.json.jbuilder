json.comment  do
  json.extract! @comment, :id, :text, :story_id, :author_id,
                          :created_at, :updated_at
end