# pk

Command line tool to print public keys.

## Usage

```
# install
gem install pk

# add team repo
pk team add team1 https://gist.github.com/4509339

# update repo
pk team reload
pk team reload team1

# list teams, or list team members
pk team list
pk team list team1

# print public keys
pk keys team1 member1,member2
pk keys team1
```

## Rough cut version

It's still an early prototype, usable but fragile.
