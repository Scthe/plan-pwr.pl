module Epure
  module Generators
    class PDF < Generator
      OPTIONS = {
        :orientation => "Landscape", 
        :margin_top => '3mm',
        :margin_bottom => '3mm',
        :margin_left => '3mm',
        :margin_right => '3mm'
      }
    
      def generate(html, options = {})
        ::PDFKit.new(html, OPTIONS.merge(options)).to_pdf
      end
    end
  end
end
