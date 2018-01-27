class PostsController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    @post = @user.posts.create!(posts_params)
    Rate.create! post_id: @post.id, count: 0, rate: 0
    json_responce_with_string_ip @post, :created
  end

  private

  def posts_params
    params.permit(:title, :body, :ip)
  end

  def set_user
    @login = params[:login]
    @user = User.find_or_create_by!(login: @login) unless @login.empty?
  end

end
