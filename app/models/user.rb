class User < ActiveRecord::Base
    def self.roles
        {"普通用户"=>0,"管理员"=>1}
    end

    def self.states
        {"已停用"=>0,"正常"=>1}
    end

    def self.authenticate(username, password)
        user = self.where("username=? and password = ?",username,password).first
    end
end
