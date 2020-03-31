# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
<<<<<<< HEAD
  let(:user)  { create :user }
  let(:event) { create :event, user: user }

  before do
    sign_in(user)
  end

=======
>>>>>>> 28e0a2d831145154c7dde662c921ef5912302d05
  describe 'GET #index' do
    it 'returns array of events' do
      get :index

      expect(assigns(:events)).to eq([event])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested event to @event' do
      get :show, params: { id: event.id }
      expect(assigns(:event)).to eq(event)
    end

    it 'renders the #show view' do
      get :show, params: { id: event.id }
      expect(response).to render_template :show
    end
  end

  describe 'POST create' do
    it 'creates a new events' do
      expect { post :create, params: { event: attributes_for(:event) } }
        .to change(Event, :count).by(1)
    end

    it 'redirects to the new event' do
      post :create, params: { event: attributes_for(:event).merge(user: user) }
      expect(response).to redirect_to Event.last
    end
  end

  describe 'PUT update' do
    it 'located the requested :event' do
      put :update, params: {  id: event, event: attributes_for(:event) }
      expect(assigns(:event)).to eq(event)
    end

    it "changes event's attributes" do
      put :update, params: {
        id: event, event: attributes_for(:event,
                                         title: 'HolyJS',
                                         description: 'Some event.')
      }
      event.reload
      expect(event.title).to eq('HolyJS')
      expect(event.description).to eq('Some event.')
    end

    it 'redirects to the updated event' do
      put :update, params: { id: event, event: attributes_for(:event) }
      expect(response).to redirect_to event
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the event' do
      expect { delete :destroy, params: { id: event } }.to change(
        Event, :count
      ).by(0)
    end

    it 'redirects to events#index' do
      delete :destroy, params: { id: event }
      expect(response).to redirect_to events_url
    end
  end
end
