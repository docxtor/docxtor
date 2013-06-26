xml.instruct! :xml, :version => "1.0", :encoding=>"UTF-8", :standalone => "yes"

xml.Types :xmlns => "http://schemas.openxmlformats.org/package/2006/content-types" do |xml|
  
  xml.Default :Extension => "rels", :ContentType => "application/vnd.openxmlformats-package.relationships+xml"
  xml.Default :Extension => "xml", :ContentType => "application/xml"
  
  xml.Override :PartName => "/word/document.xml", :ContentType => "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"
  xml.Override :PartName => "/word/styles.xml", :ContentType => "vnd-openxmlformats.officedocument.wordprocessingml.styles+xml"
end
