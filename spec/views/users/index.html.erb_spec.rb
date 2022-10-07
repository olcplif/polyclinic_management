# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               phone_number: '+380123456789',
               email: 'user1@example.com',
               first_name: 'First Name',
               last_name: 'Last Name'
             ),
             User.create!(
               phone_number: '+380123456780',
               email: 'user2@example.com',
               first_name: 'First Name',
               last_name: 'Last Name'
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: '+380123456789'.to_s, count: 1
    assert_select 'tr>td', text: '+380123456780'.to_s, count: 1
    assert_select 'tr>td', text: 'user1@example.com'.to_s, count: 1
    assert_select 'tr>td', text: 'user1@example.com'.to_s, count: 1
    assert_select 'tr>td', text: 'First Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Last Name'.to_s, count: 2
  end
end
