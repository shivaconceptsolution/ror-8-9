class ArticlesController < ApplicationController
  def index
    if params[:btnsubmit]!=nil
      if params[:fi]=="title"
         @articles = Article.where("title=?",params[:txtsearch])
      else  
        @articles = Article.where("id=?",params[:txtsearch].to_i)
      end
    else
       @articles = Article.all
    end  
    
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @article = Article.find(params[:id])
  end 
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end 
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
