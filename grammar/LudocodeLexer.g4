lexer grammar LudocodeLexer;

import Java20Lexer;

// $antlr-format alignTrailingComments true, columnLimit 120, minEmptyLines 1, maxEmptyLinesToKeep 1, reflowComments false, useTab false alignSemicolons hanging, alignColons hanging

// Multiline string literals are allowed
FormatStringCharacter: ~[\\] | EscapeSequence;

TOSTRING: 'toString';

HASHCODE: 'hashCode';

EQUALS: 'equals';

GET: 'get';

SET: 'set';

LIST: 'list';

DEFAULT_ACCESSORS: 'default_accessors';