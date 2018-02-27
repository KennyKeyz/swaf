class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  default :to => 'help@example.com' 
  layout 'mailer'

end
