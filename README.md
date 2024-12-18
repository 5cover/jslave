# Ludocode Blueprints (WIP)

Java boilerplate generator

A language to define declarative "blueprints" that generate Java classes.

Supports automatic and customizable generation of:

- Inheritance trees (`extend`, `implement`, `permits`)
- Attributes
- Getters/setters
- `hashCode` method
- `equals` method
- `toString` method
- Method stubs

Addtional features include:

- Nested and static classes
- Arbitrary Java code blocks

## Advantages over snippets

A Ludocode blueprint is self-contained and can be automated, unlike snippets/shortcuts which are IDE-dependent and require manual input. This approach has the following advantages:

- Blueprints can be passed around as files
- Blueprints can generate to something else than Java
- Generation is predictable and deterministic
- Generation can be automated in a script

Cons:

- Since we're no longer in a Java context, we won't recieve help much from the IDE while writing Ludocode (syntax highlighting, auto-completion&hellip;). This issue is mitigated by the simplicity of the language, and the future VSCode extension.

## Getting started

### 1. Write your Ludocode file

Your Ludocode file (idomatically called a **blueprint**) defines the structure of your Java code, and provides syntax for common patterns in order to avoid writing all that pesky Java boilerplate.

More details about the syntax can be found in the [documentation](.), but the main idom is as follows:

A blueprint is a list of **definitions** that generate to the corresponding Java type (classes, records, interfaces&hellip;). Each definitions contains zero or more **members** that determine the contents of the type.

Members can be of two kinds:

- **attributes** define the data fields of the type. They generate to Java class attributes, and getter/setter methods.
- **methods** define the behaviors of the type. Methods that have a special meaning in Java (`equals`, `hashCode`, `toString`) are called **special methods**. They can be expressed in three forms:
  - **stub**: an empty method to implement either from the generated Java or with a code block (more on these later)
  - **default implementation**: a default, general-purpose implementation that should work for most cases
  - **custom implementation**: the default implementation, customized by passing arguments to the method

### 2. Generate it

From the VSCode extension GUI or using the standalone binary, generate your blueprint.

Multiple targets are available

- Java (obviously): generates Java code
- Mermaid: generates a [Mermaid class diagram](https://mermaid.js.org/syntax/classDiagram.html) that represents the structure of the blueprint

## Roadmap

- [ ] Language documentation
- [ ] CLI documentation
- [ ] Formal grammar
- [ ] Test suite
- [ ] Standalone binary
- [ ] VSCode extension
- [ ] Java target
- [ ] Mermaid class diagram target
