import sys
import os
from github import Github

def delete_repository(name):
    key = os.environ.get( "GITHUB_PERSONAL_ACCESS_TOKEN_PROJ" ) 
    # key = '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'
    try:
        repo = Github(key).get_repo(name)
        repo.delete()
    except:
        print("Remote repository doesnt exist")

if __name__ == "__main__":
    name = f"suprabhatrijal/{sys.argv[1]}"
    delete_repository(name[0:-1])
