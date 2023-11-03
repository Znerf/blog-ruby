class ArticlesController < ApplicationController
  before_action :find_one, only: [:show, :edit, :update, :destroy]
  def index
    @article = Article.all
  end

  def show
  end

  def new
    @article=Article.new
  end

  def edit
  end

  def update
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def create
    article = Article.create(article_params)

    redirect_to articles_path
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def find_one
    @article = Article.find(params[:id])
  end
end
