# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Destroy Article', type: :system, js: true do
  before do
    Article.create(title: 'Sample')
  end

  it 'destroy the article' do
    visit articles_path
    click_on 'Delete'
    expect(page).to_not have_content 'Sample'
  end
end
