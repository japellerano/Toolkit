#!/usr/bin/env ruby

# Requirements
require 'rubygems'
require 'fileutils'
require 'archive/zip'

# Files or directories not wanting to include in production
exclude = ['config.rb', 'sass']

#Methods

def lower(array)
  array.each do |item|
    item.downcase!
  end
end

def excluded(files_list, excluded_files)
  files_list.any? do |file|
    if excluded_files.include?(file) == true
      files_list.delete(file)
      puts "Removed: #{file}..."
    end
  end

  files_list.each do |file|
    puts file
  end
end

def list(array)
  array.each do |i|
    puts i
  end
end

def make_copy(working, production_folder, excluded_files)
  Dir.chdir('..')
  puts Dir.getwd
  puts working
  puts working_files = working + "/*"
  FileUtils.mkdir production_folder
  FileUtils.cp_r(Dir[working_files], production_folder)
  puts "Created #{production_folder}..."
  Dir.chdir(production_folder)
  puts Dir.getwd

  files = Dir.glob("*")

  files.any? do |file|
    if excluded_files.include?(file) == true
      FileUtils.rm_rf(file)
      puts "File #{file} removed"
    end
  end

  Dir.chdir('..')
 
  puts "Creating Zip..." 
  Archive::Zip.archive("#{production_folder}.zip", "#{production_folder}")
  puts "Zip Created!"


  puts "Deleting #{production_folder}..."
  FileUtils.rm_rf(production_folder)
end

# Tests
# puts Dir.getwd
working_dir = Dir.getwd

# Return files in Working Dir
# puts Dir.glob('*') # Not Inlcuding Dot Files

# Add Files to Array
# files = Dir.glob('*')


# lower(files)
# lower(exclude)

# excluded(files, exclude)

make_copy(working_dir, 'project_test', exclude)

