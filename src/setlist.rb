class Setlist
    def view(array)
        array.each_with_index do |item, index|
        return "#{index + 1}. #{item[:name].capitalize} by #{item[:artist].capitalize}"
        end
    end
end