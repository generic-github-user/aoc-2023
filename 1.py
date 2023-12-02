with open('input-1.txt', 'r') as f:
    print(sum(int((t := ''.join(filter(str.isdigit, s)))[0]+t[-1]) for s in f))
