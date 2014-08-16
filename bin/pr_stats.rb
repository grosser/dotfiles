#!/usr/bin/env ruby
require 'json'
require 'open-uri'

repo = ARGV[0] || raise("Give me user/repo")
token = `git config github.token`
raise "set github.token" unless $?.success?


page = 1
per_page = 100
all = []
loop do
  puts "page #{page}"
  content = open("https://api.github.com/repos/#{repo}/pulls?state=all&page=#{page}&per_page=#{per_page}", "Authorization" => "token #{token}").read
  content = JSON.load(content)
  all.concat content
  break if content.size < per_page
  page += 1
end

users = all.map { |x| x["base"]["user"]["login"] }
puts users.group_by { |x| x }.sort_by { |u,x| -1 * x.size }[0..50].map { |u,x| "#{u}: #{x.size}" }

