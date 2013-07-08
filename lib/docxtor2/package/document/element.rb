module Docxtor2
  class Package::Document::Element
    include BlockEvaluator
    
    PR_SUFFIX = 'Pr'

    # TODO: Maybe styles for elements should be in element class
    # or somewhere in one known place, not here

    @@aliases = { 
      :b => :bold, 
      :i => :italic, 
      :u => :underline
    }

    @@map = {
      :p => { :style => 'pStyle', :align => 'jc' },
      :r => { :bold => 'b', :italic => 'i', :underline => 'u' }
    }

    def initialize(*args, &block)
      @attrs = self.class.create_attrs(args)
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
        @xml.tag!("w:#{key}")
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
      pairs = @attrs.
        reject { |k, v| !map.key?(k) }.
        map { |k, v| [map[k], v] }
        
      Hash[pairs]
    end

    def self.create_attrs(args)
      hash = args.find { |arg| arg.is_a? Hash } || {}
      
      pairs = hash.map do |k, v| 
        @@aliases.key?(k) ? 
          [@@aliases[k], v] : [k, v]
      end

      Hash[pairs]
    end

  end
end