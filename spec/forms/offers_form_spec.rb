require 'rails_helper'

RSpec.describe OffersForm do
  let(:attributes) { {} }
  subject(:offers_form) do
    described_class.new(attributes)
  end

  describe 'uid' do
    it 'validates the presence and the size of 50 chars' do
      expect(subject).to_not have_valid(:uid).when(
        nil, '', Faker::Internet.password(51)
      )
    end

    it 'accepts the size less than 50 chars' do
      expect(subject).to have_valid(:uid).when(
        'player1', Faker::Internet.password(50)
      )
    end
  end

  describe 'pub0' do
    it 'validates the maximum size of 50 chars' do
      expect(subject).to_not have_valid(:pub0).when(
        Faker::Internet.password(51)
      )
    end

    it 'accepts the size less or equal than 50 chars' do
      expect(subject).to have_valid(:pub0).when(
        'campaign2', Faker::Internet.password(50)
      )
    end
  end

  describe 'page' do
    it 'validates the numericality of the page' do
      expect(subject).to_not have_valid(:page).when('first page')
    end

    it 'validates the maximum size of 15 chars' do
      expect(subject).to_not have_valid(:page).when('9' * 16)
    end

    it 'accepts blank and size less or equal than 15 chars' do
      expect(subject).to have_valid(:page).when(nil, '', '9' * 15)
    end
  end

  describe '#attributes' do
    context 'when initialize with nil' do
      let(:attributes) { nil }

      it 'return an empty hash' do
        expect(offers_form.attributes).to eq({})
      end
    end

    context 'when passing not defined attributes' do
      let(:attributes) do
        { i_do_not_want_this: 'Why not?' }
      end

      it 'return an empty hash' do
        expect(offers_form.attributes).to eq({})
      end
    end

    context 'when initialize passing the uid, page and pb0 attributes' do
      let(:attributes) do
        { uid: 'player1', page: '1', pub0: 'campaign2' }
      end

      it 'return all attributes' do
        expect(offers_form.attributes).to eq(attributes)
      end
    end

    context 'when initialize passing only the uid' do
      let(:attributes) do
        { uid: 'player1', page: '', pub0: '' }
      end

      it 'return only the uid' do
        expect(offers_form.attributes).to eq(uid: 'player1')
      end
    end
  end

  describe '#has_valid_searchable_data?' do
    context 'when is valid' do
      let(:attributes) do
        { uid: 'player1', page: '1', pub0: 'campaign2' }
      end

      it 'returns true' do
        expect(offers_form).to have_user_data_and_valid
      end
    end

    context 'when is invalid' do
      context 'when the searchable attributes are not present' do
        let(:attributes) do
          {}
        end

        it 'returns false' do
          expect(offers_form).to_not have_user_data_and_valid
        end
      end

      context 'when is not valid' do
        let(:attributes) do
          { uid: 'player1', page: '1', pub0: 'campaign2' }
        end

        before { allow(offers_form).to receive(:valid?).and_return(false) }

        it 'returns false' do
          expect(offers_form).to_not have_user_data_and_valid
        end
      end
    end
  end
end