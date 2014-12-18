Devise.setup do |config|

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

    require 'devise/orm/active_record'


  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  
  config.skip_session_storage = [:http_auth]

 

  config.reconfirmable = true


  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = true


  # Range for password length.
  config.password_length = 8..128

  
  config.reset_password_within = 6.hours

  
  config.sign_out_via = :delete


  config.omniauth :facebook, '1575700879330278', 'e4b9cc2b48da619348643186e27b8a4e', scope: 'email' 
  config.stretches = Rails.env.test? ? 1 : 10
  
  
end
