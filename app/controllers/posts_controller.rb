class PostsController < ApplicationController
  def index
    #@posts = Post.all.reverse
    @post = Post.new
    @posts = Post.paginate(:page => params[:page], :per_page => 10).reverse
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    @post.id = Post.last.id + 1
    if @post.save
      redirect_to '/posts', :notice => 'Post was created!'
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Past was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.destroy
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      else
        format.html { redirect_to user_url }
      end
    end
  end
end
