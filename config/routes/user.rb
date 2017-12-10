namespace :user do

    get "users/index" => "users#index"
    post "users/login" => "users#login"

end