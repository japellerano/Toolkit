#!/usr/bin/env ruby

require 'open-uri'

filename = 'master.zip'
stream = 'https://github.com/japellerano/Web-Development-Template/archive/master.zip'

# Methods
def separate_url(url)
  s = url.split("/")
  l = s.length
  return s[l - 1]
end

def download(filename, url)
  open(filename, 'wb').write(open(url).read)
end

puts "Welcome to Estel, please enter the URL of the file you would like to download: "
path = gets.chomp!

download(separate_url(path), path)
