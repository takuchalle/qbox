# frozen_string_literal: true

require 'aws-sdk-s3'

class S3BucketClient
  def initialize
    region = ENV['S3_REGION']
    access_key = ENV['S3_ACCESS_KEY']
    secret_key = ENV['S3_SECRET_KEY']
    bucket_name = ENV['S3_BUCKET']
    s3 = Aws::S3::Resource.new(region: region,
                               access_key_id: access_key,
                               secret_access_key: secret_key)
    @bucket = s3.bucket(bucket_name)
  end

  def send(s3_path, file_path)
    o = @bucket.object("#{s3_path}/#{File.basename(file_path)}")
    o.upload_file(file_path)
  end
end
