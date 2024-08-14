people = [
    ('Arun', 30, 160),
    ('Black', 25, 175),
    ('Carter', 30, 170),
    ('Divya', 25, 180),
]

people.sort(key=lambda x: (-x[1], x[2]))

print(people)
