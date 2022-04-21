require 'json'
require_relative 'setlist'

class User
    attr_reader :name

    def check_user_exists
        puts "What is your name?"
        @name = gets.chomp.capitalize
        puts File.file?("#{@name.downcase}.json") ? "Welcome back, #{@name}!" : "Welcome #{@name}!"
    end
end

# file = File.read('starter_list.json')
# data_hash = JSON.parse(file, :symbolize_names => true)

# data_hash.shuffle.each_with_index do |item, index| 
#     puts "#{index + 1}. #{item[:name]} by #{item[:artist]}"
# end