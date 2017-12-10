#用户管理类
class User::UsersController < ApplicationController

  def index
  end

  def create
  end

  #用户登录
  def login
    @user = User.authenticate(params[:username], params[:password])
    if @user
      init_logon_session(@user)
      respond_to do |format|
        format.json  { render :json => "true" }
      end
    else
      respond_to do |format|
        format.json  { render :json => "false" }
      end
    end
  end

  def logout
    clear_logon_session
    respond_to do |format|
        format.json  { render :json => "true" }
      end
  end

  def edit
  end

  def init_logon_session(user)
    session[:user_id] = user.id
    session[:username] = user.username
  end

  def clear_logon_session
    session[:user_id] = nil
    session[:username] = nil
  end

  private
  def user_params
      params.require(:user).permit(:username, :password)
  end
end
