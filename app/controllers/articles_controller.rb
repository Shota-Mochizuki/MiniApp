class ArticlesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(text: article_params[:text], user_id: current_user.id)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params) if article.user_id == current_user.id
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
  end

  private
  def article_params
    params.require(:article).permit(:text)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
