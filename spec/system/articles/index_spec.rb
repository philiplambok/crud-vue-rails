# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Article Index Spec', type: :system, js: true do
  before do
    Article.create(title: 'Intro to Ruby', body: 'body of ruby')
    Article.create(title: 'Intro to Vue', body: 'body of vue')
  end

  it 'returns list of articles' do
    visit articles_path
    expect(page).to have_content 'Intro to Ruby'
    expect(page).to have_content 'body of ruby'
    expect(page).to have_content 'Intro to Vue'
    expect(page).to have_content 'body of vue'
  end
end
