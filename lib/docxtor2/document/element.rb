module Docxtor2
  module Document
    class Element
      attr_accessor :elements

      def self.map(mappings)
        mappings.each do |name, klass|
          define_method(name) do |*args, &block|
            elements << klass.new(*args, &block)
            elements.last
          end
        end
      end

      def initialize(options = {}, &block)
        @elements = []
        @params = create_params(options)
        @block = block
        super()
      end

      def render(xml)
        @xml = xml
        instance_eval &@block if @block
      end

      protected

      def mappings
        {}
      end

      def aliases
        {}
      end

      def write_elements(xml)
        @elements.each { |el| el.render(xml) }
      end

      def write_element(name, &block)
        @xml.tag!("w:#{name}") do
          write_properties(name)
          instance_eval &block if block_given?
          write_elements(@xml)
        end
      end

      def write_properties(el)
        @properties = get_properties_for(el)
        unless @properties.nil?
          @xml.tag!("w:#{el}Pr") do
            @properties.each { |k, v| write_property(k, v) }
          end
        end
      end

      def write_property(key, val)
        if self_closing? val
          @xml.tag!("w:#{key}")
        elsif !val.nil?
          if val.is_a?(Hash) && !val.empty?
            @xml.tag!("w:#{key}", prefixize(val))
          elsif !val.to_s.empty?
            @xml.tag!("w:#{key}", 'w:val' => val)
          end
        end
      end

      private

      def create_params(options)
        Hash[options.map {|k,v| [aliases[k] || k, v]}]
      end

      def self_closing?(val)
        !!val == val && val
      end

      def get_properties_for(el)
        map = mappings[el]
        unless map.nil?
          pairs = @params.
            reject { |k, v| !map.key?(k) }.
            map { |k, v|
            element = map[k]
            element.is_a?(Hash) ?
            [element[:name], v] :
            [element, v]
          }
          Hash[pairs]
        end
      end

      def prefixize(attrs)
        Hash[attrs.map { |k, v| ["w:#{k}", v] }]
      end
    end
  end
end
