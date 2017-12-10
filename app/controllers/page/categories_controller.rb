class Page::CategoriesController < ApplicationController

  before_filter :login_check 
  def login_check
    if session[:user_id] == nil
      redirect_to("/user/users/index")
    end
  end

  def default
    render nothing: true
  end

  def index
    @user = User.find(session[:user_id])
  end

  #ajax分页返回分类列表
  def cate_list
    @datatables = Datatable.new

    @datatables.start = params[:start]
    @datatables.length = params[:length]
    @datatables.order = params[:order]
    @datatables.search = params[:search]

    column = ["id", "cate_name","","cate_super_id"][@datatables.order["0"]["column"].to_i]
    @datatables.iTotalRecords = Category.count

    if @datatables.search["value"] != "" 
      sql_like = "cate_name like '%"+@datatables.search["value"]+"%' or cate_description like '%"+@datatables.search["value"]+"%'"

      @datatables.iTotalDisplayRecords = Category.where(sql_like).count
      @categories = Category.where(sql_like).order(column +" "+@datatables.order["0"]["dir"]).limit(@datatables.length).offset(@datatables.start)
    else
      @datatables.iTotalDisplayRecords = @datatables.iTotalRecords
      @categories = Category.order(column +" "+@datatables.order["0"]["dir"]).limit(@datatables.length).offset(@datatables.start)
    end

    @datatables.aaData = @categories

    respond_to do |format|
      format.json  { render :json => @datatables.to_json}
    end
  end

  def create
  end

  def edit
  end

  def cate_image_upload
    file = params[:image_upload].is_a?(ActionDispatch::Http::UploadedFile) ? params[:image_upload] : params[:file]
    @category = Category.new
    @category.cate_image = file
    p @category.to_json
    if file
      render :json => @category.to_json
    else
      render :json => "false"
    end
  end

  def update
  end

  def delete
  end
end
