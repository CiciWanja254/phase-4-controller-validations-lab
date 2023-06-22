class PostsController < ApplicationController
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      # Handle successful update
      redirect_to post_path(@post)
    else
      # Handle validation errors
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :category, :content)
  end
end
