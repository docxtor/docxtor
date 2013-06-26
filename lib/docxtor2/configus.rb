require 'configus'

# HINT: Don't forget to change current configus environment 
# before bunding/installing/publishing gem

Configus.build :default do
  env :default do
    builder_ext 'xml.builder'
    search_pattern File.join('**', '*.{xml, #{builder_ext}}')
  end
end