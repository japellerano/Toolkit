#!/usr/bin/env ruby

# Requirements
require 'fileutils'

# Variables
template_repo = 'https://github.com/japellerano/Web-Development-Template.git'
dirs = ["sass", "css", "js", "images"] # Directory Layout
partials = ["_settings.scss", "_functions.scss"] # SASS Partials
sass = ["ie.scss", "shame.scss"] # SASS Other Files
js = ["custom.js"] # Javascript Files


# Methods
def get_files(filename)
  case filename
  when "gitignore"
    exec("curl -O https://raw.github.com/japellerano/Web-Development-Template/master/.gitignore")
  when "jquery"
    exec("curl -O http://code.jquery.com/jquery-2.0.0.min.js")
  when "config"
    exec("curl -O https://raw.github.com/japellerano/Web-Development-Template/master/config.rb ")
  when "index"
    exec("curl -O https://raw.github.com/japellerano/Web-Development-Template/master/index.html")
  when "master"
    exec("curl -O https://raw.github.com/japellerano/Web-Development-Template/master/sass/master.scss")
  when "modernizr"
    exec("curl -O https://raw.github.com/japellerano/Web-Development-Template/master/js/modernizr.min.js")
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
  # puts Dir.getwd
  Dir.mkdir("partials")
  partials.each do |p|
    FileUtils.touch(p)
    puts "Creating #{p}"
  end
  Dir.chdir(workdir)
  # puts Dir.getwd

  # Create Files in Main Directory
  FileUtils.touch('README.MD') # README

  Dir.chdir("js")
  js.each do |j|
    FileUtils.touch(j)
    puts "Creating #{j}"
  end
  Dir.chdir(workdir)
  puts Dir.getwd

end

# Project Name
puts "Enter the project name: "
project_name = gets.chomp!

create_project(project_name, dirs, partials, sass, js)
