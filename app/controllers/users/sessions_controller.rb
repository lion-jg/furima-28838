# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  #  def new
  #   super
  #  end

  # # POST /resource/sign_in
  #  def create
  #   user = User.find_by(email: params[:session][:email])
  #   if user && user.authenticate(params[:session][:password])
  #     log_in user
  #     redirect_to root_path
  #   else

  #     render 'new'
  #   end
  #  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  #    private

  #    def log_in(user)
  #      session[:user_id] = user.id
  #    end
end
