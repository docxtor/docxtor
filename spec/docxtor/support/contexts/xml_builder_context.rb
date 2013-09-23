module Docxtor2
  shared_context 'xmlbuilder' do
    include WordprocessingMLMatchers

    def render(klass, *args, &block)
      builder = Builder::XmlMarkup.new
      klass.new(*args, &block).render(builder)
      builder.target!
    end
  end
end