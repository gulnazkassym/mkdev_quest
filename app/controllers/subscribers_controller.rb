# frozen_string_literal: true

class SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to root_path, flash: {
        success: t('newsletter.messages.success')
      }
    else
      redirect_to root_path, flash: { danger: t('newsletter.messages.error') }
    end
  end

  def unsubscribe
    email = Subscriber.find params[:id]
    email.update_attributes(permissions: false)
    redirect_to subscribers_path, flash: {
      success: t('newsletter.messages.unsubscribe')
    }
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
