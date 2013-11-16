require 'spec_helper'

module Docxtor
  describe Document::Root do
    include_context "xmlbuilder" do

      it 'appends element to elements' do
        root = Document::Root.new(:style => 1) do
          p do
            w "Hi"
          end
        end

        expect { root.elements.first.should be_instance_of Docxtor::Document::Paragraph }
      end

      it "ignores certain known methods" do
        root = Document::Root.new(:style => 1) do
          footer "2013"
        end

        expect { root.elements.empty? }
      end

      it "throws an error if unknown method is passed" do
        root = begin
          Document::Root.new(:style => 1) { bla "Ble" }
        rescue NoMethodError
          "UnknownMethod"
        end

        expect { root == "UnknownMethod" }
      end
    end
  end
end
