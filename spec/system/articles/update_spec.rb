# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update Article', type: :system, js: true do
  before do
    Article.create(title: 'Ruby Article', body: 'Text body')
  end

  it 'returns success message' do
    article = Article.find_by(title: 'Ruby Article')
    visit edit_article_path(article)
    fill_in :article_title, with: 'Ruby Article updated'
    fill_in :article_body, with: 'Text body updated'
    click_on 'Update Article'
    expect(page).to have_content 'Article has been updated'
  end
end
