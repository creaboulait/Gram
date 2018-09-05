class CommentsController < ApplicationController
	before_action :authenticate_user!

  def new
    @comment = Comment.new
    @comment.pic_id = params[:pic_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.pic_id = params[:pic_id]

    if @comment.save
      redirect_to "/pics/#{params[:pic_id]}", notice: 'Comment was successfully created.'
    else
      render :new 
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    pic = @comment.pic
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to pic, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:description, :user_id, :pic_id)
    end
end
