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
  config.secret_key = '9d09e98d8ddd53369053ca19e06f0928f60ba84cac0498f3822a7b17efe008ac057766bcb44df0ff8bfbf5c8d8d84874469c947fc424f8cb76500b81b18b014c'

  config.stretches = Rails.env.test? ? 1 : 10
  
  
end
