git init

git add .

git commit -m "gitify initial commit"

RepoName=$(echo $(pwd) | awk -F/  '{print FS $NF}' | { read temp; echo "${temp:1}"; })

PersonalGithubToken="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"

curl -u arielferdman:"$PersonalGithubToken" https://api.github.com/user

curl -X POST -u arielferdman:"$PersonalGithubToken" --data "{\"name\":\"$RepoName\", \"private\":\"true\"}" https://api.github.com/user/repos

git remote add origin git@github.com:/arielferdman/"$RepoName"

git push --set-upstream origin master

