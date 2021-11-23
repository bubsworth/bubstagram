module ApplicationHelper
  def can_only_edit_own_post(post)
    post.user_id == current_user.id
  end

  def can_only_delete_own_comment(comment)
    comment.user_id == current_user.id
  end

  def current_user_can_only(user)
    user.id == current_user.id
  end
end
