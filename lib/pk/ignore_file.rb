module Pk
  class IgnoreFile
    PKIGNORE_NAMES = %w(pkignore .pkignore).freeze

    def initialize(path)
      @ignore_list = PKIGNORE_NAMES.dup
      PKIGNORE_NAMES.each do |filename|
        file = File.expand_path(File.join(path, filename))
        if File.exist? file
          @ignore_list = @ignore_list + File.open(file, 'r').read.split("\n")
          break
        end
      end
    end

    def ignore_file?(filename)
      ignore = false
      @ignore_list.each do |ignore_pattern|
        if File.fnmatch(ignore_pattern, filename, File::FNM_PATHNAME)
          ignore = true
          break
        end
      end
      ignore
    end
  end
end
