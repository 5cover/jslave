# Language design guidelines

The Ludocode language is designed around 3 core principles:

## Simplicity

The language should expose a minimal amount of features. It is better to have few features that do more than many features that do less.

The language should be easy to learn to anyone mildly familiar with Java, as it is basically a very high-level subset of Java.

## Consistency

There should be &mdash; ideally &mdash; only one way to do anything.

As an example, this principle is why single or unquoted string literals aren't supported. If all string literals use the same syntax, it makes the language easier to learn.

## Modularity

The language should be designed so that adding, deleting or moving sections of code requires as few changes the the existing code as possible.

An useful metaphor would be a puzzle, with each piece representing a section of the code. The language should be designed in such a way that each puzzle piece acts as if it had tabs on all sides, meaining that no matter how the pieces are placed, every one will fit. This kinda defeats the purpose of a puzzle, but helps making the language more versatile and easier to work with.
