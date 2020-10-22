require 'rails_helper'

describe NewPolicy do
  subject { described_class.new(user, new) }

  let(:new) { New.create }

  context 'show - being an admin and logged in user' do
    let(:user) { User.create(admin: true, logged_in: true) }

    it { is_expected.to permit_actions([:show]) }
  end

  context 'show - being a logged in user' do
    let(:user) { User.create(logged_in: true) }

    it { is_expected.to permit_action([:show]) }
  end
end
