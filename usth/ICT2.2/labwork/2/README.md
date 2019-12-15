# Build with Maven

Following the official guide [Maven in 5 Minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html):

1. Create a project named `my-app`:

        mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false

2. Change into the project directory: `cd my-app`
3. Build the project: `mvn package`

Extra exercises for labwork 1 are written in `src/main/java/com/mycompany/app/`
inside `my-app`.  To launch a class named `App` for example, run

    java -cp my-app/target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App

I find this build method to be overcomplicated for 5-minute throw-away programs
and decide not to use it in the upcoming labworks.
