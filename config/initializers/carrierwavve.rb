require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development? 
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'radipod'
    config.asset_host = 'https://s3.amazonaws.com/radipod'
    
    config.fog_public = false 
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARRS33554QNPSKKUU',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1',
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end