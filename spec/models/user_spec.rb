# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe 'validations' do
    context 'phone number' do
      it { expect(subject).to validate_presence_of(:phone_number) }
      it { expect(subject).to validate_numericality_of(:phone_number) }
      it { expect(subject).to validate_length_of(:phone_number).is_at_least(10).is_at_most(13) }
      it { expect(subject).to validate_uniqueness_of(:phone_number).case_insensitive }
      it { expect(subject.phone_number).to match(User::VALID_PHONE_NUMBER_REGEX) }
    end

    context 'email' do
      it { expect(subject).to validate_length_of(:email).is_at_most(255) }
      it { expect(subject).to validate_uniqueness_of(:email).case_insensitive }
      it { expect(subject.email).to match(URI::MailTo::EMAIL_REGEXP) }
    end

    context 'first_name and last_name' do
      %i[first_name last_name].each do |field|
        it { expect(subject).to validate_presence_of(field) }
        it { expect(subject).to validate_length_of(field).is_at_least(3).is_at_most(100) }
      end
    end
  end

  describe 'creates successful' do
    context 'when params are correct' do
      it 'has none to begin with' do
        expect(User.count).to eq 0
      end

      it 'changes Company count' do
        expect(create(:user)).to be_valid
        expect { create(:user) }.to change(User, :count).by(1)
      end

      it 'has none after one was created in a previous example' do
        expect(User.count).to eq 0
      end
    end
  end

  describe 'creates unsuccessful' do
    context 'when params are invalid' do
      let(:invalid_user) { build(:user, :invalid_user) }

      it 'has none to begin with' do
        expect(User.count).to eq 0
      end

      it 'not changes Company count' do
        expect(invalid_user).not_to be_valid
        expect { invalid_user.save }.not_to change(User, :count)
      end

      it 'has none after one was created in a previous example' do
        expect(User.count).to eq 0
      end
    end
  end
end
