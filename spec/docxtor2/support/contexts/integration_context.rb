module Docxtor2
  shared_context 'integration' do
    let(:template) { Known::Templates::DEFAULT }
    let(:docx) { File.join(Known::Path::TMP, 'test.docx') }
  end
end
