# QUESTS OF VAAN

# inventory should be global for access same with hero stats
vaan = {'hp' => 50, 'attack' => 25}
inventory = {'potion' => 2, 'runes' => 2, 'gold' => 100}


# use item: <use potion> -> remove amount from inventory and modify hp

def use_potion(hero, stuff)
  puts "Do you wanna use a potion?"
  cancel = false
  while cancel != true
    choice = $stdin.gets.chomp
    print "> "
    if choice.include? "use potion"
      stuff['potion'] -= 1
      hero['hp'] += 10
      puts hero['hp']
    elsif choice.include? "cancel"
      puts "cancle"
    else
      puts "what do you mean?"
    end
    cancel = true
  end
end


# combat_system version 0 -> little bug: shows negative HP!


def combat(hero, enemy, stuff)
  #puts "Fight against bear"
  puts "------------------------"

  num = true
  while num == true
    puts "<attack> \t <inventory>"
    choice = $stdin.gets.chomp
    if choice.include? "a"
      if hero['hp'] <= 0
        puts "You loose. Game over"
        exit(0)
      elsif enemy['hp'] <= 0
        puts "You win!"
        puts "hero life: #{hero['hp']}"
      else
        enemy['hp'] = enemy['hp'] - rand(hero['attack'])
        puts "enemy life: #{enemy['hp']}"
        hero['hp'] = hero['hp'] - rand(enemy['attack'])
        puts "hero life: #{hero['hp']}"
        combat(hero, enemy, stuff)
      end
    elsif choice.include? "inventory"
      puts "Here is your inventory"
      puts stuff

      #puts "Do you wanna use a potion?"
      cancel = false
      use_potion(hero, stuff)
      combat(hero, enemy, stuff)
    else
      puts "whaat?"
    end
    num = false
  end
end



# get gold

def get_gold(stuff, amount)
  puts "You've got gold!"
  stuff['gold'] += amount
  puts "Your inventory: ", stuff
end

# get potions

def get_potions(stuff, amount)
  puts "You've got #{amount} potions!"
  stuff['potion'] += amount
  puts "Your inventory: ", stuff
end


=begin def inventory
  stuff = {'potion' => 2, 'rune' => 2}
  #puts "Your inventory"
  return stuff
end
=end
# third dungeon final loki, uroboros, princess

def loki(vaan, stuff)
  puts "Loki: So finally you came here to kill me."
  puts "But you are too late hahahaha."
  puts "You can't stop the mighty Uroboros."
  puts "This is Ragnarök. Hahahah"
  # start fight against Uroboros
end


# second dungeon Helheim, Garm, Hel, get Helm and harnisch !!!!! bug tresure chest only one time

def helheim(vaan, stuff)
  prompt = "> "
  puts "There is Helheim."
  puts "Kingdome of Godess Hel the daughter of Loki."
  puts "Do you want to go left or right?"
  puts "----------------------------------------------------------------------------------"
  puts "<left?> \t <right?>"

  while true
    # you should only get the tresure chest on time!
    print prompt
    choice = $stdin.gets.chomp

    if choice == "left"
      puts "You found a treasure chest. YIPIIIHHH. You found a potion and a rune."

    elsif choice == "left" && token == false
      puts "Go right!!"
    elsif choice == "right"
      puts "There is Valgrind. He is protacting the Gate to Underworld"
      puts "Valgrind: YOU SHALL NOT PASS"
      # start fight against valgrind
    else
      puts "What do you mean?"
    end
  end
end
# first dungeon Muspelheim, fight against Surt, get map_key and Gungnir

def muspelheim(vaan, stuff)
  prompt = "> "
  puts "You are in Muspelheim."
  puts "It's a realm of eternal fire."
  puts "Dou you want to go left or right?"
  puts "----------------------------------------------------------------------------------"
  puts "<left?> \t <right?>"

  while true
    print prompt
    choice = $stdin.gets.chomp
    puts choice # debug
    if choice == "left" || choice == "right"
      puts "Surt: What are you doing here human?"
      puts "Surt: Hahah you are VAAN."
      puts "Surt: Than I have to kill you. Hahaha"
      # start fight with Surt open compat
    else
      puts "You can just go left or right"
    end
  end
end

# traveling with map_key

def travel(vaan, stuff)
  prompt = "> "

  puts "Hello please enter your map_key: "
  while true
    print prompt
    map_key = $stdin.gets.chomp

    # different dungeons
    if map_key == "AAA"
      # open muspelheim
      muspelheim(vaan, stuff)
    elsif map_key == "BBB"
      # open helheim
      helheim(vaan, stuff)
    elsif map_key == "CCC"
      # open loki
      loki(vaan, stuff)
      puts "Loki test"
    else
      puts "What do you mean"
    end
  end
end


# Midgard, central place, you can enter card code to travel or buy items in shop

def midgard(vaan, stuff)
  prompt = "> "
  puts "You are in a guesthouse in Midgard. "
  puts "You can buy some useful stuff in the shop or travel via map code"
  puts "----------------------------------------------------------------------------------"
  while true

    puts "<Shop> \t <Enter map code>"
    choice = $stdin.gets.chomp
    print prompt

    if choice.include? "shop"
      # open shop module

      puts "Welcome in my shop test"

    elsif choice.include? "map"
      # open module map_key and give map_key as argument return dungeon
      travel(vaan, stuff)

    else
      puts "What do you mean?"
    end
  end
end


# bear_fight

def bear_ghost(hero, stuff)
  bear = {'hp' => 50, 'attack' => 15}

  prompt = "> "
  ghost = "Women: "

  puts "There is a hugh bear."
  puts "You distracted him by his lunch and now he is really angry"
  puts "----------------------------------------------------------------------------------"
  puts "<Fight bear?> \t <Flee?>"
  print prompt
  choice = $stdin.gets.chomp

  if choice.include? "fight"
    puts "Fight against bear"     #start combat_module
    combat(hero, bear, stuff)
    get_potions(stuff, 2)
    puts stuff
    # goblins_village
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
      goblins_village(hero, stuff)
    end
  end
end


# goblins_village

def goblins_village(hero, stuff)
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
        midgard(hero, stuff)

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
          puts "Get map key: "
          puts "Hehe Good luck."

          # go to midgard
          midgard(vaan, stuff)

        else
          puts "#{goblin}This is wrong huhuhu!!!!"
          puts "The whole Goblins are raiding you..."    # have no money and return to forest
          forest(vaan, stuff)
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

def forest(hero, stuff)
  #hero = {'hp' => 50, 'attack' => 25}
  #inventory = {'potions' => 2, 'runes' => 2, 'gold' => 100}

  puts "You are in a deep dark forest to get more information about Loki and Odins Armour."
  puts "There are 2 ways to go left and right. Which one will you take?"
  puts "----------------------------------------------------------------------------------"
  print "> "
  choice = $stdin.gets.chomp

  if choice == "left"
    goblins_village(hero, stuff)
  elsif choice == "right"
    bear_ghost(hero, stuff)
  else
    #get_potions(stuff, 2)
    #get_gold(stuff, 100)

  end
end

# game over

def dead(why)
  puts why, "ΩΩΩΩΩ Game over ΩΩΩΩΩΩ"
  exit(0)
end
# main story

def start(hero, stuff)
  puts "\t\t\t\tTHE QUESTS OF VAAN "
  puts "-------------------------------------------------------------------------------------"
  puts """Loki has kidnapped the Princess Laia. She is the only hope to prevent Ragnarök.
  He summoned Uroboros a large evil Snake to destroy the world.
  You have to stop Loki and defeat Uroboros to safe the world!!!
  But you need Odins Armour..."""
  puts "-------------------------------------------------------------------------------------"
  forest(hero, stuff)
end

start(vaan, inventory)

