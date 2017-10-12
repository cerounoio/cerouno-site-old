require 'rails_helper'

RSpec.describe Application, type: :model do
  context 'when application is valid' do
    it 'creates application record' do
      user = build(:user)

      application = build(
        :application,
        status: 'started',
        hidden: false,
        steps:  ['demographic', 'address'],
        user:   user
        )

      expect(application).to                    be_valid
      expect(application.status).to             eq 'started'
      expect(application.hidden).to             eq false
      expect(application.steps).to              eq ['demographic', 'address']
      expect(application.pending_steps.sort).to eq ['experience', 'recruitment'].sort
      expect(application.user).to               eq user
    end

    it 'adds a step' do
      application = build(:application)
      application.add_step('demographic')

      expect(application.steps).to include 'demographic'
    end

    it 'removes a step' do
      application = build(:application, steps: ['demographic'])
      application.remove_step('demographic')

      expect(application.steps).not_to include 'demographic'
    end

    it 'knows it is visible' do
      application = build(:application)

      expect(application.visible?).to eq true
    end

    it 'knows it is hidden' do
      application = build(:application, hidden: true)

      expect(application.hidden?).to eq true
    end

    it 'can toggle it\'s visibility' do
      application = create(:application)
      application.toggle

      expect(application.hidden?).to eq true
    end

    it 'displays only visible applications' do
      visible_application = create(:application)
      hidden_application  = create(:application, hidden: true)

      expect(Application.visible).to     include visible_application
      expect(Application.visible).not_to include hidden_application
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
