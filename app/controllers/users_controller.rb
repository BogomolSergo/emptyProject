class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(params[:user])

      if @user.save
        respond_to do |format|
          format.html {redirect_to action: :index}
          format.js
        end
      else
        render 'new'
      end
  end

  def index
    @users = User.all
    @user = User.new
  end

  def edit
    @article = Post.find(params[:id])
  end

  def update
    @user = Post.find(params[:id])

    if @user.update(:user)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = Post.find(params[:id])

    if @user.destroy
      respond_to do |format|
        format.html {redirect_to action: :index}
        format.js { render nothing: true}
      end
    else
      redirect_to post_path
    end
  end
end
