#!/usr/bin/env ruby

# Requirements
require 'fileutils'
require 'open-uri'

# Variables
template_repo = 'https://github.com/japellerano/Web-Development-Template.git'
dirs = ["sass", "css", "js", "images"] # Directory Layout
partials = ["_settings.scss", "_functions.scss"] # SASS Partials
sass = ["ie.scss", "shame.scss"] # SASS Other Files
js = ["custom.js"] # Javascript Files


# Methods
def get_file(file, url)
  open(file, 'wb').write(open(url).read)
end

def get_files(filename)
  case filename
  when "gitignore"
    get_file('.gitignore', 'https://raw.github.com/japellerano/Web-Development-Template/master/.gitignore')
  when "jquery"
    get_file('jquery-2.0.0.min.js', 'http://code.jquery.com/jquery-2.0.0.min.js')
  when "config"
    get_file('config.rb', 'https://raw.github.com/japellerano/Web-Development-Template/master/config.rb')
  when "index"
    get_file('index.html', 'https://raw.github.com/japellerano/Web-Development-Template/master/index.html')
  when "master"
    get_file('master.scss', 'https://raw.github.com/japellerano/Web-Development-Template/master/sass/master.scss')
  when "modernizr"
    get_file('modernizr.min.js', 'https://raw.github.com/japellerano/Web-Development-Template/master/js/modernizr.min.js')
  end
  
end

def create_project(project_name, directories, partials, sass, js)
  
  # Create Project Folder
  Dir.mkdir(project_name, 0755)
  puts "Created #{project_name}"
  Dir.chdir(project_name)
  workdir = Dir.getwd
  puts workdir
  
  # Create Sub-Directories
  directories.each do |d|
    Dir.mkdir(d, 0755)
    puts "Creating #{d}..."
  end

  # Create partials
  Dir.chdir("sass")
  sass.each do |s|
    FileUtils.touch(s)
    puts "Creating #{s}"
  end
  get_files("master")
  puts File.exist?("master.scss")
  # puts Dir.getwd
  Dir.mkdir("partials")
  Dir.chdir("partials")
  partials.each do |p|
    FileUtils.touch(p)
    puts "Creating #{p}"
  end
  Dir.chdir(workdir)
  # puts Dir.getwd

  # Create Files in Main Directory
  FileUtils.touch('README.MD') # README
  get_files("gitignore")
  get_files("index")
  get_files("config")

  Dir.chdir("js")
  js.each do |j|
    FileUtils.touch(j)
    puts "Creating #{j}"
  end
  get_files("jquery")
  get_files("modernizr")
  Dir.chdir(workdir)
  puts Dir.getwd

end

# Project Name
puts "Enter the project name: "
project_name = gets.chomp!

create_project(project_name, dirs, partials, sass, js)
