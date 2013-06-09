Rails.application.config.middleware.use OmniAuth::Builder do
  # SWorD consumer keys and secret
  # provider :provider_name, '[consumer_key]', '[consumer_secret]'
  provider :twitter, '5ODI4PtWJBq7TOGdHgJgUw', 'fqObTrGWLsxosTBwOmMZHTTFu4uqwOuKg2KLPcHWFQk'
  provider :facebook, '182733771888507', 'f50d748671dbe42700b4c7b449fbdb15', client_options: { ssl: { ca_file: "#{Rails.root}/config/cacert.pem" } }
end
