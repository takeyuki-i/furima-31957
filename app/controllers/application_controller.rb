class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new ,:create,:edit,:destroy]
  before_action :devise_parameters, if: :devise_controller?

  private

  def devise_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end
end
