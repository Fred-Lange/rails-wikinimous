class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # need to instantiate the form_for
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    # no need for app/views/tasks/create.html.erb
    # ici le @task est pour cibler la show et rails l'interprete comme l'id
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    # no need for app/views/tasks/update.html.erb
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to article_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
