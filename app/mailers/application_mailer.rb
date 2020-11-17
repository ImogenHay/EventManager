class ApplicationMailer < ActionMailer::Base
  default to: "imogen@hay.cx", from: 'nick@hay.cx'
  layout 'mailer'
end
