Dans Serveur :

javac *java
java DaemonImpl 4000 Lucifer
java DaemonImpl 4001 Satan

Dans Client :

javac *java
java RE //localhost:4000/Lucifer "rm -rf *"
java RE //localhost:4001/Satan "cd .."
