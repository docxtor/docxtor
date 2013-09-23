module Docxtor
  module Document
    class Paragraph < Element
      STYLE = 'a5'

      PROPERTIES =
        {
        :p => {
          :style => 'pStyle',
          :align => 'jc',
          :font_size => 'sz',
          :font_size_complex => 'szCs',
          :spacing => {
            :name => 'spacing',
            :before => 'before',
            :after => 'after'
          },
          :indent => {
            :name => 'ind',
            :start => 'start',
            :end => 'end',
            :hanging => 'hanging'
          }
        },
        :r => {
          :bold => 'b',
          :italic => 'i',
          :underline => 'u'
        }
      }

      PLAIN_PROPERTIES =
        PROPERTIES[:p].reject {|k,v| v.is_a? Hash}

      NESTED_PROPERTIES =
        PROPERTIES[:p].reject {|k,v| !v.is_a? Hash}

      def after_initialize(*args)
        @contents = []
        @contents << args.shift if args.first.is_a? String

        create_params(args.shift || {})

        NESTED_PROPERTIES.each do |name, element|
          @params[name] ||= {}
        end
        @params[:space] ||= 'default'
      end

      def render(xml)
        super
        write_element(:p) do
          write_element(:r) do
            write_contents
          end
        end
      end

      PLAIN_PROPERTIES.each do |name, element|
        define_method(name) { |val| @params[name] = val }
      end

      PROPERTIES[:r].each do |name, element|
        define_method(name) { @params[name] = true }
      end

      NESTED_PROPERTIES.each do |name, element|
        define_method(name) { |attrs| @params[name].merge!(attrs) }
      end

      def properties
        PROPERTIES
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

      def aliases
        {
          :b => :bold,
          :i => :italic,
          :u => :underline
        }
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
