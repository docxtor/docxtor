shared_context 'template' do
  let(:template) { Docxtor2::Tests::Templates::MINIMAL_PATH }
  let(:docx) { Docxtor2::Tests::DOCX_PATH }

  let(:search_pattern) { configus.search_pattern }
end