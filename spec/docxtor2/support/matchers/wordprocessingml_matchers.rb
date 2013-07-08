module WordprocessingMLMatchers
	include XPathMatchers

	def contain_body
		exist_xpath('//w:document/w:body')
	end

	def contain_paragraph_text
		exist_xpath('//w:p/w:r/w:t')
	end

	def contain_paragraph_run
		exist_xpath('//w:p/w:r')
	end

	def contain_element_property(el, prop)
		exist_xpath("//w:#{el}/w:#{el}Pr/w:#{prop}")
	end

	def contain_element_style(el)
		contain_element_property(el, 'pStyle')
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