# encoding: utf-8
require File.expand_path('xpath_matchers', File.dirname(__FILE__))

module WordprocessingMLMatchers
	extend RSpec::Matchers::DSL
	include XPathMatchers

	def contain_body
		exist_xpath('//w:document/w:body')
	end

  def contain_element(el)
    exist_xpath('//w:#{el}')
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

	# TODO: These a not the same, fix it

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
