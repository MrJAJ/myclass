#静态跳转类
require 'socket'
class Page::PageController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @hostname = Socket.gethostname
        @ip_address = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address
    end
end
