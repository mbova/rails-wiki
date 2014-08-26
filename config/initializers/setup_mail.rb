if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
      :port =>           '587',
      :address =>        'smtp.mandrillapp.com',
      :user_name =>      ENV['MANDRILL_USERNAME'],
      :password =>       ENV['MANDRILL_APIKEY'],
      :domain =>         'herokuapp.com',
      :authentication => :plain
  }
end