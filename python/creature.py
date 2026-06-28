class monster:
      def __init__(self,name):
          self.name = name
          self.hp = 10

      def monster_appear(self):
          print("A monster appeared")
          print("A battle has started")
          print(f"The monster has {self.hp} hp")

      def monster_attack(self):
          print("The Monster dealt 1 damage to you")

      def print_monster_details(self):
          print("-----RAT------")
          print("HP:???")
          print("-------------")

      def damage_calculator(self):
          return 1
