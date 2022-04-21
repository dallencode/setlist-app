require 'json'
require 'combine_pdf'
require_relative 'user'

class String  
  def titleize
    self.split(/ |\_/).map(&:capitalize).join(" ")
  end
end

class Setlist
    def view(array)        
        puts "New Set List (#{array.size} items)"
        array.each_with_index do |item, index| 
            puts "#{index + 1}. #{item[:name].titleize} by #{item[:artist].titleize}"
        end

    end
end