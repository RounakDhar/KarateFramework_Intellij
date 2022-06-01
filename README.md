# KarateFramework_Intellij

Building Karate Framework ; which is a Combination of Cucumber , JavaScript . Used Scenario , Scenario Outline 

Add Plugin in Intelij :
1. Gherkin
2. Cucumber for Java

Add a Runner File(given commands as example):

import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
public class demoRunner {
    //return new karate().tags("sanity").relativeTo(getClass());
}


Add Maven Dependency:

1.karate-core
2.karate-junit4
3.junit

Create a ".Feature" File , where you Will Write the TC; Follow the Steps like below:

Feature:

Scenario:
Given
When 
Then
*

or,

Feature:

Scenario Outline:
Given
When 
Then
*

Examples:
  |     |     |
  |     |     |





