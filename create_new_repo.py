import sys
import os
from github import Github


def create_new_repository(type, name):
    key = os.environ.get('GITHUB_PERSONAL_ACCESS_TOKEN_PROJ') 
    # key = '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'
    user = Github(key).get_user()
    try:
        if(type == "python"):
            user.create_repo(name, gitignore_template= "Python", private=True)
        else:
            user.create_repo(name, private=True)
    except IndexError:
        if len(sys.argv) <=2:
            print(f"Expect 2 arguments got {len(sys.argv)-1}")
        
if __name__ == "__main__":
    create_new_repository(sys.argv[1], sys.argv[2])
