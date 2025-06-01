#!/usr/bin/ruby
# validate Okta id_tokens in ~/.kube/pkce_helper.json
require "base64"
require "json"

config = JSON.load(File.read(File.expand_path("~/.kube/pkce_helper.json")))
config.each do |id, data|
  payload = data.fetch("id_token").split(".", 3)[1]
  remaining = Time.at(p(JSON.parse(Base64.urlsafe_decode64(payload))).fetch("exp")) - Time.now
  puts "#{id}\t-> #{remaining.to_i}s"
end
