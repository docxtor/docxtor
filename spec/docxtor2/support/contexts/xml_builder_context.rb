module Docxtor2
  shared_context 'xmlbuilder' do
    include WordprocessingMLMatchers

    let(:result) { '' }
    let(:builder) { Builder::XmlMarkup.new(:target => result) }
  end
end