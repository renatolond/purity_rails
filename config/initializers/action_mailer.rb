# config/initializers/action_mailer.rb
if Rails.env.test?
  Rails.application.config.action_mailer.tap do |action_mailer|
    action_mailer.default_url_options = { host: Rails.application.secrets.domain_name }
  end
end
if Rails.env.development?
  Rails.application.config.action_mailer.tap do |action_mailer|
    action_mailer.default_url_options = { host: Rails.application.secrets.domain_name }
  end
end
if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
  Rails.application.config.action_mailer.tap do |action_mailer|
    action_mailer.default_url_options = { :host => 'purityjkr.herokuapp.com' }
  end
end
