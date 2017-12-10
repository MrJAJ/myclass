namespace :page do
    get "page/index"=>"page#index"

    get "categories/" => "categories#default"
    get "categories/index" => "categories#index"
    post "categories/cate_list" => "categories#cate_list"
    post "categories/cate_image_upload"=>"categories#cate_image_upload"
    post "categories/create"=>"categories#create"
    get "categories/new"=> "categories#new"
    get "categories/edit"=> "categories#edit"
    get "categories/show"=> "categories#show"
    post "categories/update"=> "categories#update"
    get "categories/delete"=> "categories#destroy"
end