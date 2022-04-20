class String  
  def titleize
    self.split(/ |\_/).map(&:capitalize).join(" ")
  end
end

class Setlist

    def view(array)
        array.each_with_index do |item, index| 
            puts "#{index + 1}. #{item[:name].titleize} by #{item[:artist].titleize}"
            # change this to populate and return new array
        end
    end

    def export_pdf
        require 'combine_pdf'
        arr = ["test", "test2"]
        pdf = CombinePDF.new
        pdf.new_page.textbox "Test pdf content", font_size: 18, opacity: 0.75
        pdf.save 'test.pdf'
        # Choose file save location?
        # Potentially a useless feature
        
    end
end

export = Setlist.new
export.export_pdf

# method for final set list. Use .shuffle to randomize order.