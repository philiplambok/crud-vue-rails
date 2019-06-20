# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Article', type: :system, js: true do
  it 'returns success response' do
    visit new_article_path
    fill_in :article_title, with: 'Use Repository Pattern in Active::Record'
    fill_in :article_body, with: 'Just use concern.'
    click_on 'Submit Article'
    expect(page).to have_content 'Article has been published'
  end
end
