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
def get_files
  # Needs switch statement
  exec("curl -O ") # .gitignore
  exec("curl -O ") # jquery.min.js
  exec("curl -O ") # config.rb
  exec("curl -O ") # index.html
  exec("curl -O ") # master.scss
  exec("curl -O ") # Modernizr
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
