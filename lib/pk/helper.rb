require 'pk/ignore_file'

module Pk
  module Helper

    def init
      `mkdir -p ~/.pk/data/`
    end

    def all_members_of(team)
      pkignore = Pk::IgnoreFile.new("~/.pk/data/#{team}")
      [].tap do |list|
        `ls ~/.pk/data/#{team}`.split.each do |filename|
          list << filename unless pkignore.ignore_file?(filename)
        end
      end
    end
  end
end
