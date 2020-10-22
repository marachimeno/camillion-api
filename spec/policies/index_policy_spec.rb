require 'rails_helper'

describe NewPolicy do
  subject { described_class.new(user, new) }

  let(:resolved_scope) do
    described_class::Scope.new(user, New.all).resolve
  end

  context 'being a logged in user' do
    let(:user) { User.create(logged_in: true) }

    context 'accessing news' do
      let(:new) { New.create }

      it 'includes new in resolved scope' do
        expect(!resolved_scope.nil?)
      end
    end
  end

  context 'not being a logged in user' do
    let(:user) { User.create(logged_in: false) }

    context 'accessing news' do
      let(:new) { New.create }

      it 'does not include new in resolved scope' do
        expect(resolved_scope.nil?)
      end
    end
  end
end
