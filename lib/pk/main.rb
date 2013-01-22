require 'thor'
require 'pk/helper'
require 'pk/team'
require 'pk/keys'

module Pk
  class Main < Thor
    include Helper

    desc "keys TEAM [MEMBER1,MEMBER2,..]", "print public keys of members in a specific team"
    def keys(team, members=nil)
      Pk::Keys.start( [team, members] )
    end

    desc "team", "manage teams"
    subcommand "team", Team
  end
end
