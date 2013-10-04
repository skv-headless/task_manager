module Web::Stories::CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comment|
      render(:partial => 'web/stories/comments/comment', :object => comment) +
          content_tag(:div, nested_comments(sub_comment), :class => 'nested_comments')
    end.join.html_safe
  end
end
