# Snippets approach

Something like Emmet. That is, in-file editing. Basically, snippet expressions.

## Boilerplate

### Accessors

It's a pain to define get and set for the attribute.

### Constructor

It's a pain to add the attribute to the constructor arguments and initialize it.

### toString

It's a pain to update the toString for the attribute

### equals

It's a pain to add the attribute to the equals() method.

It's a pain to create the equals method (null handling, downcast).

## Not boilerplate

### hashCode

`Objects.hashCode` already does most of the work for you.

### attributes

Literally a type and a name. Not much can be done here.

## Solution

### Attributes

When we write an attribute, support commands

word|meaning
get|get
set|set
ts|toString
eq|equals (and hashCode)
c|constructor

Example

```java
String name+get+set+ts+eq+c;
```

Semicolon typed = expand command

### Classes

word|meaning
-|-
eq|equals (and hashCode)
ts|toString
main|main method

Example

```java
class Person+eq+ts+main extends AAA implements BBB, CCC {
```

Opening brace typed = expand command
