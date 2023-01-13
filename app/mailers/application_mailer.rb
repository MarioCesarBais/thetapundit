class ApplicationMailer < ActionMailer::Base
  default from: ENV['user-name']
  layout "mailer"
end
