docxtor
========

[![Build Status](https://travis-ci.org/docxtor/docxtor.png?branch=master)](https://travis-ci.org/docxtor/docxtor)
[![Coverage Status](https://coveralls.io/repos/vyorkin/docxtor/badge.png)](https://coveralls.io/r/docxtor/docxtor)
[![Dependency Status](https://gemnasium.com/vyorkin/docxtor.png)](https://gemnasium.com/docxtor/docxtor)
[![Gem Version](http://stillmaintained.com/vyorkin/docxtor.png)](http://stillmaintained.com/docxtor/docxtor)

## Summary

Ruby docx generator.
Supported ruby versions: ree-1.8.7, mri 1.8.7

## Features

1. Paragraphs and headings: bold, italic, custom style id, line breaks, page breaks, spacing
2. Table of contents

More to come, stay tuned!

## Installation

Add this line to your application's Gemfile:

    gem 'docxtor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'docxtor'

## Usage

```
package = Docxtor.generate do
  table_of_contents "Contents"
  h 1, "heading1"

  p "text1", :b => true do
    style 'p1'
    spacing :before => 80, :after => 240
    italic; u

    w "text2"
    br
    write "text3"
  end

  h 2 do
    w "heading2"
    line_break
    write "some text"
    br
    write "another text"
  end

  p "content", :style => 'p2', :i => true, :align => 'center'
end

package.save('test.docx')
```

more usage examples:

```
# Usage sample:
# elements - any collection of your elements, so in this example i have:
# class Element
#   attr_reader :title1, :title2, :content
# end
# elements = Array.new(5, Element)

# Somewhere in your controller:

def action_method
  @stream = Docxtor.generate do
    p 'Paragraph text', :align => 'center', :b => true
    table_of_contents 'Table of contents'
    page_break
    
    elements.each do |el|
      h 1, el.title do
        spacing :before => 120, :after => 120
  
        write el.title1
        write ", blahblah "
        br
        write el.title2
      end
  
      p do
        el.content.lines.map(&:chomp).each do |line|
          write line; br
        end
      end
      
    end
  end
  
  send_data(
    @stream.read,
    :filename => 'yourfilename.docx',
    :type =>'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  )
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
