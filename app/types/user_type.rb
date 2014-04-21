class UserType < BaseType

  attribute :name, String
  attribute :surname, String
  attribute :email, String
  attribute :company_id, String

  validates :name, :surname, :email, :company_id, :presence => { :message => "user_type.presense" }


  #validates imei1,:imei2, numericality: { only_integer: true }



end
