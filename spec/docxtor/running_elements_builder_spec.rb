require 'spec_helper'

module Docxtor
  describe RunningElementsBuilder do
    subject {
      RunningElementsBuilder.new do
        header :pagenum, :align => :center
        footer "Made by me", :pages => :odd
        footer "2013", :pages => :even
      end
    }

    it "has elements" do
      expect { subject.respond_to?(:elements) }
    end

    describe "#elements" do
      it "returns a list of running elements" do
        expect {
          subject.elements.count == 3
        }
      end
    end
  end
end
