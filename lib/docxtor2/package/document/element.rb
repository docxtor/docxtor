module Docxtor2
  class Package::Document::Element
    include BlockEvaluator
    
    PR_SUFFIX = 'Pr'

    @@map = {
      :p => { :style => 'pStyle', :align => 'jc' },
      :r => { :bold => 'b', :italic => 'i', :underline => 'u' }
    }

    def initialize(attrs = {}, &block)
      @attrs = attrs
      @block = block

      @attrs[:space] ||= 'default'
    end

    def render(xml)
      @xml = xml
      evaluate &@block
    end

    protected

    def el(name, &block)
      @xml.tag!("w:#{name}") do
        props(name)
        evaluate &block
      end
    end

    def props(el)  
      @props = props_for(el)
      unless @props.empty?
        @xml.tag!("w:#{el}#{PR_SUFFIX}") do
          @props.each { |k, v| prop(k, v) }
        end
      end
    end

    def prop(key, val)
      if self_closing? val
        @xml.w key
      else
        @xml.tag!("w:#{key}", 'w:val' => val)
      end
    end

    private

    def self_closing?(val)
      !!val == val && val
    end

    def props_for(el)
      map = @@map[el]
      raise ArgumentError, "Element not supported" if map.nil?
      pairs = @attrs.
        reject { |k, v| !map.key?(k) }.
        map { |k, v| [map[k], v] }
      Hash[pairs]
    end

  end
end