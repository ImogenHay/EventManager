class HomeController < ApplicationController
  def home
  end

  def contact
  end

  def about
  end

  def request_contact #method called when submit button pressed
    name = params[:name]
    email = params[:email] #form values available via params hash
    telephone = params[:telephone] #keys match field names
    message = params[:message]
    if email.blank? #show alert if no email address, need to add to view to be displayed
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now # Send an email
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end
    redirect_to root_path #got back to root path (home)
  end
end
