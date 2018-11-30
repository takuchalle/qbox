# coding: utf-8
# frozen_string_literal: true

require 's3_bucket_client'

module QuestionsHelper

  def create_image(q)
    html = get_html(q.content)

    file = Tempfile.new(["#{q.token}", '.png'], 'tmp', :encoding => 'ascii-8bit')
    file.write(IMGKit.new(html, quality: 20, width: 360, :'crop-w' => 850).to_png)
    file.flush

    client = S3BucketClient.new
    url = client.send("image/#{q.id}", file.to_path)
    file.unlink
    url
  end

  def get_html(body)
    <<~HTML
    <!DOCTYPE html>
<html lang="ja">
  <head>
	<meta charset="UTF-8">
	<style>
	  @charset "UTF-8";
	  html {
		  font-family: sans-serif;
		  -ms-text-size-adjust: 100%;
		  -webkit-text-size-adjust: 100%;
	  }
	  body {
		  width: 800px;
		  margin: 0;
	  }
	  .q-frame {
		  width: 100%;
		  background-color: #FA514B;
		  padding: 25px 25px 10px 25px;
	  }
	  .q-frame .q-body {
		  font-size: 3.8em;
		  background-color: white;
		  padding: 15px;
		  border-radius: 5px;
	  }
	  .q-frame .q-icon {
		  font-size: 3.4em;
		  padding: 5px 0px 0px 0px;
		  margin: 0px;
		  color: white;
		  border-radius: 5px;
	  }
	</style>
  </head>
  <body>
	<div class="q-frame">
	  <div class="q-body">
		#{body}
	  </div>
	  <div class="q-icon">
		Q Box
	  </div>
	</div>
  </body>
</html>
    HTML
  end
end
