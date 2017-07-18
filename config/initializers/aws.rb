CarrierWave.configure do |config|                 # required
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
  }
  config.fog_directory  = 'snowsuk'                          # required
end
