from pyperclip import copy

while (True):
    inputStr = input("Input the Georgian text:")
    if inputStr == "": break
    inputArray = [*inputStr]
    toGeo = {"ა": "a", "ბ": "b", "გ": "g", "დ": "d", "ე": "e", "ვ": "v", "ზ": "z", "თ": "T", "ი": "i", "კ": "k",
             "ლ": "l", "მ": "m", "ნ": "n", "ო": "o",
             "პ": "p", "ჟ": "J", "რ": "r", "ს": "s", "ტ": "t", "უ": "u", "ფ": "f", "ქ": "q", "ღ": "R", "ყ": "y", "შ": "S",
             "ჩ": "C", "ც": "c", "ძ": "Z", "წ": "w", "ჭ": "W",
             "ხ": "x", "ჯ": "j", "ჰ": "h"}
    newArray = map(lambda x: toGeo.get(x) if (x in toGeo.keys()) else x, inputStr)
    newString = "".join(newArray)
    copy(newString + "\n")
    print(newString)
