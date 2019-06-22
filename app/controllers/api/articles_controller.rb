# frozen_string_literal: true

module Api
  class ArticlesController < ApplicationController
    def index
      render json: Article.all
    end

    def show
      article = find_article(params[:id])
      render json: article
    end

    def create
      article = Article.new(article_params)
      article.save
      render json: { message: 'Article has been published' }
    end

    def update
      article = find_article(params[:id])
      article.update(article_params)
      render json: { message: 'Article has been updated' }
    end

    def destroy
      article = find_article(params[:id])
      article.destroy
      render json: { articles: Article.all }
    end

    private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def find_article(id)
      Article.find_by(id: id)
    end
  end
end
