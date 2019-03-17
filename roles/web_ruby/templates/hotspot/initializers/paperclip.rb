options = {
  :storage        => :s3,
  :preserve_files => true,
  :s3_host_name   => "{{ s3.host_base }}",
  :s3_region      => "ams3",
  :bucket         => "gettwifi",
  :s3_options     => {
    :endpoint         => "https://{{ s3.host_base }}",
    :force_path_style => true
  },
  :s3_credentials => {
    :access_key_id     => "{{ s3.access_key }}",
    :secret_access_key => "{{ s3.secret_key }}"
  }
}

Paperclip::Attachment.default_options.update(options)
