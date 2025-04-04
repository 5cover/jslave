// $antlr-format alignTrailingComments true, columnLimit 120, minEmptyLines 1, maxEmptyLinesToKeep 1, reflowComments false, useTab false alignSemicolons hanging, alignColons hanging

parser grammar JSlaveParser;

options {
    tokenVocab = JSlaveLexer;
}

import Java20Parser;

file: blueprint EOF;

blueprint
    : (annotation* PACKAGE Identifier (DOT Identifier)*)? // package
    (
        IMPORT (
            typeName
            | (packageOrTypeName DOT MUL)
            | STATIC typeName DOT (Identifier | MUL)
        )
    )* // imports
    configDirective* blueprintClass+;

blueprintClass
    : classModifier* CLASS typeIdentifier typeParameters? classExtends? classImplements? classPermits? (
        blueprintField
        | blueprintUserMethod
        | blueprintMethod
    )*;

blueprintField
    : fieldModifier* unannType blueprintVariableDeclarator (
        COMMA blueprintVariableDeclarator
    )*;

blueprintVariableDeclarator
    : Identifier dims? accessors? (EQUAL variableInitializer)?;

blueprintUserMethod: methodModifier* methodHeader;

blueprintMethod: methodEquals | methodHashCode | methodToString;

methodEquals: EQUALS (RPAREN fieldList? LPAREN)?;

methodHashCode: HASHCODE (RPAREN fieldList? LPAREN)?;

methodToString: TOSTRING formatString?;

configDirective: configDirectiveDefaultAccessors;

configDirectiveDefaultAccessors: DEFAULT_ACCESSORS EQUAL accessors;

accessors: RBRACE GET? SET? LBRACE;

fieldList: fieldRef (COMMA fieldRef)*;

fieldRef: BANG? Identifier;

formatString: RPAREN (FormatStringCharacter | formatItem)* LPAREN;

formatItem: RBRACE expression formatSpecifier? LBRACE;

formatSpecifier: COLON LIST RBRACE StringLiteral? LBRACE;