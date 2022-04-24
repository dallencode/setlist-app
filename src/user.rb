# frozen_string_literal: true

require 'json'
require 'tty-file'
require_relative 'setlist'

class User
  attr_reader :filename, :name

  def check_user_exists
    if ARGV.empty?
      print 'Enter your name: '
      @name = gets.chomp.capitalize
    else
      @name = ARGV[0].capitalize
    end
    # Creates new file
    puts File.file?("#{@name.downcase}.json") ? "Welcome back, #{@name}!" : "Welcome #{@name}!"
    @filename = File.new("#{@name.downcase}.json", 'w') unless File.file?("#{@name.downcase}.json")
  end
end