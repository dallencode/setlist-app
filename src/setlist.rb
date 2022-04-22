require 'json'
require 'combine_pdf'
require 'colorize'
require_relative 'user'

class String
  def titleize
    split(/ |_/).map(&:capitalize).join(' ')
  end
end

class Setlist
  def view(array)
    puts "New Set List (#{array.size} items)".colorize(:light_blue).colorize(background: :black)
    array.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name].titleize} by #{item[:artist].titleize}"
    end
  end
end
