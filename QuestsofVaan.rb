# QUESTS OF VAAN


# inventory should be global for access same with hero stats
vaan = {'hp' => 50, 'attack' => 50}
inventory = {'potion' => 2, 'runes' => 2, 'gold' => 100}



def use_item(hero, stuff)
  puts "Which item do you wanna use?"
  puts "<potion> \t <runes>"
  while true
    choice = $stdin.gets.chomp
    if choice.include? 'potion'
      use_potion(hero, stuff)
    elsif choice.include? 'rune'
      use_runes(hero, stuff)
    end
    break
  end
end



# use a rune while combat = + 50 attack damage

def use_runes(hero, stuff)
  puts "Do you wanna use a rune? (+50 Attack)"
  cancel = false
  while cancel != true
    choice = $stdin.gets.chomp
    print "> "
    if choice.include? 'use rune'
      stuff['runes'] -= 1
      hero['attack'] += 50
      puts hero['attack']
    elsif choice.include? "cancel"
      puts "cancel"
    else
      puts "what do you mean?"
    end
    cancel = true
  end
  #return true
end

# use a potion while combat

def use_potion(hero, stuff)
  puts "Do you wanna use a potion? (+10 HP) "
  cancel = false
  while cancel != true
    choice = $stdin.gets.chomp
    print "> "
    if choice.include? "use potion"
      # check if potion = 0
      if stuff['potion'] <= 0
        stuff['potion'] = 0
        puts "You have not enough potions!!"
      else
        stuff['potion'] -= 1
        hero['hp'] += 10
        puts hero['hp']
      end
    elsif choice.include? "cancel"
      puts "cancel"
    else
      puts "what do you mean?"
    end
    cancel = true
  end
end



# get_loot -> consits of get_potion, get_gold

def get_loot(stuff, potions, gold)
  get_potions(stuff, potions)
  get_gold(stuff, gold)
  return stuff
end




# raid gold and potions == 0

def raid(stuff)
  stuff['potion'] = 0
  stuff['gold'] = 0
  puts stuff
  return stuff
end


# pay money and check if you have not enough money

def pay(stuff, cost)
  if cost > stuff['gold']
    puts "You have just: \'#{stuff['gold']}\' Gold"
    return false
  else
    return true
  end
end

# Midgard shop -> able to buy potions

def Midgard_shop(stuff)
  shop = {'potion' => 99999999999}
  cost_of_potion = 20
  puts "Welcome to Midgard's shop"
  print shop
  puts stuff
  puts "What do you want to buy?"
  choice = $stdin.gets.chomp

  while true
    if choice.include? 'p'
      enough_money = pay(stuff, cost_of_potion)
      if enough_money == true
        stuff['gold'] -= cost_of_potion
        stuff ['potion'] += 1
        puts "Thank you"
        Midgard_shop(stuff)
      else
        puts "You have not enough money!"
      end
    elsif choice.include? 'cancel'
      break
    else
      Midgard_shop(stuff)
    end
    break
  end
  return stuff
end



# combat_system version 0.1 -> shows enemy and hero hp and attack damage ine each round


def combat(hero, enemy, stuff)
  puts "Fight against #{enemy}"
  puts "------------------------"
  puts "Hero: #{hero['hp']} Hp\nEnemy: #{enemy['hp']} HP"

  while true
    puts "<attack> \t <inventory>"
    choice = $stdin.gets.chomp
    if choice.include? "a"
      hero_attack = rand(hero['attack'])
      puts "- #{hero_attack}"
      enemy_attack = rand(enemy['attack'])
      puts "- #{enemy_attack}"
      enemy['hp'] -= hero_attack
      hero['hp'] -= enemy_attack
      if enemy['hp'] <= 0
        puts "You win! \n hero life: #{hero['hp']}"
      elsif hero['hp'] <= 0
        dead("You loose!")
      else
        round = 1
        puts "hero life: #{hero['hp']}"
        puts "enemy hp: #{enemy['hp']}"
        combat(hero, enemy, stuff)
      end
    elsif choice.include? "inventory"
      puts "Here is your inventory"
      puts stuff
      use_potion(hero, stuff)
     # use_item(hero, stuff)
      combat(hero, enemy, stuff)
    else
      puts "whaat?"
      combat(hero, enemy, stuff)
    end
    break
  end
end



# get gold

def get_gold(stuff, amount)
  puts "You've got #{amount} Gold!"
  stuff['gold'] += amount
  puts "Your inventory: ", stuff
end

# get potions

def get_potions(stuff, amount)
  puts "You've got #{amount} potions!"
  stuff['potion'] += amount
  puts "Your inventory: ", stuff
end


# third dungeon final loki, uroboros, princess

def loki(hero, stuff)
  uroboros = {'hp' => 500, 'attack' => 150}
  loki = {'hp' => 200, 'attack' => 100}

  puts "Loki: So finally you came here to kill me."
  puts "But you are too late hahahaha."
  puts "You can't stop the mighty Uroboros."
  puts "This is Ragnarök. Hahahah"
  # start fight against Uroboros
  combat(hero, uroboros, stuff)
  # winning text get helm
  get_loot(stuff, 10, 0)
  #
  hero['hp'] += 100
  # fight against loki
  puts "Hahah you can't beat me!"
  combat(hero, loki, stuff)
  puts "Loki survived do you want to kill him ?"
  puts "<yes> \t <no>"
  choice = $stdin.gets.chomp

  if choice.include? 'yes'
    puts "You can't kill me. I am a GOD"
    dead("You loose.")
  else
    puts "I come back human."
    win(hero, stuff)
  end
end


# second dungeon Helheim, Garm, Hel, get Helm and harnisch !!!!! bug tresure chest only one time

def helheim(hero, stuff, check)
  valgrind = {'hp' => 150, 'attack' => 80}
  hel = {'hp' => 80, 'attack' => 100}

  prompt = "> "
  puts "There is Helheim."
  puts "Kingdome of Godess Hel the daughter of Loki."
  puts "Do you want to go left or right?"
  puts "----------------------------------------------------------------------------------"
  puts "<left?> \t <right?>"

  while true
    # you should only get the treasure chest on time!
    print prompt
    choice = $stdin.gets.chomp

    if choice == "left" && check == true
      puts "You found a treasure chest. YIPIIIHHH. You found a potion and a rune."
      get_loot(stuff, 2, 100)
      check = false
      helheim(hero, stuff, check)
    elsif choice == "left" && check == false
      puts "Go right!!"
    elsif choice == "right"
      puts "There is Valgrind. He is protacting the Gate to Underworld"
      puts "Valgrind: YOU SHALL NOT PASS"
      # start fight against valgrind
      combat(hero, valgrind, stuff)
      get_loot(stuff, 10, 200)
      # winning text, than Hel
      puts "Hel: You think you can kill me?"
      combat(hero, hel, stuff)
      get_loot(stuff, 10, 500)
      puts "You've got a map key: CCC"
      puts "You've got Odins harnisch. You can feel his enourmes power!"
      hero['hp'] += 100
      midgard(hero, stuff)
    else
      puts "What do you mean?"
    end
  end
end
# first dungeon Muspelheim, fight against Surt, get map_key and Gungnir

def muspelheim(hero, stuff)
  surt = {'hp' => 85, 'attack' => 50}

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
      combat(hero, surt, stuff)
      # winning message and get Gangnir Odins Speer  -> increases attack to 50
      hero['attack'] += 50

      puts "You've got Gangnir Odins Speer. You can feel his enourmes power"
      get_loot(stuff, 10, 500)
      puts "You've got another map key: BBB"

      # back to midgard
      puts hero
      midgard(hero, stuff)

    else
      puts "You can just go left or right"
    end
  end
end

# traveling with map_key

def travel(hero, stuff)
  prompt = "> "

  puts "Hello please enter your map_key: "
  while true
    print prompt
    map_key = $stdin.gets.chomp

    # different dungeons
    if map_key == "AAA"
      # open muspelheim
      muspelheim(hero, stuff)
    elsif map_key == "BBB"
      # open helheim
      helheim(hero, stuff, true)
    elsif map_key == "CCC"
      # open loki
      loki(hero, stuff)
      puts "Loki test"
    else
      puts "What do you mean"
    end
  end
end


# Midgard, central place, you can enter card code to travel or buy items in shop

def midgard(hero, stuff)
  prompt = "> "
  puts "You are in a guesthouse in Midgard. "
  puts "You can buy some useful stuff in the shop or travel via map code"
  puts "----------------------------------------------------------------------------------"
  puts hero
  while true

    puts "<Shop> \t <Enter map code>"
    choice = $stdin.gets.chomp
    print prompt

    if choice.include? "shop"
      # open shop module
      Midgard_shop(stuff)
    elsif choice.include? "map"
      # open module map_key and give map_key as argument return dungeon
      travel(hero, stuff)
    else
      puts "What do you mean?"
    end
  end
end


# bear_fight

def bear_ghost(hero, stuff)
  bear = {'hp' => 50, 'attack' => 15}
  ghost = {'hp' => 30, 'attack' => 30}

  prompt = "> "


  puts "There is a hugh bear."
  puts "You distracted him by his lunch and now he is really angry"
  puts "----------------------------------------------------------------------------------"
  puts "<Fight bear?> \t <Flee?>"
  print prompt
  choice = $stdin.gets.chomp

  if choice.include? "fight"
    puts "Fight against bear"     #start combat_module
    combat(hero, bear, stuff)
    #loot
    get_loot(stuff, 2, 150)
    goblins_village(hero, stuff)
  else
    puts "You lost your way and don't know where your are."
    puts "You see a beautiful women and ask her for the way"
    puts "Women: do you like me ?"
    puts "----------------------------------------------------------------------------------"
    print prompt
    puts "<Yes you are beautiful> \t <ignore her>"
    choice2 = $stdin.gets.chomp

    if choice2.include? "beautiful"
      puts "Ghost: This is my real face hahaha"
      combat(hero, ghost, stuff)
      # loot
      get_loot(stuff, 3, 250)
      goblins_village(hero, stuff)
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
      puts "Hehe I will tell you something about it but you have to pay \'200\' Gold or answer a puzzle."
      puts "So what will you do?"

      puts "<Pay money> \t <Answer puzzle>"
      print prompt
      question2 = $stdin.gets.chomp

      if question2.include? "money"
        enough_money = pay(stuff, 200)
        if enough_money == true
          stuff['gold'] -= 200
          puts "You paid Goblin 200 Gold."
          puts stuff
        #get information
          puts "#{goblin}Heheh thank youu."
          puts """You can only find the 3 pieces of Odins armour if you defeat
              \"Surt\" in Muspelheim
              \"Hel\" in Helheim and finally
              \"Loki\" but I don't know where he is. """
          puts "And you need this here ...."
          puts "You've got a map key: \'AAA\'"
          puts "Hehe Good luck."

          # go to midgard
          midgard(hero, stuff)
        else
          puts "You have not enough money."
        end

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
          puts "You've got a map key: \'AAA\' "
          puts "Hehe Good luck."

          # go to midgard
          midgard(hero, stuff)

        else
          puts "#{goblin}This is wrong huhuhu!!!!"
          puts "The whole Goblins are raiding you..."    # have no money and return to forest
          raid(stuff)
          forest(hero, stuff)
        end
      else
        puts "The whole Goblins are raiding you..."    # have no money and return to forest
        raid(stuff)
        forest(hero, stuff)
      end
    elsif question.include? "village"
      puts "This is an old goblin village. heheh"
    else
      puts "What do you mean?"              # go back to question
    end
  end
end

  # deep dark forest goal is to find goblins. 2 npcs -> bear and ghost

def forest(hero, stuff)
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
    forest(hero, stuff)

  end
end


# you won the game

def win(hero, stuff)
  puts "Laia: You saved my life and the world Vaan"
  puts "Congratulation. You win!"
  puts "--------------------------------------------------------------------------------------"
  exit(0)
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

