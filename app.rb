#!/usr/bin/env ruby
require "thor"

class App < Thor
	# desc "usage" "usage explanation"
	desc "hello raw", "Prints 'Hello World' to the screen."
    def hello
        puts "Hello World"
    end

	desc "hello1 WORD", "Prints 'Hello WORD' to the screen."
    def hello1 word
        puts "Hello #{word}"
    end

    
end

App.start ARGV
