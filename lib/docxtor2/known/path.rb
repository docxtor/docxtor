module Docxtor2
  module Known
    module Path
      ROOT = File.expand_path('../../../..', __FILE__)
      TESTS = File.join(ROOT, 'spec/docxtor2')
      SUPPORT = File.join(TESTS, 'support')
      TEMPLATES = File.join(ROOT, 'templates')
      TMP = File.join(TESTS, 'tmp')
    end
  end
end
