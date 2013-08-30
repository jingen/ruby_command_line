#command format:
    - ruby cmd.rb cmdname keywork --option
    - ruby app.rb list_recipes cheese --format=oneline (or --format="oneline" or --format "oneline")
    - in app.rb: 
        + ruby app.rb list_recipes cheese --format=oneline --show-time=false
        + ruby app.rb list_recipes cheese --format=oneline --no-show-time
        + ruby app.rb list_recipes cheese --format=oneline --show-time

#definition
    - class Apps < Thor (class name is plural form)
    - desc "usage", "explanation"
    - option :option_name, type: :boolean, default: true
    - option :name, required: true
    - def cmd

#subcommand
    - in the main class
        desc "recipes", "Manage recipes"
        subcommand "recipes", Recipes  
        *app.rb recipes add
        *Recipes is a class
    

#trick
    - %w(): array separated by space
    - %Q(): double quotes
    - %q(): single quotes
    - %x(): execute shell commands


