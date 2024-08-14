require "base64"
require "json"

config = JSON.load(File.read(File.expand_path("~/.kube/pkce_helper.json")))
config.each do |id, data|
  payload = data.fetch("id_token").split(".", 3)[1]
  remaining = Time.now - Time.at(JSON.parse(Base64.urlsafe_decode64(payload)).fetch("exp"))
  puts "#{id}\t-> #{remaining.to_i}s"
end
