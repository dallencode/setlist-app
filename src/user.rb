require 'json'
require_relative 'setlist'

class User
    attr_reader :name

    def user_name
        puts "What is your name?"
        @name = gets.chomp.capitalize
    end

    def welcome
        puts "Welcome #{@name}!"
    end
end

# p 'working' if File.file?('starter_list.json')
file = File.read('starter_list.json')
data_hash = JSON.parse(file, :symbolize_names => true)

data_hash.shuffle.each_with_index do |item, index| 
    puts "#{index + 1}. #{item[:name]} by #{item[:artist]}"
end