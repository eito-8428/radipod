require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARRS335542BOEVX6D',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'railsradipod'
    config.cache_storage = :fog
   
  
end

