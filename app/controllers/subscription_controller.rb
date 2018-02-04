require 'base64'

class SubscriptionController < ApplicationController
  skip_before_action :require_login
  layout 'subscription'

  # GET /contacts/1
  # GET /contacts/1.json
  def unsubscribe
    @contact = Contact.where(id: Base64.decode64(params['id'])).first
    if @contact.nil?
      flash[:message] = 'Subscription not found.'
    else
      remove_contacts_with_dependencies
      flash[:message] = 'Subscription removed.'
    end
    render 'unsubscribe'
  end

  private

  def remove_contacts_with_dependencies
    CategoriesContact.where(contact_id: @contact.id).delete_all
    ContactsEmail.where(contact_id: @contact.id).delete_all
    @contact.destroy
  end
end
