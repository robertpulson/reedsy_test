require 'rails_helper'

feature 'Activities in the View' do
  context 'No Activities have been added' do
    scenario 'Displays a prompt to add an Activity' do
      visit '/activities'
      expect(page).to have_content 'Add some activities below!'
    end
  end

  context 'An Activity has been added' do
    before do
      FactoryGirl.create(:activity)
    end

    scenario 'Display Activities' do
      visit '/activities'
      expect(page).to have_content('Phil Brockwell found a new job')
      expect(page).not_to have_content 'Add some activities below!'
    end
  end

  context 'Creating Activities' do
    scenario 'Prompts user to fill out a form, then displays the new Activity' do
      visit '/activities'
      fill_in 'activity[actor]', with: 'Phil'
      select 'found', from: 'activity_action'
      select 'job', from: 'activity_item'
      click_button 'Create Activity'
      expect(page).to have_content 'Activity Created'
      expect(page).to have_content 'Phil found a new job'
      expect(current_path).to eq '/activities'
    end

    scenario 'Displays an error if the new Activity is invalid' do
      visit '/activities'
      fill_in 'activity[actor]', with: ''
      select 'found', from: 'activity_action'
      select 'job', from: 'activity_item'
      click_button 'Create Activity'
      expect(page).not_to have_content 'Activity Created'
      expect(page).to have_content 'Activity not created, invalid fields'
      expect(page).not_to have_content 'found a new job'
      expect(current_path).to eq '/activities'
    end
  end
end
