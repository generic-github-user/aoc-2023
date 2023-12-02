with open('input-1.txt', 'r') as file:
    digits = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]\
            + list(map(str, range(1, 10)))
    # unfortunate
    f = lambda s, g, h: digits.index(g([d for d in digits if d in s], key=h)) % 9 + 1
    print(sum(f(s, min, s.find) * 10 + f(s, max, s.rfind) for s in file))
