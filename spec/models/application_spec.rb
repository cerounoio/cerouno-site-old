require 'rails_helper'

RSpec.describe Application, type: :model do
  context 'when application is valid' do
    it 'creates application record' do
      user = build(:user)

      application = build(
        :application,
        status: 'started',
        steps:  ['demographic', 'address'],
        user:   user
        )

      expect(application).to                    be_valid
      expect(application.status).to             eq 'started'
      expect(application.steps).to              eq ['demographic', 'address']
      expect(application.pending_steps.sort).to eq ['experience', 'recruitment'].sort
      expect(application.user).to               eq user
    end
  end

  context 'when application is invalid' do
    it 'does not create application with invalid status' do
      expect { build(:application, status: 'expelled') }.to raise_error(ArgumentError)
                                                        .with_message("'expelled' is not a valid status")
    end

    it 'does not create application with invalid step' do
      application = build(:application, steps: ['demographic', 'space_travel'])

      expect(application).not_to be_valid
    end
  end
end
