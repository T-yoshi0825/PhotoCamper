class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    image = Image.find(params[:image_id])
    comment = current_user.comments.new(comment_params)
    comment.image_id = image.id
    if	comment.save
      redirect_to image_path(image)
    else
      redirect_to image_path(image)
    end
  end

  def destroy
    Comment.find_by(id: params[:id], image_id: params[:image_id]).destroy
    redirect_to image_path(params[:image_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
