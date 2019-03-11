options = {
  :storage        => :s3,
  :preserve_files => true,
  :s3_host_name   => "ams3.digitaloceanspaces.com",
  :s3_region      => "ams3",
  :bucket         => "gettwifi",
  :s3_options     => {
    :endpoint         => "https://ams3.digitaloceanspaces.com",
    :force_path_style => true
  },
  :s3_credentials => {
    :access_key_id     => "WDNWPAMEIVDWQ2HCD4KI",
    :secret_access_key => "BMEP314LAYKxPDd9SRTEioSPgkEfhv0EW8nyNVE6DE0"
  }
}

Paperclip::Attachment.default_options.update(options)
