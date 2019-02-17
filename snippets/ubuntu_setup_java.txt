
export JAVA_HOME=/usr/local/jdk1.7.0_60
export PATH=$PATH:$JAVA_HOME/bin


sudo update-alternatives o9--install "/usr/bin/java" "java" "/usr/local/java/jdk1.7.0/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.7.0/bin/javac" 1

sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.7.0/bin/javaws" 1



sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.7.0/bin/java" 2000

