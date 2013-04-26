#!/usr/bin/env ruby

require 'open-uri'

filename = 'master.zip'
stream = 'https://github.com/japellerano/Web-Development-Template/archive/master.zip'

open(filename, 'wb').write(open(stream).read)

