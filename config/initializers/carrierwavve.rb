require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARRS335547IEU2KOG',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'railsradipod'
    config.cache_storage = :fog
   
  
end

