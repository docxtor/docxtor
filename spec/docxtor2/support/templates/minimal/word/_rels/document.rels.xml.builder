ref = references["word/document.xml.rels"]

xml.instruct! :xml, :version => "1.0", :encoding=>"UTF-8", :standalone => "yes"
xml.Relationships :xmlns => "http://schemas.openxmlformats.org/package/2006/relationships" do |xml|
  xml.Relationship :Id => ref["styles.xml"], :Type => "http://purl.oclc.org/ooxml/officeDocument/relationships/styles", :Target => "styles.xml"
  page_options.headers_footers.each do |hf|
    xml.Relationship :Id => hf.reference_id, :Type => "http://purl.oclc.org/ooxml/officeDocument/relationships/#{hf.class.to_s.downcase.split('::').last}", :Target => hf.target
  end if page_options && page_options.headers_footers
end
