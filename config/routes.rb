Rails.application.routes.draw do

    root 'user/users#index'

    def draw(routes_name)
        instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
    end

    draw :user
    draw :page
  
end
