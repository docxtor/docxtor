module Docxtor2
  class Package::Document::Element
    include Evaluator
    
    def initialize(attrs = {}, &block)
      @map = {
        :p => { :style => 'pStyle', :align => 'jc' },
        :r => { :bold => 'b', :italic => 'i', :underline => 'u' }
      }
      
      @attrs = attrs
      evaluate &block
    end

    def render(xml)
      raise NotImplementedError.new
    end

    protected

    def el(name)
      @xml.w name do
        props(name)
        yield if block_given?
      end
    end

    def props(el)  
      @props = props_for(el)
      unless @props.empty?
        @xml.w :"#{el}Pr" do
          @props.each { |k, v| prop(k, v) }
        end
      end
    end

    def prop(key, val)
      if self_closing? val
        @xml.w tag
      else
        @xml.w tag, 'w:val' => val
      end
    end

    private

    def self_closing?(val)
      !!val == val && val
    end

    def props_for(el)
      map = @map[el]
      pairs = @attrs.
        reject { |k| map.key?(k) }.
        map { |k, v| [map[k], v] }

      Hash[pairs]
    end

  end
end