class PostDecorator < Draper::Decorator
  delegate_all

  def screen_created_at
    I18n.l created_at, format: :short
  end

  def user_name
    "#{user.name} #{user.surname}"
  end

  def user_id
    user.id
  end

  def acl
    acl = YaAcl::Acl.instance
    user = h.controller.current_user
    acl_hash = {}

    if user
      acl_hash[:allow_update] = acl.allow?('posts', :update, user.roles, :current_user_id => user.id, :post_user_id => user_id)
      acl_hash[:allow_destroy] = acl.allow?('posts', :destroy, user.roles, :current_user_id => user.id, :post_user_id => user_id)
    end

    acl_hash
  end


end
