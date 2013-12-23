module Docxtor
  module Document
    class Element
      attr_accessor :elements, :xml

      def self.map(mappings)
        mappings.each do |name, klass|
          define_method(name) do |*args, &block|
            elements << klass.new(*args, &block)
          end
        end
      end

      def method_missing name, *args
        super unless [:header, :footer].include? name
      end

      def initialize(*args, &block)
        @elements = []

        # FIXME You have to call #create_params in this hook
        after_initialize(*args)

        instance_eval &block if block_given?
      end

      def render(xml)
        @xml = xml
      end

      protected

      def after_initialize *args; end

      def properties
        {}
      end

      def aliases
        {}
      end

      def write_elements
        @elements.each { |el| el.render(@xml) }
      end

      def write_element(name, &block)
        xml.tag!("w:#{name}") do
          write_properties(name)
          instance_eval &block if block_given?
          write_elements
        end
      end

      def write_properties(el)
        @properties = get_properties_for(el)
        if @properties
          xml.tag!("w:#{el}Pr") do
            @properties.each { |k, v| write_property(k, v) }
          end
        end
      end

      def write_property(key, val)
        if self_closing? val
          xml.tag!("w:#{key}")
        elsif val
          if val.is_a?(Hash) && !val.empty?
            xml.tag!("w:#{key}", prefixize(val))
          else
            xml.tag!("w:#{key}", 'w:val' => val)
          end
        end
      end

      private

      def create_params(options)
        @params = Hash[options.map {|k,v| [aliases[k] || k, v]}]
      end

      def self_closing?(val)
        val == true
      end

      def get_properties_for(el)
        props = properties[el]
        if props
          pairs = @params.map do |k, v|
            unless props[k].nil?
              props[k].is_a?(Hash) ? [props[k][:name], v] : [props[k], v]
            end
          end
          Hash[pairs]
        end
      end

      def prefixize(attrs)
        Hash[attrs.map { |k, v| ["w:#{k}", v] }]
      end
    end
  end
end
