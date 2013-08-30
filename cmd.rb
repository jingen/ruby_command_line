#!/usr/bin/env ruby

require "thor"

class Commands < Thor
	desc "commit x", "git commit -am message"
	def c message=""
		executed_cmd = get_commit(message)
		puts %x(#{executed_cmd})
	end

	private

	def get_commit message = ""
		cmd = Array.new
		cmd << "git add ."
		cmd << "git commit -am " + "'" + message + " :" + Time.now.to_s + "'"
		cmd << "git pull"
		cmd << "git push"
		return cmd.join(" && ")
	end
end

Commands.start ARGV