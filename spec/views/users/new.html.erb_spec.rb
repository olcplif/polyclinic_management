# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    phone_number: '+380123456789',
                    email: 'user@example.com',
                    first_name: 'MyString',
                    last_name: 'MyString'
                  ))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[phone_number]'

      assert_select 'input[name=?]', 'user[email]'

      assert_select 'input[name=?]', 'user[first_name]'

      assert_select 'input[name=?]', 'user[last_name]'
    end
  end
end
