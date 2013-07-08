module WordprocessingMLMatchers
	include XPathMatchers

	def contain_paragraph_text
		exist_xpath('//w:p/w:r/w:t')
	end

	def contain_paragraph_run
		exist_xpath('//w:p/w:r')
	end

	def contain_element_style(el)
		exist_xpath("//w:#{el}/w:#{el}Pr/w:pStyle")
	end

	def contain_gallery_of_document_parts
		exist_xpath('//w:sdt/w:sdtPr/w:docPartObj/w:docPartGallery')
	end

	def contain_sdt_content_heading
		exist_xpath('//w:sdt/w:sdtPr/w:docPartObj/w:docPartGallery')
	end

	def contain_table_of_contents
		contain_gallery_of_document_parts &&
		contain_sdt_content_heading
	end
end