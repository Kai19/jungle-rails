class ApplicationMailer < ActionMailer::Base
  default from: "test@jungle.com"
  layout 'mailer'
end
