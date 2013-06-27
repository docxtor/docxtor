module Docxtor2
  shared_context 'template' do
    let(:template) { Known::Templates::DEFAULT }
    let(:docx) { File.join(Known::Path::TMP, 'test.docx') }
  end
end
