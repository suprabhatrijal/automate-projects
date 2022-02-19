import sys
import os
from github import Github


def create_new_repository(type, name):
    key = os.environ.get('GITHUB_PERSONAL_ACCESS_TOKEN_PROJ') 
    user = Github(key).get_user()
    if(type == "python"):
        user.create_repo(name, gitignore_template= "Python", private=True)
    else:
        user.create_repo(name, private=True)


if __name__ == "__main__":
    try:
        create_new_repository(sys.argv[1], sys.argv[2])
    except IndexError:
        if len(sys.argv) <=2:
            print(f"Expect 2 arguments got {len(sys.argv)-1}")
     
