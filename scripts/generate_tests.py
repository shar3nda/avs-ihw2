import random

for i in range(1, 101):
    text = ''.join(
        chr(c) for c in [random.randint(0, 127) for _ in range(random.randint(500, 5000))])
    with open(f'tests/{i}.in', 'w') as f:
        f.write(text)
    with open(f'tests/{i}.out', 'w') as f:
        lower, upper = sum(1 for c in text if c.islower()), sum(1 for c in text if c.isupper())
        f.write(f'Lowercase: {lower}, uppercase: {upper}')
