class ApiController < ActionController::Base
  # acts_as_token_authentication_handler_for User, fallback: :none
  before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token # 整個 ApisController 關閉檢查
end