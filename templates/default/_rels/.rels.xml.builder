xml.instruct! :xml, :version => "1.0", :encoding=>"UTF-8", :standalone => "yes"
xml.Relationships :xmlns => "http://schemas.openxmlformats.org/package/2006/relationships" do |xml|
  xml.Relationship :Id => "rId1", 
    :Type => "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument", 
     :Target => "word/document.xml"
end
