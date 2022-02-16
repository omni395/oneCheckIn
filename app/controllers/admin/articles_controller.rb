class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
    authorize [:admin, Article], :edit?
  end

  def create
    @article = current_user.articles.build(article_params)
    authorize [:admin, Article], :create?

    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_article_path(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize [:admin, Article], :update?
    respond_to do |format|
      if @article.update(article_params)
        @article.paragraphs.build
        format.html { redirect_to admin_article_path(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize [:admin, Article], :destroy?
    @article.destroy

    respond_to do |format|
      format.html { redirect_to admin_articles_path, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:article_image, :name, :description, :category, :user_id,
                                      paragraphs_attributes: [:_destroy, :id, :content] )
    end
end
