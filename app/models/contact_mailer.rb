class ContactMailer < ActionMailer::Base
  

  def contact_form(contact)
    subject    'contact from jessdobkin.com'
    recipients 'case_darren@yahoo.com'
    from       'jessdobkin.com <contact@jessdobkin.com>'
    sent_on    Time.now
    
    body       :contact => contact
  end

end
