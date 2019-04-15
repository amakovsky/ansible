options = {
  :storage        => :s3,
  :preserve_files => true,
  :s3_host_name   => "s3.eu-west-2.amazonaws.com",
  :s3_region      => "eu-west-2",
  :bucket         => "gettwifi",
  :s3_protocol    => :https,
  :s3_options     => {
    :endpoint         => "https://s3.eu-west-2.amazonaws.com",
    :force_path_style => true
  },
  :s3_credentials => {
    :access_key_id     => "AKIAT7MHXCQ6JJ77JQWF",
    :secret_access_key => "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"
  }
}

Paperclip::Attachment.default_options.update(options)
