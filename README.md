docxtor
========

[![Build Status](https://travis-ci.org/docxtor/docxtor.png?branch=master)](https://travis-ci.org/docxtor/docxtor)
[![Coverage Status](https://coveralls.io/repos/docxtor/docxtor/badge.png)](https://coveralls.io/r/docxtor/docxtor)
[![Dependency Status](https://gemnasium.com/docxtor/docxtor.png)](https://gemnasium.com/docxtor/docxtor)
[![Gem Version](http://stillmaintained.com/docxtor/docxtor.png)](http://stillmaintained.com/docxtor/docxtor)

## Summary

Ruby docx generator.
**Docxtor** is built to work with Ruby 1.8 as well as 1.9

## Features

- Paragraphs and headings markup.
- Bold, underline & italic font styles.
- Document table of contents.
- Document headers & footers, page numbers.

More to come, stay tuned!

## Installation

Add this line to your application's Gemfile:

    gem 'docxtor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'docxtor'

## Usage

Here's the taste of what **Docxtor's** "markup language" may look like.

```ruby
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

### Entry point

```ruby
Docxtor.generate do
  ...
end
```

### Paragraphs

The main building block of `docx` document is a paragraph. There're couple of ways of defining a paragraph.

```ruby
p "Hi there!", :bold => true
```

Is the same as

```ruby
p do
  w "Hi there!"
  b
end
```

or

```ruby
p do
  write "Hi there!"
  bold
end
```

Everything styling-related that is written either inside the block or in options hash will be applied to the whole parapraph.

You can mix and match different ways to define text & options.

```ruby
p "I'm a first string in this paragraph", :bold => true do
  write "I'm a second one."
  u
  w "And we all will be bold and underlined in the same time!"
end
```

### Headings

**Currently not working as expected! Will be fixed soon!**

Generally the same as paragraphs, but have additional argument - the level of heading and styled by default.

```ruby
  h 1, "Chapter 1"
  h 2, "Where our hero goes for an adventure"
```

### Table of Contents

**Currently not working as expected! Will be fixed soon!**

Inserts the ToC for a document with a caption.

```ruby
table_of_contents "Table of Contents"
```

### Footers & Headers

You can specify following properties for footers and headers:

- on which pages footer or header will appear (`:odd`, `:even` or only `:first`);
- alignment (`:center`, `:left`, `:right`)
- contents of a footer/header, including special keyword `:pagenum` which inserts page numbers

```ruby
footer :pagenum, :align => :center
header "Proudly made by me", :pages => :odd
footer "2013", :pages => :first, :align => :right
```

### Breaks

You can insert `page_break` or newline inside a paragraph with `br`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
