#!/usr/bin/env ruby

require "thor"

class Commands < Thor
    desc "commit x", "git commit -am message"
    def commit message=""
        puts "hello"
    end
end

Commands.start ARGV
