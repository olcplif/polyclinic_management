# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            phone_number: '+380123456789',
                            email: 'user@example.com',
                            first_name: 'First Name',
                            last_name: 'Last Name'
                          ))
  end

  it 'renders attributes in <div>' do
    render
    expect(rendered).to match(/\+380123456789/)
    expect(rendered).to match('user@example.com')
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end
