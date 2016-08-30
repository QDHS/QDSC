# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  address:        'smtp.163.com', # default: localhost
  port:           '25',                  # default: 25
  user_name:      'bobcaocheng',
  password:       'bob010205',
  authentication: :plain                 # :plain, :login or :cram_md5
}
