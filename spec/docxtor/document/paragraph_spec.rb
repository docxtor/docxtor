require 'spec_helper'

module Docxtor
  describe Document::Paragraph do
    include_context 'xmlbuilder' do

      subject {
        render(Document::Paragraph, "text1", :b => true) do
          style 123
          spacing :before => 80, :after => 240
          font_size 32
          font_size_complex 30
          indent :start => 720
          i; u

          w "text2"; br; w "text3"
        end
      }

      it 'contains reference to style' do
        expect { subject.include? "w:pStyle" }
      end

      it 'contains spacing property' do
        expect { subject.include? "w:spacing" }
      end

      it 'contains font size property' do
        expect { subject.include? "w:sz" }
      end

      it 'contains complex font size property' do
        expect { subject.include? "w:szCs" }
      end

      it 'contains indentiation property' do
        expect { subject.include? "w:ind" }
      end

      context 'nested run' do
        it 'is bold' do
          expect { subject.include? "<w:b/>" }
        end

        it 'is italic' do
          expect { subject.include? "<w:i/>" }
        end

        it 'is underlined' do
          expect { subject.include? "<w:u/>" }
        end
      end

    end
  end
end
