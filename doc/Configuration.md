# Configuration

Configuration values configure the generation.

They can be set at different levels, with values defined at lower levels overriding values defined at higher levels in their defined scope:

Location|Scope
-|-
Generator option|everywhere
JSON configuration file|everywhere
File config|current file
Definition|current definition

## Configuration values

Name|Type|Affects
-|-|-
Sorting|?|The sorting of members

## JSON configuration file

A configuration file can be provided on a per-project basis. The `--config` CLI option gives the path of the configuration file (see [CLI documentation](CLI.md)).