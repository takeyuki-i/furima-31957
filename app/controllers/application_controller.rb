class ApplicationController < ActionController::Base
before_action :devise_parameters, if: :devise_controller?

private
def devise_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:password ,:encrypted_password ,:first_name,:last_name,:first_name_kana,:last_name_kana,:birthday])
end

end
