class AuthorsController < ApplicationController
  def create
    @author = Author.new(author_params)

    if @author.save
      # Handle successful creation
      redirect_to author_path(@author)
    else
      # Handle validation errors
      render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :email, :phone_number)
  end
end
