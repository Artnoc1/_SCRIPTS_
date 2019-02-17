find  $GEM_HOME/gems/*  -maxdepth 0  | awk -F '/' '{print $NF}' |  sed 's#\-[^\-]*$##' | sort -u | awk '{print "gem \x27"  $1 "\x27"}' > Gemfile 
