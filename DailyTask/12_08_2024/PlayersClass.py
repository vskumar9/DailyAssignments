class Players:
    def __init__(self, players):
        self.players = players

    def display_players(self, start, end):
        if start < 0 or end > len(self.players) or start > end:
            print("Invalid range")
            return
        for i in range(start, end):
            print(f"Player {i + 1}: {self.players[i]}")

players_list = ['Sanjeev', 'Kumar', 'Ram', 'Pavan', 'Jai']
team = Players(players_list)
team.display_players(0, 5)
