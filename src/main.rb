# Gems required
require 'tty-prompt'
require 'colorize'
require 'csv'
require 'awesome_print'

# Modules required
require_relative('game')

# Welcome message (explain game briefly - extended references )
puts """

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Welcome to the RubiStroopie Game
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

This is a simple game that tests your reaction time under interference! 

The Stroop Effect test is one of the best known phenomena in cognitive psychology named after John Ridley Stroop who first demonstrated the effect that interference can have in relation to reaction time.  This test is still widely used today to explore key aspects of attention, learning, memory, reading, language, cognitive skills, and neural mechanisms. 

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"""
# Request player's info (name, age, gender, stress level, meditative state)

# Request player's name - no checks because names should remain flexible (players may use numbers in nicknames)
print "Please enter your name: "
name = gets.strip.capitalize


# Request player's age - check to make sure response is an integer, and relatively realistic age range (including early prodigy readers from 3 years old, to the age rounded to the nearest 10s of the oldest person alive recorded)
print "Please enter your age: " 
age = gets.strip
while true
    if age.to_i.to_s == age && age.to_i > 3 && age.to_i <= 120
        break
    else
        print "Oops.. Invalid response, #{name} please enter a number for your age: "
        age = gets.strip
    end
end


# Request player's gender - multiple choice fixed options (gender diversity inclusion taken into consideration)
prompt = TTY::Prompt.new
gender = prompt.select("Please select your gender:", %w(Female Male Trans Bigender Non-binary Other))


# Request player's stress level - multiple choice fixed options (0..5)
prompt = TTY::Prompt.new
stress = prompt.select("Rate your current level of stress on a 5-point scale (0 = very relaxed; to 5 = debilitating stress):", %w(0 1 2 3 4 5))

# Request player's stress level 2 - check to make sure response is an integer(0..5)
# print "Please rate your current level of stress on a 5-point scale (0 = very relaxed; to 5 = debilitating stress): " 
# stress = gets.strip
# while true
#     if stress.to_i.to_s == stress && stress.to_i <= 5 && stress.to_i >= 0
#         break
#     else
#         print "Oops.. Invalid response, #{name} please enter a number to express stress level between 0 to 5: "
#         stress = gets.strip
#     end
# end



# Request player's meditation status - check for valid yes/no response
print "Did you meditate in the last hour [yes/no]?"
meditate = gets.strip.downcase
while meditate != "yes" && meditate != "no"
    puts "Oops.. Invalid response, #{name} please share did you meditate in the last hour [yes/no]? "
    meditate = gets.strip.downcase
end

if meditate == "yes" || meditate == "no"
    puts
    puts "Excellent! #{name}, let's start the RubiStroopie Game"
    puts
end


# Stores player info into database
players = [
    ["#{name}", "#{age}", "#{gender}", "#{stress}", "#{meditate}"]
]
p players

# headers = ["NAME", "AGE", "GENDER", "STRESS", "MEDITATE"]

# CSV.open("players_data.csv", "w") do |file|
#     file << headers
#     player.each do |player|
#         file << player
#     end
# end




sleep(2) # To space out the next snippet on game instructions
# Game instructions message (how to play, brief experiement explanation, controls to next colored card)
puts """

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  HOW THE GAME WORKS
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

A word will be displayed one at a time, name the font colour of the word (instead of reading the actual word). When you've correctly named the font colour, then use the listed control keys below to go to the next word. There will be 15 words each round, and your performance will be timed. 

"""  
# Use colorize to show examples - method 1 (depending if we can keep the white background box when randomizing output during gameplay)
puts "Here are some examples:"
puts "xxxxxxxxxxxxxx".colorize(:color => :black, :background => :black)
puts "     BLUE     ".colorize(:color => :red, :background => :black)
print "xxxxxxxxxxxxxx".colorize(:color => :black, :background => :black) 
puts " You would say: Red"
puts
puts "xxxxxxxxxxxxxx".colorize(:color => :white, :background => :white)
puts "     PINK     ".colorize(:color => :light_magenta, :background => :white)
print "xxxxxxxxxxxxxx".colorize(:color => :white, :background => :white) 
puts " You would say: Pink"
puts

# Use colorize to show examples - method 2 (simple and still clear method, but less pretty and doesn't account for various players might have different terminal background colors set)
puts "For example: " + "BLUE ".colorize(:red) + "- You would say: Red"
puts "For example: " + "PINK ".colorize(:light_magenta) + "- You would say: Pink" 
puts "For example: " + "YELLOW ".colorize(:light_yellow) + "- You would say: Yellow" 
puts "For example: " + "GREEN ".colorize(:red) + "- You would say: Red" 


puts """

There will be 2 rounds, first round will measure your baseline performance. The second round will allow you to test and see how stroop effect affects your reaction time when there's interference. 

Happy RubiStrooping!

Keyboard control keys:
[s] - to start the game 
[.] - to move onto the next word card
[x] - to exit the game early

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"""
# Player game info stored (time start, time end, time duartion, game version: baseline/stroop effect)

puts "ROUND 1"
p date = Time.now.strftime("Date: %F")
start_time_baseline = Time.now

sleep(3) #to test whether elapsed timer works

# first_game_array = ["red", "yellow", "green", "blue", "purple"]
# second_game_array = ["dragon", "yellow", "green", "blue", "purple"]

array = [ColorCardsBaseline.red_green, ColorCardsBaseline.blue_blue, ColorCardsBaseline.red_black]

# Stroop.game_method(third_array)
# p third_array

def game_method(array)
        count = 0
        while true && count <15 
            print array.sample
            choice = gets.chomp
            count +=1 
            if choice == "x"
                print "Sorry to see you go!"
                break
            end 
        end
end






# Play baseline game first
# Timer start recorded
# Each word displayed with its actual color

# Prevent edge case using if statement to check correct control key is used when switching to next colored word


# 15 rounds of colored words 


# Time end recorded and elapsed time calculated
end_time_baseline = Time.now
elapsed_baseline = start_time_baseline - end_time_baseline

# Display user results
# Record user results
p "In Round 1, you took #{elapsed_baseline} seconds" 


# Play stroop effect game second
puts "ROUND 2"
p date = Time.now.strftime("Date: %F")
start_time_stroop = Time.now

sleep(2) 
# Timer start recorded
# Each word displayed with its conflicting color

# Prevent edge case using if statement to check correct control key is used when switching to next colored word


# 15 rounds of conflicting colored words 


# Time end recorded
# Display user results
end_time_stroop = Time.now
elapsed_stroop = start_time_stroop - end_time_stroop
p "In Round 2, you took #{elapsed_stroop} seconds"

elapsed_difference = elapsed_stroop = elapsed_baseline
p "This is #{elapsed_difference} seconds slower than when there were no cognitive inteferences." 


# Save player results explored into CSV spreadsheet


# Product CSV spreadsheet graphs to track results


# Thanking players to participate message




