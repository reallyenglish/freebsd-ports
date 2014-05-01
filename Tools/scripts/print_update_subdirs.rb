#!/usr/local/bin/ruby
#
# print_update_subdirs.rb
#
# Author:: Mitsuru Y (<mitsuruy@reallyenglish.com>)
# Copyright (c) 2014 Real English Broadband. All rights reserved.
#
# This program is free software; you can redistribute it and/or 
# modify it under the terms of the "BSD License" which is 
# distributed with the software in the file LICENSE.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the BSD
# License for more details.
#
require 'pathname'
require 'fileutils'
require 'optparse'

DEBUG = nil
$ignoredirs = Array.new

opt = OptionParser.new

opt.on('-d', '--debug') {|v| $debug = v}
opt.on('-i', '--ignore-dirs=VAL') {|v| $ignoredirs = v.split}
opt.parse!(ARGV)
STDERR.puts "ignore-dirs = " + $ignoredirs.to_s if $debug
STDERR.puts "ARGV = " + ARGV.to_s if $debug

def find_subdirs(directory)
  p directory if $debug
  result = Array.new
  Dir.foreach(directory) do |dir|
    p dir if $debug
    next if (dir =~ /^\./ or $ignoredirs.include?(dir))
    result << dir if FileTest.directory?(directory + "/" +  dir)
  end 
  return result.sort
end

def parse_subdirs(filename)

  subdirs = Array.new

  header = ""
  footer = ""

  open(filename) do |file|
    line = ""
    while (line = file.gets) !~ /SUBDIR \+=/ and line
      header +=  line
    end
      subdirs << line.split.last
    while (line = file.gets) =~ /SUBDIR \+=/ and line
      subdirs << line.split.last
    end
    footer += line
    while (line = file.gets) !~ /SUBDIR \+=/ and line
      footer += line
    end
  end
  subdirs
end

categories = parse_subdirs("Makefile")
categories.each do |category|
  p category if $debug
  subdirs_previous = parse_subdirs(category+"/Makefile")
  subdirs = find_subdirs(category)
  p subdirs if $debug
  (subdirs - subdirs_previous).each do |subdir|
    puts "echo SUBDIR += " + subdir + " >> " + category + "/Makefile"
  end
  (subdirs_previous - subdirs).each do |subdir|
    puts "remove SUBDIR += " + subdir + " from " + category + "/Makefile"
  end
end
