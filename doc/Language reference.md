# Language reference

## Comments

*Shell-like*

A comment starts with `#` and lasts until the end of the current line. Shebangs are supported.

```jslave
# This is a comment
```

## Attributes

Attributes are defined using the same syntax as java, except that there is no terminating semicolon.

```jslave
protected transient int attr {get}
String val {get}
final double g {get} = 9.81
Object o {get} = null
Object o1 {get}
Object o2 {get}
Object o3 {get}, o4 {get} = null, o5 {set}

int b {} # equivalent to int b

modifier type name {get set} = initializer
modifier type name {} = initializer
modifier type name = intitialzier

final int a # error: final variable a not defined
final int a {set} # error: can't set a final variable
```

If an initializer is present, the attribute isn't added to the constructor.

## Methods

usage|meaning
-|-
name|stub
name()|default implementation
name(...)|custom implementation

java method|stub|default implementation|custom implementation
-|-|-|-
equals|`equals`|`equals()` &rarr; all variables|`equals(variable list)` &rarr; compare on specific variables
hashCode|`hashCode`|`hashCode()` &rarr; all variables|`hashCode(variable list`) &rarr; compare on specific variables
toString|`toString`|`toString()` &rarr; autogenerate a string (identicial to java records)|`toString(format string)` &rarr; custom formatting
main|`main` &rarr; static main method with implicit *args* argument|-|-
user method|java method signature|-|-

*equals* and *hashCode* also generate each other with the same parameters if not present (since a class should have both `equals()` and `hashCode()` or neither)

If type of attribute is primitive - check against known list - give special behavior (==)

stub is empty method. It should cause compilation error (no return) or at least warning for unused parameters so we don't forget to implement it.

User methods can be defined in code blocks.

Constructuor

### Attribute list syntax

syntax|meaning
-|-
attribute|include *attribute*
!attribute|include all but *attribute*

Separated by commas.

{a, b, c, d}:

- (a, !b, c) &rarr; {a, c}, !{b} &rarr; {a, c, d}
- (!b) &rarr; {}, !{b} &rarr; {a, c, d}
- (!b, !c) &rarr; {}, !{b, c} &rarr; {a, d}
- (a, !a) &rarr; {a}, !{a} &rarr; {a, b, c, d}

### Format string

Enclosed in double quotes (").

The syntax takes inspiration from C# format strings.

Supports Java escape sequences and HTML5 entities.

```text
{titre}\tFilm {nationalite} de {duree} mn\n
\n
Résumé&nbsp;: {resume}\n
Acteurs ({acteurs.size()})&nbsp;:\n
- {acteurs:list("\n- ")}

Acteurs&nbsp;: {acteurs.stream().limit(acteurs.size() - 1):list(", ")} et {acteurs.get(acteurs.size() - 1)}
```

Format items are Java expressions. The part after the `:` is the format specifier. The following values are supported:

syntax|meaning
-|-
list|list of items separated by null (stub)
list()|list of items separated by a single space character
list("separator")|list of items separated by *separator*
list("separator", "last separator")|list of items separated by *separator*, except the second-to-last and last items which are separated by *last separator*.

### Code blocks

````jslave
```
any java code valid inside a class is supported in there
```
````

Note: code blocks should be used as a last resort &mdash; as they are dumb. The Java code they contain is simply copied to the output at an unspecified location. Members they define aren't visible in Jslave and won't be sorted.

### Includes

```jslave
include "path" # Local include
include <path> # Library include
```

Include statements must be at the top of the file. It is a syntax error for an include statement to be preceded by anything but other include statements.

For **local includes**, `path` is relative to the directory containing the current file &mdash; and *not* the current directory of the generator process.

For **library includes**, `path` is relative to the directory given by the `--library` CLI option (see [CLI documentation](CLI.md)).
