Overview

This document contains a set of instructions for The Data Shed technical assessment solution
The solution is built on spark-standalone mode and scala.  

Installation(for windows)

Java
Download & Install Java (latest version) through https://www.java.com/en/download/
Add JAVA_HOME Path in System Variables.

Scala
Download and Install Scala (latest version) through http://www.scala-lang.org/download/
Directly add <Scala location>\bin to the Path.

We’ll be using Spark prebuilt package for Hadoop 2.6 (later can be used too).
Download Spark through this link:: https://spark.apache.org/downloads.html
Extract the files to a folder (it can be your choice of folder)
Add the folder path to SPARK_HOME (eg: SPARK_HOME = D:\Hadoop\spark-2.0.1-bin-hadoop2.6) to System Variables as “%SPARK_HOME%\bin”.
We need to download the ‘winutils.exe’ file and place it in a location (Link to download: https://github.com/steveloughran/winutils, clone the entire folder in your local system and unzip).
Provide the path for HADOOP_HOME = “Location for winutils files” and add to system variables as “%HADOOP_HOME%\bin”.


About the Approach for the solution:


IOHandler.scala 
This class will handle everything related to IO, reading csv and writing to csv file .
Transformations.scala
This is an object  that contains every transformation our job needs. The idea here is to put every transformation in it’s method so that we can test it alone.
StringCompMatch.scala:

This is an object which has two methods. stringComp which calculates the distance between two strings. I have created getStringDistance  to compare a column with a list of values to get the related column value from the list of values. 

MainJob
This class is like an orchestrator, using the other components to serve a use case. It’s responsible for loading the data, transforming it then saving the results.
Grouping everything in a separate class makes it much easier to test.


Main.Scala
contains the main method. No transformations or logic is put inside it.

Unit Tests: I have used ScalaTest for unit testing 
IOHandlerTest.scala to unit test IOHandler.
StringCompSuite.scala to unit test the stringComp method of StringCompMatch.
DatasetSpec.scala to unit test the dataframe transformations
