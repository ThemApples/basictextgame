class character:
      def __init__(self,name,attack:int,defense:int):
          self.name = name
          self.attack = attack
          self.defense = defense 
          self.hp = 10
          self.status = "normal"
          self.passive = False


      def print_details(self):
          print(f"--------{self.name}--------")
          print("Attack:", self.attack)
          print("Defense:", self.defense)
          print("HP:", self.hp)
          print("status:", self.status)
          if self.passive == True:
             print("Poison resistance lv1")
          print("---------------------")

      def take_damage(self,damage:int):
          self.hp = self.hp-damage
          self.print_details()

      def calculate_your_attack(self):
          return self.attack
