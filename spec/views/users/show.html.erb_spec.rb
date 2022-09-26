# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            phone_number: 'Phone Number',
                            email: 'Email',
                            first_name: 'First Name',
                            last_name: 'Last Name'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end
