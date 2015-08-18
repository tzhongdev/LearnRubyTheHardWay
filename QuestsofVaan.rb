# QUESTS OF VAAN

# bear_fight

def bear
  prompt = "> "
  ghost = "Women: "

  puts "There is a hugh bear."
  puts "You distracted him by his lunch and now he is really angry"
  puts "----------------------------------------------------------------------------------"
  puts "<Fight bear?> \t <Flee?>"
  print prompt
  choice = $stdin.gets.chomp

  if choice.include? "fight"
    puts "BEAR FIGHT YIPIIIHHH start_module"     #start combat_module
  else
    puts "You lost your way and don't know where your are."
    puts "You see a beautiful women and ask her for the way"
    puts "#{ghost} do you like me ?"
    puts "----------------------------------------------------------------------------------"
    print prompt
    puts "<Yes you are beautiful> \t <ignore her>"
    choice2 = $stdin.gets.chomp

    if choice2.include? "beautiful"
      ghost = "Ghost: "
      puts "#{ghost} This is my real face hahaha"
      puts "<start fight>"       #start combat_module
    else
      puts "You go your way and found a small village"
      goblins_village
    end
  end
end


# goblins_village

def goblins_village
  prompt = "> "
  goblin = "The Goblin: "

  puts "You enter Goblins Village."
  puts "There is an old Goblin and you can ask him a Question."
  puts "#{goblin}\"Hey stranger what do you want to know. \""
  puts "----------------------------------------------------------------------------------"

  while true

    puts "Ask about Odins Armour \tAsk about Village"
    print prompt
    question = $stdin.gets.chomp


    if question.include? "armour"
      puts "#{goblin}So you want to know something about Odins Legendary Armour."
      puts "Hehe I will tell you something about it but you have to pay \'some amount of money\' Gold or answer a puzzle."
      puts "So what will you do?"

      puts "<Pay money> \t <Answer puzzle>"
      print prompt
      question2 = $stdin.gets.chomp

      if question2.include? "money"
        puts "You paid Goblin <amount> Gold."
        #get information
        puts "#{goblin}Heheh thank youu."
        puts """You can only find the 3 pieces of Odins armour if you defeat
            \"Surt\" in Muspelheim
            \"Hel\" in Helheim and finally
            \"Loki\" but I don't know where he is. """
        puts "And you need this here ...."
        puts "<Get map key>"
        puts "Hehe Good luck."

        # go to midgard


      elsif question2.include? "puzzle"
        # puzzle
        puts "\"What kind of room has no door or windows?\""
        print prompt
        answer = $stdin.gets.chomp

        if answer.include? "mushroom"
          puts "#{goblin}You got it huhuhu!!!!"
          #get information
          puts """You can only find the 3 pieces of Odins armour if you defeat
              \"Surt\" in Muspelheim
              \"Hel\" in Helheim and finally
              \"Loki\" but I don't know where he is. """
          puts "And you need this here ...."
          puts "<Get map key>"
          puts "Hehe Good luck."

          # go to midgard


        else
          puts "#{goblin}This is wrong huhuhu!!!!"
          puts "The whole Goblins are raiding you..."    # have no money and return to forest
          forest
        end
      else
        puts "The whole Goblins are raiding you..."    # have no money and return to forest
        forest
      end
    else
      puts "What do you mean?"              # go back to question
    end
  end
end

  # deep dark forest goal is to find goblins. 2 npcs -> bear and ghost

def forest
  puts "You are in a deep dark forest to get more information about Loki and Odins Armour."
  puts "There are 2 ways to go left and right. Which one will you take?"
  puts "----------------------------------------------------------------------------------"
  print "> "
  choice = $stdin.gets.chomp

  if choice == "left"
    goblins_village
  else
    bear
  end
end

# game over

def dead(why)
  puts why, "ΩΩΩΩΩ Game over ΩΩΩΩΩΩ"
end
# main story

def start
  puts "\t\t\t\tTHE QUESTS OF VAAN "
  puts "-------------------------------------------------------------------------------------"
  puts """Loki has kidnapped the Princess Laia. She is the only hope to prevent Ragnarök.
  He summoned Uroboros a large evil Snake to destroy the world.
  You have to stop Loki and defeat Uroboros to safe the world!!!
  But you need Odins Armour..."""
  puts "-------------------------------------------------------------------------------------"
  forest
end

start

