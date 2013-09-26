json.stories do
    json.array!(@stories) do |story|
      json.extract! story, :id, :title, :description, :state
    end
end