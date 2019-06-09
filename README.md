# Driftrock Tech Test

## Test Instructions

Create a script that can be run from the command line and can answer the questions listed below. The script
accepts one parameter to specify which question it will answer and in some cases an optional argument. The
script will print the answer to the console output.

`ruby app.rb COMMAND PARAMETERS`
The script should implement these commands:

* `most_sold`: What is the name of the most sold item?
* `total_spend [EMAIL]`: What is the total spend of the user with this email address [EMAIL]?
* `most_loyal`: What is the email address of the most loyal user (the person with the most number of items
bought)?

## Setting up the project

- Run `git clone` this repo
- Run `cd driftrock_test` to change into this project
- Run `gem install bundler`
- Run `bundle install` to install all the gems


## Running the app

- Run `cd lib` to change into where the app.rb file is.
- Run the following commands as necessary:

| Command      | What it does        | 
| ------------- |:-------------:|
| `ruby app.rb most_sold` | returns the most sold item|
| `ruby app.rb total_spend [EMAIL]` | returns the total spend of the user associated with the supplied email|
|`ruby app.rb most_loyal` | returns the most loyal user (who bought the most amount of items)|

### To test
- Make sure you're in the root directory (if in `/lib` then run `cd ..`)
- Run `rspec` to see if tests pass

## My process

Initially, I started creating the app.rb methods. After realising that this didnt allow for adequate testing. I separated the API call into a method of its own in a separate API class. I also created a class for App. This allowed for robust unit tests and separation of concerns. I tried to make sure all variables were labelled well enough for another developer to understand what's going on without the need for comments. I extracted mock data I used repeatedly into its own file as a constant. I also used ARGV to be able to allow the app to run from the command line.

### Possible Improvements

I'd have liked to account for some edge cases. For example, `most_sold` only returns the first most sold item due to the way the method is implemented. Although this is enough to satisfy the test requirements, what I could've done was assign the most sold items to an array and then printed the output of the array with the most sold items. 
