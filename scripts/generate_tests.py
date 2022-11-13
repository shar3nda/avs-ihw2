import random

for i in range(1, 101):
    text = ''.join(chr(c) for c in [random.randint(0, 127) for _ in range(100)])
    with open(f'in_{i}.txt', 'w') as f:
        f.write(text)
    with open(f'out_{i}.txt', 'w') as f:
        
        f.write(f'Lowercase: , uppercase: ')
