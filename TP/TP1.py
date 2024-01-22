

ALPHABET = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

def trykey(key, c):
    message = ""
    for char in c:
        if char in ALPHABET:
            message += ALPHABET[(ALPHABET.index(char) + key) % 26]
        else:
            message += char
    return message
  
def try_all_keys(c):
    c = c.lower()
    for key in range(26):
        print(key, trykey(key, c))
        

cryptedmessage = input("Entrez le message crypté : ")

try_all_keys(cryptedmessage)