#!/usr/bin/env ruby
require "thor"

RECIPES = 
[
    {
        title: "Ratatouille",
        cooking_time: "60 min",
        ingredients: %w(potatoes carrots peppers onions zucchini tomatoes)
    },
    {
        title: "Mac & Cheese",
        cooking_time: "20 min",
        ingredients: %w(macarroni cheese mustard milk)
    },
    {
        title: "Caesar Salad",
        cooking_time: "10 min",
        ingredients: %w(chicken lettuce croutons eggs)
    }
]

class Recipes < Thor
    desc "add --title --cooking_time --description", "Adds a new recipe."
    option :title, required: true
    option :cooking_time, required: true
    option :description, required: true
    def add # app.rb recipes add --title="" --cooking_time="" --description=""
        recipe ={
            title: options[:title],
            cooking_time: options[:cooking_time],
            description: options[:description]
        }

        RECIPES << recipe

        RECIPES.each do |recipe|
            puts recipe[:title]
        end
    end
end

class App < Thor

    desc "recipes", "Manage recipes"
    subcommand "recipes", Recipes # app.rb recipes add
    # desc "usage" "usage explanation"
    desc "hello raw", "Prints 'Hello World' to the screen."
    def hello
        puts "Hello World"
    end

    desc "hello1 WORD", "Prints 'Hello WORD' to the screen."
    def hello1 word
        puts "Hello #{word}"
    end

    desc "list_recipes [KEYWORD] [OPTIONS]", "List all recipes. If a keyword is given, it filters the list based off it."
    option :format
    option :show_time, type: :boolean, default: true #--show-time --no-show-time
    def list_recipes keyword=nil
        recipes = RECIPES
        recipes_to_be_listed =
            if keyword.nil? then recipes
            else recipes.select { |recipe|  recipe[:title].downcase.include? keyword.downcase}
            end
        recipes_to_be_listed.each do |recipe|
            if options[:format].nil?
                    print_default recipe
            else options[:format] == "oneline"
                    print_oneline recipe
            end
        end
    end

    private

    def print_default recipe
        puts "------------------------------"
        puts "Recipe: #{recipe[:title]}."
        puts "It takes: #{recipe[:cooking_time]} to cook."
        puts "The ingredients are: #{recipe[:ingredients].join(",")}"
    end

    def print_oneline recipe
        time = if options[:show_time] then "(#{recipe[:cooking_time]})" else "" end
            puts %Q(#{recipe[:title]} #{time})
        end
    end

    App.start ARGV
