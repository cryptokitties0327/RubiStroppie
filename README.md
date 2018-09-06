# RubiStroopie Game
----
RubiStroopie Game is a quick simple terminal game build using Ruby4.2.1. This game is adapted from a widely recognized phenomenon in psychology, called the Stroop Effect. 

The Stroop Test assesses your mind's processing speed when there's interference by measuring your reaction time. This adaptation of the Stroop game has a focus on tracking the effects of meditation on stress, allowing players to track their progress before and after meditation sessions.

## Contents
- [Game Mechanism](#rubistroopie-game-mechanism)
- [The Psychology Behind](#the-psychology-behind)
- [Trello Board](#trello-board)
- [Ruby Gems](#ruby-gems)
- [Code Structure](#code-structure)
- [Challenges](#challenges)
- [Game Development Considerations](#game-development-considerations)
- [References](#references)

---

## RubiStroopie Game Mechanism
This game uses words in colored fonts as shown below. The goal of the game is to correctly say out loud the font color of each card, but not read the word. 

There are 2 rounds, each with a set of 15 words. 

**Round 1**
Baseline round that tests players reaction time without interference (i.e. font color matches the word)
![Baseline Card](docs/same_color_card.png) 💬 Say: *"BLUE"*

**Round 2**
Stroop round that tests players reaction time with interference (i.e. font color does not match the word)
![Stroop Card](docs/diff_color_card.png) 💬 Say: *"GREEN"*

Both rounds are timed in seconds, and data is recorded for tracking and comparison. 

To move from one card to another, the player uses the [Enter] key on their keyboard. To exit and end the game early players use the [x]+[Enter] keys oto close to the program.
![Keyboard Controls](docs/keyboard_control.jpg)

We encourage players to use this test before and after meditation and over a period of time to track their stress levels and effectiveness of meditation. 

![Meditation](docs/meditate_vector.jpg)

---
## The Psychology Behind 
The Stroop effect is one of the best-known phenomena in cognitive science. It occurs when you must say the font color of a word, but ignoring and avoid reading the actual word. It usually takes longer when the word and its font color are conflicting.

This test assesses the delayed reaction times when the color of the word doesn't match the name of the word. It's easier to say the color of a word when it matches its semantic meaning of the word, but when they are conflicting it takes longer. 

This demonstrates the effect of interference on our reaction time, which is highly applicable in our everyday environment. There are three theories that explain this phenomenon:
- **Selective Attention Theory**: says that the process of naming font color requires more attention than reading the word
- **Speed Processing Theory**: assumes our brain read words faster than name font color
- **Automaticity**: considers reading as an automatic process that's unintentional, uncontrolled, unconscious and fast. People can't choose to "turn-off" this process, whereas font color naming is a less automated process, so more attentional resource is needed which slows down our reaction time.

The Stroop effect is named after *John Ridley Stroop*(1929), who first recognised the association of our cognitive processing affected by interference by looking at our reaction time.

---
## Trello Board

![Trello Screenshot](docs/trello_scrnsht_05sep.png)

Trello was used from early state conceptualization through to the finalized product. It was an easy and effective project management tool we used to manage and prioritized our tasks.

---
## Ruby Gems
#### Implemented Gems
1. tty-prompt
2. colorize
3. whirly
4. Pry
 
#### 1. TTY-prompt
A beautiful and powerful interactive command line prompt with a robust API for getting and validating complex inputs.

Prompt makes our code easier to maintain.  There are no if/else statements and no artificial numbering. Clean and simple. If we want to add a line or change the order of our menu we would only need to shuffle around few words on the same line of code. This gem is intuitive, interactive and user-friendly.
![Gem tty_prompt in application](docs/gem_ttyprompt.gif)
 
#### 2. Colorize
Colorize extends String class or add a ColorizedString with methods to set text color, background color and text effects.

We want to display some of the output in our app in colored format and colorized gem serves our needs. The gem allows us to set text color, background color and, text effects on ruby console and command line output.
![Gem colorize in application](docs/gem_colorize.gif)
 
#### 3. Whirly
Simple terminal spinner with support for custom spinners. Includes spinners from cli-spinners. 
![Gem whirly in application](docs/gem_whirly.gif)

#### 4. Pry
Pry is a powerful debugging tool written from scratch to provide a number of advanced features, some of these include:

- Documentation browsing
- Live help system
- Syntax highlighting
- A powerful and flexible command system
- Ability to view and replay history
  
Pry can be invoked in the middle of a running program. It opens a Pry session at the point it's called and makes all program state at that point available. When the session ends the program continues with any modifications we made to it.

We have used pry for debugging and checking classes. (see below video)
![Alt Text](https://j.gifs.com/VPB7KM.gif)

---
# Code Structure
## Module

We have used modules in our codes which contains a collection of methods and constants to use repeatedly throughout our main body of code. This optimizes our final product by minimizing the need for duplicates whilst enhancing functionality and reusability. We tried to keep the final code dry, having written multiple functions instead of repetitive blocks of code throughout our program. This cuts down on our program size and improves the readability of our source code.

```Ruby
module Animate
def self.countdown
Whirly.configure spinner: "dots"
        Whirly.start do
            Whirly.status = "Hope you had some fun! "
            sleep 2
            Whirly.status = "Meditate before trying again and see if there's a difference."
            sleep 2
            Whirly.status = "SEE YOU SOON!"
            sleep 1
        end
    end
end
```   

## Methods
We have defined multiple methods so we can reduce debugging time and improve the readability. For instance, below is an excellent example that illustrates how using a Module method saved our code from looking heavy and repetitive.

##### BEFORE: Heavy and Repetitive
```ruby

    def self.green
        puts "xxxxxxxxxxxxxxx".colorize(:color => :white, :background => :white)
        puts "     GREEN     ".colorize(:color => :light_green, :background => :white)
        puts "xxxxxxxxxxxxxxx".colorize(:color => :white, :background => :white) 
    end
    
    def self.black
        puts "xxxxxxxxxxxxxxx".colorize(:color => :white, :background => :white)
        puts "     BLACK     ".colorize(:color => :black, :background => :white)
        puts "xxxxxxxxxxxxxxx".colorize(:color => :white, :background => :white) 
    end

```

##### AFTER: DRY and Optimized
```Ruby
    def self.color_cards(cards)
        # puts
        pattern = "x" * 15
        pattern_theme = {color: :white, background: :white}

        cards = cards.map do |card|
          
            theme = { 
                color: card[:text_color], 
                background: :white 
            }
            
            [
                pattern.colorize(pattern_theme),
                card[:text].colorize(theme),
                pattern.colorize(pattern_theme),
                "\n"
            ]
        end
    end
```

---
## Challenges
#### Time Constraint
We had 2 days to finish the whole project. We strictly adhered to our timeline and successfully finished all the major components we wanted to include in our finalized product. Sticking to the schedule wasn’t just a matter of making sure everything was completed by the project deadline date, but it also required reaching multiple milestones and critical project management to meet our scheduled production timeline, ensuring that there were no delays. 

#### Building Modules 
One of the most challenging parts in the process was building multiple modules with our limited experience in developing. We spent a lot of time learning the module fundamental as we are aware of the importance of keeping our codes DRY (Don't Repeat Yourself). Building modules are crucial as it reduces duplicate codes and saves us a lot of maintenance time in the future.

#### Testing (Pry & Put)
- Test 1: 
  
  We used pry to debug and check datatypes to ensure we were inputting and collecting the intended data (see below video).
![Alt Text](https://j.gifs.com/VPB7KM.gif)

- Test 2: 
  - We also tested our codes by using `puts` kernel method to ensure no errors were detected.
```Ruby
puts "Please enter your age: " 
age = gets.strip
while true
    if age.to_i.to_s == age && age.to_i > 3 && age.to_i <= 120
        break
    else
        print "Oops.. Invalid response, #{name} please enter a number for your age: "
        age = gets.strip
    end
end
```
- Test 3:
  - We tested our codes by using `puts` kernel method to ensure no errors were detected.
```Ruby
print "Did you meditate in the last hour [yes/no]?"
meditate = gets.strip.downcase
while meditate != "yes" && meditate != "no"
    puts "Oops.. Invalid response, #{name} please share did you meditate in the last hour [yes/no]? "
    meditate = gets.strip.downcase
end

if meditate == "yes" || meditate == "no"
    puts "Excellent! #{name}, let's start the RubiStroopie Game"
    puts
end
```

---
## Game Development Considerations

#### Application Planning
- **Player Data Recorded** - a wide range of data was recorded for flexible tracking purposes (name, age, gender, stress level, meditative state, test date, baseline test start time, baseline test time duration, stroop test start time, stroop test time duration). There are some data which we placed extra care for better UX experience, and to allow our users to track and extract their stored data flexibly. 
    - **Age** - data entry has been constrained to integers only, and between the ages of 3 to 120. After some research, the average child starts to be more proficient in reading from the age of 5-6, but some prodigy cases show they may begin reading at the age of 3. The ceiling age was set by finding the oldest living person recorded and rounding their age to the nearest tens (i.e. 120years old).
    - **Gender** - we wanted to ensure that this data is all encampassing in terms of diversity. After thorough research, we have used a socially aware list for players to select from. After testing out a few different methods of data entry, we decided on using a fixed multiple-choice list to control valid data entry.
    - **Stress Level** - we want to allow users to easily rate their perceived state of stress. To ensure a quick and measure we kept the scale within a 6-points scale (from 0 to 5). With research, we've found that market research which used questionnaires that started from '0' point were more accurately scored than questionnaires that started at '1'. This reduces users potential misunderstanding on which end of the scale represents the highest positive score.
    -  **Meditative State** - We wanted to control the level of effectiveness that's found post-meditation within an hour of any meditation session. This aligns players results to gather reliable data for longitudinal tracking.
    -  **Date** - We wanted to gather date to enable players to track their progress over time
    -  **Start times** - This data could be further processed if the player is interested in measuring their cognitive selective attention comparing between morning, afternoon, or evening periods by grouping the time. However, this it preliminary data gather which can be repurposed for selective data tracking.
- **Keyboard Controls**
    - When designing gameplay interface, we explored other versions of Stroop Effect tests. There were versions that required players to press 4 keys (each corresponding to the first letter of the answer e.g. [r] for RED, and [b] for BLUE) which checks the correctness of their answers. However, after further reading and consideration, this method adds another layer of varying degree of interferences to their processing speed. Another method we considered was for players to have to type out the word accurately, but this again may test a player's typing speed capabilities rather than the Stroop Test's true purpose focused on processing time. Hence, we decided on using a single key for players to minimize confounding factors.
- **Exit Strategy**
    - We wanted to allow players to exit the game during the Stroop game, and including a key which enables them to.
- **Meditation**
    - Encourages players to track their progress through and cognitive processing time when under different states of stress and meditative states. At the end, we recommend players to keep tracking their progress when tested before or after meditation. This can become a simple and easy tool for anyone to check and the effectiveness of various meditation techniques. 
  
#### The Future of RubiStroopie
There are many versions of the Stroop effect that can be adapted. It would be great if more languages could be included, and more variations of the Stroop Effect can be included by adding a menu page at the beginning for players to choose. The primary potential of our RubiStroopie version is its capability of storing, tracking, and exporting specific player data and performance times. This information can become valuable insights and in the future the application may incorporate features of generating useful and meaningful tables which tracks their performance against their stress level and meditation practice. 

#### Wider Community Impact Considerations
- Potential harmful/ offensive/ immoral outcomes:
    - This game uses very friendly and uses clean child-friendly language which should not cause any offensive outcomes. 
- Potential legal/ ethical issues:
    - This test has been widely adapted into many variations such as using emotional words, to musical versions. There are no copyright issues in modelling a Terminal game from this widely used cognitive psychology test which models a 1929 experiment. There are no patents with using Stroop Test. The name RubiStroopie is not a registered business name so, and there are no legal issues in using such a name. We also only recommend players to use this terminal game to track whether their perceived stress level, meditative state, and mainly for some fun. This game should not pose any legal or ethical issues.
- Potential cultural/ safety concerns:
    - For this game to be used more widely across cultures, in the future the game could create more versions across languages. The Stroop test's effects have been replicated in the past to also work effectively in other cultures, however, in the current version of RubiStroopie we only have an English version at the moment.
- WCAG 2.0 "AAA" Standards:
- 
  ![WCAG Table](docs/WCAG.png)

---
## References
#### Project Research 

1. Ayala Malach Pines, Miri Lerner, Dafna Schwartz, (2010) "Gender differences in entrepreneurship: Equality, diversity and inclusion in times of global crisis", Equality, Diversity and Inclusion: An International Journal, Vol. 29 Issue: 2, pp.186-198,
2. Bauer, G. R., Braimoh, J., Scheim, A. I., & Dharma, C. (2017). Transgender-inclusive measures of sex/gender for population surveys: Mixed-methods evaluation and recommendations. PLoS ONE, 12(5), e0178043. http://doi.org/10.1371/journal.pone.0178043
3. Cattell, J.M.: The time it takes to see and name objects. Mind 11, 63–65 (1886)
4. Das, J. P. (1970). Changes in Stroop-test responses as a function of mental age. British Journal of Social and Clinical Psychology, 9, 68- 73
5. Dyer, F.N.: The Stroop phenomenon and its use in the study of perceptual, cognitive, and response processes. Mem. Cogn. 1, 106–120 (1973)
6. Guttentag, R., & Haith, M. (1978). Automatic Processing as a Function of Age and Reading Ability. Child Development, 49(3), 707-716. doi: 10.1111/j.1467-8624.1978.tb02372.
7. Inclusive Language Guide | Victorian Government. (2018). Retrieved from https://www.vic.gov.au/equality/inclusive-language-guide.html
8. Klein, G.S.: Semantic power measured through the interference of words with color-naming. Am. J. Psychol. 77, 576–588 (1964)
9. MacLeod, C.M.: Half a century of research on the Stroop effect: an integrative review. Psychol. Bull. 109, 163–203 (1991)
10. MacLeod, C. M. (1992). The Stroop task: The "gold standard" of attentional measures. Journal of Experimental Psychology: General, 121(1), 12-14.
11. MacLeod, C.M., MacDonald, P.A.: Inter-dimensional interference in the Stroop effect: uncovering the cognitive and neural anatomy of attention. Trends Cogn. Sci. 4, 383–391 (2000)
12. Moors, A., De Houwer, J.: Automaticity: a theoretical and conceptual analysis. Psychol. Bull. 132, 297–326 (2006)
13. Nishii, L. H. 2010. The benefits of climate for inclusion for diverse groups. Unpublished paper, Cornell University, Ithaca, NY
14. Rosinski, R.R., Golinkoff, R.M., Kukish, K.S.: Automatic semantic processing in a picture-word interference task. Child Dev. 46, 247–253 (1975)
15. Stroop, J.R.: Studies of interference in serial verbal reactions. J. Exp. Psychol. 18, 643–662 (1935)
16. How to Meet WCAG 2 (Quickref Reference). (2018). Retrieved from https://www.w3.org/WAI/WCAG21/quickref/?versions=2.0

#### Gem Links
- https://rubygems.org/search?utf8=%E2%9C%93&query=tty-prompt
- https://rubygems.org/gems/colorize
- https://rubygems.org/gems/whirly
- https://rubygems.org/gems/pry
