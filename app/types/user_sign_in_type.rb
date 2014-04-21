class UserSignInType < BaseType

  attribute :email, String
  attribute :password, String
  attribute :company_namespace, String

  validates :email, email: true, :presence => { :message => "user_sign_in_type.email.presense" }
  validates :password, :presence => { :message => "user_sign_in_type.password.presense" }

  validate :check_authenticate, if: :email

  def user
    User.find_by_email(email.mb_chars.downcase)
  end

  private

  def check_authenticate
    if !user.try(:authenticate, password)
      errors.add(:password, :user_or_password_invalid)
    end
  end
end
