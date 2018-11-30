# coding: utf-8
# frozen_string_literal: true

require 's3_bucket_client'

module QuestionsHelper
  def create_image(q)
    file = Tempfile.new(["#{q.token}", '.png'], 'tmp', :encoding => 'ascii-8bit')
    file.write(IMGKit.new(question_url(token: q.token, raw: 1), quality: 20, width: 800).to_png)
    file.flush

    client = S3BucketClient.new
    url = client.send("image/#{q.id}", file.to_path)
    file.unlink
    url
  end
end
