module Docxtor2
  class Package::Document::Element < ElementList
    include BlockEvaluator
    include ObjectUtils

    def initialize(*args, &block)
      @params = create_attributes(args)
      @block = block
      super()
    end

    def render(xml)
      @xml = xml
      evaluate &@block
    end

    protected

    def mappings
      {}
    end

    def aliases
      {}
    end

    def write_element(name, &block)
      @xml.tag!("w:#{name}") do
        write_properties(name)
        evaluate &block
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
      elsif val.is_a?(Hash) && !val.empty?
        @xml.tag!("w:#{key}", prefixize(val))
      else
        @xml.tag!("w:#{key}", 'w:val' => val)
      end
    end

    private

    def create_attributes(args)
      hash = find_argument(args, Hash, {})
      pairs = hash.map do |k, v|
        aliases.key?(k) ? [aliases[k], v] : [k, v]
      end
      Hash[pairs]
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