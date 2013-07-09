docxtor2
========

[![Build Status](https://travis-ci.org/vyorkin/docxtor2.png?branch=master)](https://travis-ci.org/vyorkin/docxtor2)
[![Coverage Status](https://coveralls.io/repos/vyorkin/docxtor2/badge.png)](https://coveralls.io/r/vyorkin/docxtor2)
[![Dependency Status](https://gemnasium.com/vyorkin/docxtor2.png)](https://gemnasium.com/vyorkin/docxtor2)
[![Gem Version](http://stillmaintained.com/vyorkin/docxtor2.png)](http://stillmaintained.com/vyorkin/docxtor2)

## Summary

Ruby docx generator

## Installation

Add this line to your application's Gemfile:

    gem 'docxtor2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'docxtor2'

## Usage

1)

stream = Docxtor2.generate do
  table_of_contents "Contents"
  h 1, "heading1"

  p "text1", :b => true do
    italic
    u

    w "paragraph1"
    br
    write "paragraph2"
  end

  h 2 do
    w "heading2"
    line_break
    write "some text"
    br
    write "another text"
  end

  p "text2", :i => true, :align => 'center'
end

file = File.new('test.docx', 'w')
file.write(stream.string)
file.close

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

run tests:

    turn -Itest test/lib

