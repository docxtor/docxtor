module Docxtor2
  module Known
    module Mappings
      PARAGRAPH = {
        :style => 'pStyle',
        :align => 'jc',
        :font_size => 'sz',
        :font_size_complex => 'szCs',
        :spacing => {
          :name => 'spacing',
          :before => 'before',
          :after => 'after'
        },
        :indent => {
          :name => 'ind',
          :start => 'start',
          :end => 'end',
          :hanging => 'hanging'
        }
      }
      PARAGRAPH_SIMPLE  = PARAGRAPH.reject { |k, v|  v.is_a? Hash }
      PARAGRAPH_COMPLEX = PARAGRAPH.reject { |k, v| !v.is_a? Hash }

      RUN = {
        :bold => 'b',
        :italic => 'i',
        :underline => 'u'
      }
    end
  end
end