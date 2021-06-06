Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['client_id_dev'], ENV['client_secret_dev']
end
