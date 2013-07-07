DSL должен поддерживать таки штучки:

1) 
----------------------
p do
  italic
  bold
  write "paragraph1"
  line_break
  write "paragraph2"
end

2) 
----------------------
p "paragraph content", :align => 'center' do
  style "styleId"
  italic
  preserve_whitespace
  write "blablah"
end

3) 
----------------------
p "some content", :style => "style1" :b => true, :i => true do
  line_break
  write "another content"
  line_break 
  write "more content"
end