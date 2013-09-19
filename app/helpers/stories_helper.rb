module StoriesHelper
  def hide_empty_transitions(story)
    story.state_paths.events.empty? ? 'hide' : ''
  end
end
