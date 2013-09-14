module Docxtor2
  module Document
    class Paragraph < Element
      def initialize(*args, &block)
        @contents = []
        @contents << args.shift if args.first.is_a? String
        options = args.shift || {}

        super(options, &block)
        Known::Mappings::PARAGRAPH_COMPLEX.each do |name, element|
          @params[name] ||= {}
        end
        @params[:space] ||= 'default'
      end

      def render(xml)
        super(xml)
        write_element(:p) do
          write_element(:r) do
            write_contents
          end
        end
      end

      Known::Mappings::PARAGRAPH_SIMPLE.each do |name, element|
        define_method(name) { |val| @params[name] = val }
      end
      Known::Mappings::RUN.each do |name, element|
        define_method(name) { @params[name] = true }
      end
      Known::Mappings::PARAGRAPH_COMPLEX.each do |name, element|
        define_method(name) { |attrs| @params[name].merge!(attrs) }
      end

      def line_break
        @contents << :br
      end

      def preserve_whitespace
        @params[:space] = 'preserve'
      end

      def write(text)
        @contents << text
      end

      protected

      def mappings
        super.merge({
                      :p => Known::Mappings::PARAGRAPH,
                      :r => Known::Mappings::RUN
                    })
      end

      def aliases
        super.merge({
                      :b => :bold,
                      :i => :italic,
                      :u => :underline
                    })
      end

      private

      def write_contents
        @contents.each { |c| write_content(c) }
      end

      def write_content(content)
        content == :br ?
        write_line_break :
          write_text(content)
      end

      def write_line_break
        @xml.w :br
      end

      def write_text(text)
        @xml.w :t, 'xml:space' => @params[:space] do
          @xml.text! text
        end
      end

      alias_method :b, :bold
      alias_method :i, :italic
      alias_method :u, :underline
      alias_method :br, :line_break
      alias_method :w, :write
      alias_method :ind, :indent
    end
  end
end
