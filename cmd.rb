#!/usr/bin/env ruby

require "thor"

class Commands < Thor
	desc "commit message", "c c message"
        option :all, aliases: "-a"
	def c message="fix"
		executed_cmd = get_commit(message) 
		puts %x(#{executed_cmd})
	end

	desc "initalize repository", "c i origin_repository"
	option :exist, aliases: "-e"
	def i repo
		if options[:exist].nil?
			executed_cmd = get_init(repo)
		else
			executed_cmd = get_init(repo, "exist")
		end
		puts %x(#{executed_cmd})
	end

	desc "clone repository", "c clone repository"
	def clone repo
		executed_cmd = "git clone #{repo}"
		puts %x(#{executed_cmd})
	end
	
	private

	def get_commit message 
		cmd = Array.new
		cmd << "git add ." unless options[:all].nil?
		time = Time.now
		cmd << "git commit -am '#{message} : #{time.to_s} #{time.strftime('%A')}'"
		cmd << "git pull"
		cmd << "git push"
		return cmd.join(" && ")
	end

	def get_init (repo,  exist=nil)
		cmd = Array.new
		if exist.nil?
			cmd << "touch README.md"
			cmd << "git init"
			cmd << "git add README.md"
			cmd << "git commit -m 'first commit'"
		end
		cmd << "git remote add origin #{repo}"
		cmd << "git push -u origin master"
		return cmd.join(" && ")
	end
end

Commands.start ARGV
