require 'json'
require 'tty-file'
require_relative 'setlist'

class User
    attr_reader :filename
    attr_reader :name

    def check_user_exists
        print "Enter your name: "
        @name = gets.chomp.capitalize
        system("clear") || system("cls")
        puts File.file?("#{@name.downcase}.json") ? "Welcome back, #{@name}!" : "Welcome #{@name}!"
        @filename = File.new("#{@name.downcase}.json","w") if !File.file?("#{@name.downcase}.json")
    end
end