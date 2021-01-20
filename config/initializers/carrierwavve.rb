require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = ENV['radipod']
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AKIARRS33554QNPSKKUU'],
    aws_secret_access_key: ENV['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'],
    region: ENV['ap-northeast-1'],
    path_style: true
  }
end