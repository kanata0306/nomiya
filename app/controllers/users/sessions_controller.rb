# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    sign_out(:admin)
    sign_out(:company)
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to companies_posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def after_sign_in_path_for(resource)
    companies_posts_path
  end
  
  def after_sign_up_path_for(resource)
    companies_posts_path
  end
  
 

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
