require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe 'GET #index' do
    it 'returns array of events' do
      event = create(:event)
      get :index

      assigns(:events).should eq([event])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:event) { create(:event) }
    it 'assigns the requested event to @event' do
      get :show, params: { id: event.id }
      assigns(:event).should eq(event)
    end

    it 'renders the #show view' do
      get :show, params: { id: event.id }
      expect(response).to render_template :show
    end
  end

  describe 'POST create' do
    it 'creates a new events' do
      expect {
        post :create, params: { event: FactoryGirl.attributes_for(:event) }
      }.to change(Event, :count).by(1)
    end

    it 'redirects to the new event' do
      post :create, params: { event: FactoryGirl.attributes_for(:event) }
      expect(response).to redirect_to Event.last
    end
  end

  describe 'PUT update' do
    let(:event) { create :event }

    it 'located the requested :event' do
      put :update, params: {  id: event, event: FactoryGirl.attributes_for(:event) }
      assigns(:event).should eq(event)
    end

    it "changes event's attributes" do
      put :update, params: {
        id: event, event: FactoryGirl.attributes_for(:event, title: 'HolyJS', description: 'Some event.') 
      }
      event.reload
      event.title.should eq('HolyJS')
      event.description.should eq('Some event.')
    end

    it 'redirects to the updated event' do
      put :update, params: { id: event, event: FactoryGirl.attributes_for(:event) }
      response.should redirect_to event
    end
  end

  describe 'DELETE destroy' do
    let(:event) { create :event }

    it 'deletes the event' do
      expect {
        delete :destroy, params: { id: event }
      }.to change(Event, :count).by(0)
    end

    it 'redirects to events#index' do
      delete :destroy, params: { id: event }
      response.should redirect_to events_url
    end
  end
end
