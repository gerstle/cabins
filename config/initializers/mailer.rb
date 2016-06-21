if ActionMailer::Base.delivery_method == :smtp
  ActionMailer::Base.smtp_settings[:user_name] = Rails.application.secrets.mailer_user
  ActionMailer::Base.smtp_settings[:password] = Rails.application.secrets.mailer_password
end
