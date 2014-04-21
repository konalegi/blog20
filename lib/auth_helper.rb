module AuthHelper
  class Unauthorized < RuntimeError; end

  def sign_in(user_id)
    session[:current_user_id] = user_id
    cookies[:current_user] = {
      id: current_user.id,
      name: current_user.name,
      surname: current_user.surname,
      roles: current_user.roles
       }.to_json
  end

  def sign_out
    session[:current_user_id] = nil
    cookies.delete :current_user
  end

  def user_signed_in?
    session[:current_user_id].present?
  end

  def current_user_id
    session[:current_user_id]
  end

  def current_user
    User.find_by_id(session[:current_user_id])
  end

  def authenticate_user!
    raise Unauthorized unless user_signed_in?
  end
end