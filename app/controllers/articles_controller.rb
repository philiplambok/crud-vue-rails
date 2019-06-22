# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index; end

  def new; end

  def edit
    @article = Article.find_by(id: params[:id])
  end
end
