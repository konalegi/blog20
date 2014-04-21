class CommentDecorator < Draper::Decorator
  delegate_all

  def screen_created_at
    I18n.l created_at, format: :short
  end

  def user_name
    if user
      "#{user.name} #{user.surname}"
    else
      "Anonymous"
    end
  end

  def acl
    acl = YaAcl::Acl.instance
    user = h.controller.current_user
    acl_hash = {}

    if user
      acl_hash[:allow_update] = acl.allow?('comments', :update, user.roles, :current_user_id => user.id, :comment_user_id => user_id)
      acl_hash[:allow_destroy] = acl.allow?('comments', :destroy, user.roles, :current_user_id => user.id, :comment_user_id => user_id)
    end

    acl_hash
  end

end
