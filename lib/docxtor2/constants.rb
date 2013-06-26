module Docxtor2
  module Tests
    ROOT_PATH = File.expand_path('../../../spec/docxtor2', __FILE__)

    SUPPORT_DIR = 'support'
    SUPPORT_PATH = File.join(ROOT_PATH, SUPPORT_DIR)

    TMP_DIR = 'tmp'
    TMP_PATH = File.join(ROOT_PATH, TMP_DIR)
    TMP_PERMISSIONS = 0700

    DOCX_FILENAME = 'test.docx'
    DOCX_PATH = File.join(TMP_PATH, DOCX_FILENAME)

    module Templates
      DIR = 'templates'
      PATH = File.join(SUPPORT_PATH, DIR)

      MINIMAL_PATH = File.join(PATH, 'minimal')
      DEFAULT_PATH = File.join(PATH, 'default')
    end
  end

  module Namespaces
    
  end
end