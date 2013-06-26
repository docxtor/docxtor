xml.instruct! :xml, :version => "1.0", :encoding=>"UTF-8", :standalone => "yes"
xml.w :styles, "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main" do |xml|
  xml.w :style, "w:type" => "paragraph", "w:styleId" => "h1" do |xml|
    xml.w :name, "w:val" => "h1"
    xml.w :qFormat
    xml.w :rsid, "w:val" => "00F85845"
    xml.w :pPr do |xml|
      xml.w :spacing, "w:line" => "480", "w:lineRule" => "auto"
      xml.w :ind, "w:firstLine" => "480"
      xml.w :outlineLvl, "w:val" => "0"
    end
    xml.w :rPr do |xml|
      xml.w :rFonts, "w:ascii" => "Algerian", "w:hAnsi" => "Algerian"
      xml.w :sz, "w:val" => "40"
    end
  end
end
