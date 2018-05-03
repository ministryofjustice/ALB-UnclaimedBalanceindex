Unclaimed Balance Indexes
=========================
A public facing service written in Java using the struts framework. 

The public use the service to search online for unclaimed funds held by the Court Funds office. 

This is a legacy application maintained by Tactical Products team.

Mac OS centric...

Dependances
-----------

* [JDK 1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* [Tomcat 8.5](https://tomcat.apache.org/download-80.cgi)
* [Apache Ant](https://ant.apache.org/index.html)

Build and Run the Application
-----------------------------

```
$ git clone https://github.com/ministryofjustice/ALB-UnclaimedBalanceindex.git
```

Navigate to the root of the project, Make sure there is a build.xml file (if not contact the Tactical Products team)

Run ant
```
$ ant
```

Ant will build the app and create a build and deploy folder

Copy the .war file from the deploy folder to tomcat’s webapps folder

Installing Dependances
==================
Installing Java
-------------------
Download the correct file to install on your os.

Add Java to your bash profile

Open bash

```
$ nano .bash_profile 
```

Add the following

```
$ export JAVA_HOME=$(/usr/libexec/java_home)
```

Installing Ant
-----------------

Using Homebrew

```
$ Brew install ant
```

Installing Tomcat
----------------------

Check Java Version

```
$ java -version
```

Should have something like ```java version "1.8.0_131```

Download the tar.gz of the Tomcat 8.5 Deployer

Copy zip file to a happier location

Unzip

Change permissions and ownerships of the following files

```
$ sudo chown -R <your_username> /path/to/Tomcat
$ sudo chmod +x /path/to/Tomcat/bin/*.sh
```
*To start*  ```$ /path/to/tomcat/bin/startup.sh```

*To stop*   ```$ /path/to/tomcat/bin/shutdown.sh```
