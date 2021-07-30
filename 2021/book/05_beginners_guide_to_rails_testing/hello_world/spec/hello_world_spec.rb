require 'rails_helper'

RSpec.describe 'Hello world', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      #driven_by :selenium_chrome_headless
      driven_by :rack_test

      visit hello_world_index_path
      expect(page).to have_content('Hello, world!')
    end
  end
end
