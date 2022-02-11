import sys
import os
from github import Github

def delete_repository(name):
    key = os.environ.get( "GITHUB_PERSONAL_ACCESS_TOKEN_PROJ" ) 
    # key = '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'
    try:
        user = Github(key).get_user()
        repo = user.get_repo(name)
        repo.delete()
    except:
        print("Remote repository doesnt exist")

if __name__ == "__main__":
    name = sys.argv[1]
    delete_repository(name[0:-1])
