#所有controller类的基类
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def real_ip(request)
    request.env['HTTP_X_FORWARDED_FOR'].present? ? request.env['HTTP_X_FORWARDED_FOR'] : request.remote_ip
  end
end
