class Admin::ParagraphsController < ApplicationController
  before_action :set_article
  before_action :set_paragraph, only: %i[ update destroy ]

  def update
    authorize [:admin, Article], :update?
    respond_to do |format|
      if @paragraph.update(article_params)
        format.html { redirect_to admin_article_path(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize [:admin, Article], :update?
    @paragraph.destroy
    respond_to do |format|
      format.html { redirect_to admin_article_path(@article), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_paragraph
      @paragraph = @article.paragraphs.find(params[:id])
    end


    def article_params
      params.require(:paragraph).permit(:content, :article_id)
    end
end
