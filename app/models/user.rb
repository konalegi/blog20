class User < ActiveRecord::Base
  has_secure_password

  def add_role role
    return false if roles.include? role.to_s
    roles << role.to_s
    save_role_changes
  end

  def has_role? role
    roles.include? role.to_s
  end

  def remove_role role
    return false unless roles.include? role.to_s
    roles.delete role.to_s
    save_role_changes
  end

  def clear_roles
    roles.clear
    save_role_changes
  end

  def save_role_changes
    roles_will_change!
    save
  end
end
