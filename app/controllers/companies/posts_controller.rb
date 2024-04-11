class Companies::PostsController < ApplicationController
  def new
    @post = Post.new
    @post.drinks.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
