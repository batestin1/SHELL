#coding: utf-8



                    #********************************************************************************#
                    #                                                                                #
                    #                                  нεℓℓσ,вαтεs!                                  #
                    #                                                                                #
                    #   filename: create_user.py                                                     #
                    #   created: 2022-03-03 00:00                                                    #
                    #                                       by: Bates <https://github.com/batestin1> #
                    #********************************************************************************#
import random
import sys

nom = sys.argv[1:]

def create_user(nom):
    with open("users.txt", "a+", encoding='UTF-8') as output:
        global list    
        sep = ''
        fullName = sep.join(nom)
        list = list(fullName)
        sort = random.sample(list, len(list))
        user_1 = sep.join(sort[:4])
        user_2 = sep.join(list[:3])
        user_final = user_2+user_1
        user_final = user_final.lower()
        output.write(f"""{user_final}:{random.randint(111,999)}:{random.randint(1111,9999)}:{random.randint(111,999)}:{user_final.capitalize()},Brasil,{random.randint(111,999)}-{random.randint(111,999)}:/home/{user_final}:/bin/bash\n""")

if __name__ == "__main__":
    create_user(nom)