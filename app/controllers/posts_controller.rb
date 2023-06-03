class PostsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @post = Post.new(post_params)
    @post.project = @project
    @post.sender = current_user
    if @post.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :media_attachment_url)
  end
end
