require 'spec_helper'

module Docxtor
  describe RunningElement do
    subject { RunningElement.new :footer, 1, :pagenum, {:pages => "odd"} }

    it "can have referenve_id assigned to it" do
      subject.reference_id = "rId1"

      expect { subject.reference_id == "rId1" }
    end

    it "responds to 'reference_name'" do
      expect { subject.reference_name == "footerReference" }
    end

    it "responds to 'name'" do
      expect { subject.name == "footer1.xml" }
    end

    it "responds to 'filename'" do
      expect { subject.filename == "word/footer1.xml" }
    end

    it "responds to 'reference_type'" do
      expect { subject.reference_type == "http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer" }
    end

    describe "#content" do
      it "returns xml with correct contents markup" do
        expect {
          subject.content.include? "instrText"
          subject.content.include? "PAGE"
        }
      end
    end
  end
end
