require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARRS33554QNPSKKUU',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'radipod'
    config.cache_storage = :fog
   
  
end

