```bash
#!/bin/bash


echo "Only run this if you already extracted the jdk"

JAVA_INSTALL_PATH=/opt/java/jdk1.8.0

#JRE_HOME=$JAVA_HOME/jre export JRE_HOME

sudo update-alternatives --install "/usr/bin/java" "java" $JAVA_INSTALL_PATH"/bin/java" 1000
sudo update-alternatives --install "/usr/bin/java" "javac" $JAVA_INSTALL_PATH"/bin/javac" 1000

sudo update-alternatives --set javac $JAVA_INSTALL_PATH"/bin/javac
sudo update-alternatives --set java $JAVA_INSTALL_PATH"/bin/java

printf "Add this to your .profile, .bashrc ,zshrc.... whatever\n\n\n"

printf "JAVA_HOME=$JAVA_INSTALL_PATH\n"
printf 'PATH=$PATH:$JAVA_HOME/bin\n'
printf 'export JAVA_HOME\n'
```
