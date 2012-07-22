#!//usr/bin/env ruby
# Open mailto in gmail for ubuntu.
# Got to System > Preferences > Preferred Applications
# and add '/home/your-name/bin/new_mail_in_gmail.rb %s'
mail = ARGV[0].sub('mailto://','')
puts "sending to #{mail}"
exec "chromium-browser 'https://mail.google.com/mail?view=cm&tf=0&to=#{mail}'"
