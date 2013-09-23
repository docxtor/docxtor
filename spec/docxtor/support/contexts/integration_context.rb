module Docxtor
  shared_context 'integration' do
    let(:template) { File.join(File.dirname(__FILE__), "..", "..", "..", "..", "templates", "default") }
    let(:docx) { File.join(File.dirname(__FILE__), "..", "..", "tmp", 'test.docx') }
  end
end
