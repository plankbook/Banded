class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @project = @post.project
    @comment.post = @post
    @comment.sender = current_user
    if @comment.save
      CommentsChannel.broadcast_to(
        @project,
        render_to_string(partial: "comment", locals: { comment: @comment })
      )
      head :ok
      CommentsCountChannel.broadcast_to(
        @project,
        @post.comments.count
      )
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
