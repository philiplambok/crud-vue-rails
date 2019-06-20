# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Article', type: :system, js: true do
  before do
    visit new_article_path
  end

  it 'returns success response' do
    fill_in :article_title, with: 'Use Repository Pattern in Active::Record'
    fill_in :article_body, with: 'Just use concern.'
    click_on 'Submit Article'
    expect(page).to have_content 'Article has been published'
  end

  it 'returns error message when article title was blank' do
    fill_in :article_title, with: ''
    click_on 'Submit Article'
    expect(page).to have_content 'Title was blank'
  end

  it 'returns error message when article body was blank' do
    fill_in :article_body, with: ''
    click_on 'Submit Article'
    expect(page).to have_content 'Body was blank'
  end
end
