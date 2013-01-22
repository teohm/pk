require 'thor'
require 'pk/helper'

module Pk
  class Team < Thor
    include Helper

    desc "add NAME, GIT_URL", "add team repo via git clone"
    def add(name, git_url)
      init
      `git clone #{git_url} ~/.pk/data/#{name}`
    end

    desc "reload [TEAM]", "reload a team repo, or all teams if not specified"
    def reload(team=nil)
      init
      teams = Dir["#{ENV["HOME"]}/.pk/data/*/"].map{|f| File.basename(f) }
      teams = teams.select{|t| t == team} if team
      teams.each do |t|
        `cd ~/.pk/data/#{t} && git pull && cd -`
      end
    end

    desc "list [TEAM]", "list all team, or team members if team is specified"
    def list(team=nil)
      init
      if team
        all_members_of(team).each do |m|
          puts m
        end
      else
        `ls ~/.pk/data`.split.each do |t|
          puts t
        end
      end
    end

  end
end
