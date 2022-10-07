# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users pages', type: :feature do
  let!(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { attributes_for(:user, :invalid_user) }

  before do
    # sign_in user
    visit users_url
  end

  scenario 'Can see latest user' do
    expect(page).to have_current_path(users_url)
    expect(page).to have_text(user.first_name)
    expect(page).to have_text(user.last_name)
    expect(page).to have_text(user.phone_number)
    expect(page).to have_text(user.email)
  end

  scenario 'Create user with valid parameters' do
    expect(page).to have_current_path(users_url)
    click_on('New patient')
    expect(page).to have_current_path(new_user_url)
    fill_in 'user_first_name', with: valid_attributes[:first_name]
    fill_in 'user_last_name', with: valid_attributes[:last_name]
    fill_in 'user_phone_number', with: valid_attributes[:phone_number]
    fill_in 'user_email', with: valid_attributes[:email]
    expect { click_on 'Create User' }.to change { User.count }.by(1)
    expect(page).to have_current_path(user_url(User.last))
    expect(page).to have_content(valid_attributes[:first_name])
    expect(page).to have_content(valid_attributes[:last_name])
    expect(page).to have_content(valid_attributes[:phone_number])
    expect(page).to have_content(valid_attributes[:email])
  end

  scenario 'Does not create user with invalid parameters' do
    expect(page).to have_current_path(users_url)
    click_on('New patient')
    expect(page).to have_current_path(new_user_url)
    fill_in 'user_email', with: invalid_attributes[:email]
    fill_in 'user_first_name', with: invalid_attributes[:first_name]
    fill_in 'user_last_name', with: invalid_attributes[:last_name]
    fill_in 'user_phone_number', with: invalid_attributes[:phone_number]
    expect { click_on 'Create User' }.not_to(change { User.count })
  end

  scenario 'Update user with valid parameters' do
    expect(page).to have_current_path(users_url)
    expect(page).to have_text(user.first_name)
    expect(page).to have_text(user.last_name)
    expect(page).to have_text(user.phone_number)
    expect(page).to have_text(user.email)
    click_on('Edit')
    expect(page).to have_current_path(edit_user_url(user))
    fill_in 'user_first_name', with: valid_attributes[:first_name]
    fill_in 'user_last_name', with: valid_attributes[:last_name]
    fill_in 'user_phone_number', with: valid_attributes[:phone_number]
    fill_in 'user_email', with: valid_attributes[:email]
    expect { click_on 'Update User' }.not_to(change { User.count })
    expect(page).to have_content(valid_attributes[:first_name])
    expect(page).to have_content(valid_attributes[:last_name])
    expect(page).to have_content(valid_attributes[:phone_number])
    expect(page).to have_content(valid_attributes[:email])
  end

  scenario 'Does not update user with invalid parameters' do
    expect(page).to have_current_path(users_url)
    click_on('Edit')
    expect(page).to have_current_path(edit_user_url(user))
    fill_in 'user_email', with: invalid_attributes[:email]
    fill_in 'user_first_name', with: invalid_attributes[:first_name]
    fill_in 'user_last_name', with: invalid_attributes[:last_name]
    fill_in 'user_phone_number', with: invalid_attributes[:phone_number]
    expect { click_on 'Update User' }.not_to(change { User.count })
    expect(page).to have_content('Phone numberis not a number')
    expect(page).to have_content('Emailis invalid')
    expect(page).to have_content('First nameis too short (minimum is 3 characters)')
    expect(page).to have_content('Last nameis too short (minimum is 3 characters)')
  end

  scenario 'Destroy user' do
    expect(page).to have_current_path(users_url)
    expect(page).to have_text(user.first_name)
    expect(page).to have_text(user.last_name)
    expect(page).to have_text(user.phone_number)
    expect(page).to have_text(user.email)
    expect { click_on 'Destroy' }.to change { User.count }.by(-1)
    expect(page).not_to have_text(user.first_name)
    expect(page).not_to have_text(user.last_name)
    expect(page).not_to have_text(user.phone_number)
    expect(page).not_to have_text(user.email)
  end
end
