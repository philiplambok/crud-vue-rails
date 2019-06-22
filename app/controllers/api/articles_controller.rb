# frozen_string_literal: true

module Api
  class ArticlesController < ApplicationController
    def index
      render json: Article.all
    end

    def create
      article = Article.new(atricle_params)
      article.save
      render json: { message: 'Article has been published' }
    end

    private

    def atricle_params
      params.require(:article).permit(:title, :body)
    end
  end
end
