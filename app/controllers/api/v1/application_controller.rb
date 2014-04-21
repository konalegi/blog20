class Api::V1::ApplicationController < Api::ApplicationController
  protect_from_forgery with: :exception
  include AuthHelper
end
