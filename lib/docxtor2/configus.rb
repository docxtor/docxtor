# HINT: Don't forget to change current configus environment 
# before bunding/installing/publishing gem

Configus.build :test do
  env :default do
    builder_ext 'xml.builder'
    templates do
      search_pattern File.join('**', '*.{xml, #{builder_ext}}')
    end
  end

  env :test, :parent => :default do
    root_path File.expand_path('../..', __FILE__)
    support do
      dir 'support'
      path File.join(root_path, dir)
    end

    tmp do
      dir 'tmp'
      path File.join(root_path, dir)
      permissions 0700
    end

    docx do
      filename 'test.docx'
      path File.join(tmp.path, filename)
    end

    templates do
      dir 'templates'
      path File.join(support.path, dir)

      minimal do
        dir 'minimal'
        path File.join(path, dir)  
      end

      default do
        dir 'default'
        path File.join(path, dir)
      end
    end
  end
end