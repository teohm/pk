require 'thor'
require 'pk/helper'
require 'thor/group'

module Pk
  class Keys < Thor::Group
    include Helper

    desc "print public keys of members in a specific team"
    argument :team, :type => :string, :desc => "Team name"
    argument :members, :optional => true, :type => :string, :desc => "Members separated by comma (,)"

    def self.banner
      "#{basename} TEAM [MEMBER1,MEMBER2,..]"
    end

    def keys
      init
      member_list = members ? members.split(',').compact : all_members_of(team)
      member_list.each do |member|
        puts `cat ~/.pk/data/#{team}/#{member}`
      end
    end

  end
end
