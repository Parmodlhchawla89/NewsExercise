# NewYorkTopStories

Project Structure:
- **Delegate**: Contains app delegate file
- **Model**: Contains all entities  `Article`
- **Services**: Contains NewYorkTimes mostpopular service
- **ViewModel**: Contains ArticleViewModel
- **View**:  Contains view controllers
- **TableViewCell**:  Contains tableview custom cell
**Utilities**: Contains utility classes like Asyncimage downloading
- **Storyboard**: Contains all storyboards, each screen will have its corresponding storyboard.
- **Resource**: Images
Swift version - Swift 4.2
Design Pattern- MVVM
Xcode 10.2


Sample APIKEY used for calling NYT api: "XzFdP3brCQGBB9a2AD2Ur1puE8Obel6t"

##MAIN APPLICATION : This application fetches the mostviewd news from the new york time api. The data is being displayed in a table view in a custom cell which contains 'thumbnail', 'title' and published date. Once the user taps on the tableview cell the details screens open. The details page shows news image and some news details.

##Unit test cases: I have written a test cases whihc get the dummy data and then with the help of XCAssertEqual I am comparing the data to test whether data is being parsed properly or not

##UI automation test: Apart from the unit test cases, I have created a UI automation test case. This test case automatically opens up the app and taps on the various tableview cell, navigate to details page and come back to the home page.

##SonarQube: I have configured the project to generate a SonarQube report of code quality, warning and vulnerability.
I have configured "sonar-project.properties" file as per the project.

##Automatic build shell script has been added in the project structure "buildScript.sh" . This scripts does the following job:

Prerequisite to run the build script:

- JDK 1.8
- SonarQube
- SonarScanner

Once the above tools are installed, Start the SoarQube server with following command:

sh /Applications/SonarQube/bin/macosx-universal-64/sonar.sh console

- Navigate to local host: http://localhost:9000/about
- use username and password as 'admin'
- Navigate to project directory
- Run ./run-buildScript.sh -v command from terminal


The shell script will perfomr following task:
- build the project from the command-line
- run static code analysis such as linting
- run unit tests and code coverage

The SonarQube code coverage reports has been added in the project struture under "sonar-report" folder




