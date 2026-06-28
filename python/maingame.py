import character
import creature

your_character = character.character("Test", 10,10)
your_character.print_details()

easy_monster = creature.monster("Rat")
easy_monster.monster_appear()
easy_monster.print_monster_details()
easy_monster.monster_attack()

your_character.take_damage(easy_monster.damage_calculator())
userinput = input("Do you attack back at the monster? ")
if userinput.lower() == "yes":
     print(f"You have attacked the enemy, Dealing {your_character.calculate_your_attack()} to the monster") 
