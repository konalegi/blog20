class Api::V1::SessionsController <  Api::V1::ApplicationController
  def show
  end

  def create
    @session = UserSignInType.new params[:session]
    if @session.valid?
      Rails::logger.info "#{@session.user.inspect}"
      sign_in @session.user.id
      render json: {
        id: @session.user.id,
        name: @session.user.name,
        surname: @session.user.surname,
        roles:  @session.user.roles
      }
    else
      render json: {errors: @session.errors}, status: :forbidden
    end
  end

  def destroy
    sign_out
    head :no_content
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
