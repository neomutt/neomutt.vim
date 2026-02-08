# NeoMutt Config Vim Syntax

## Format String List

Find all `ExpandoDefinition`:

Search for all:

- `DT_EXPANDO` => `AliasFormatDef` (data field)
- `static const struct ExpandoDefinition AliasFormatDef[]`

Fold in ...NoPadding

## Format String Letters

`s:escapesConditionals('NAME', '[LETTERS]', P, C)`

- NAME from AliasFormatDef without Def
- LETTERS from AliasFormatDef
  Sorted `AaBb...`
- P = has padding expandos
- C = allows conditionals

## Menu Names

Search for `km_register_menu()`

## Hooks

See:

- `CompCommands` in `compmbox/compress.c`
- `HooksCommands` in `hooks/commands.c`

Categories:

- Regex Hooks -
- Pattern Hooks -
  - `parse_charset_hook()`
  - `parse_index_hook()`
  - `parse_mailbox_hook()`
  - `parse_pattern_hook()`
- Global Hooks
  - `parse_global_hook()`

Notes:

- `folder-hook`, `mbox-hook` allow `-noregex`
- `unhook` will be referenced elsewhere
- `pgp-hook` is deprecated

## Patterns

List of letters in Flags in `pattern/flags.c`

Grouped by 'eat' function:
- `EAT_DATE`
- `EAT_GROUP`
- `EAT_MESSAGE_RANGE`
- `EAT_NONE`
- `EAT_QUERY`
- `EAT_RANGE`
- `EAT_REGEX`
- `EAT_STRING`

`%pattern` contains some `EAT_REGEX` patterns:

- `~b` - `MUTT_PAT_BODY`
- `~B` - `MUTT_PAT_WHOLE_MSG`
- `~h` - `MUTT_PAT_HEADER`
- `~H` - `MUTT_PAT_HORMEL`
- `~s` - `MUTT_PAT_SUBJECT`
- `~t` - `MUTT_PAT_TO`
- `~x` - `MUTT_PAT_REFERENCE`
- `~y` - `MUTT_PAT_XLABEL`

`=pattern` contains some `EAT_REGEX` patterns:

- `~c` - `MUTT_PAT_CC`
- `~C` - `MUTT_PAT_RECIPIENT`
- `~e` - `MUTT_PAT_SENDER`
- `~f` - `MUTT_PAT_FROM`
- `~H` - `MUTT_PAT_HORMEL`
- `~i` - `MUTT_PAT_ID`
- `~L` - `MUTT_PAT_ADDRESS`
- `~s` - `MUTT_PAT_SUBJECT`
- `~t` - `MUTT_PAT_TO`
- `~x` - `MUTT_PAT_REFERENCE`
- `~y` - `MUTT_PAT_XLABEL`

## Colours

List of fields in `ColorFields` in `color/command.c`
Quoted colours are handled separately.

Notes:

- Deprecated
  - `quoted`
  - `sidebar_spoolfile`
- Compose colours only accepted with underscores, e.g. `compose_header`

## Bools

Find `DT_BOOL` in `mutt_config.c` and `*/config.c`
Ignore `DT_SYNONYM`, `D_INTERNAL_DEPRECATED`.
Ignore `devel_*`

## Deprecated Bools

Find `D_INTERNAL_DEPRECATED` and `DT_SYNONYM` pointing to `DT_BOOL`.

## Quads

Find `DT_QUAD` in `mutt_config.c` and `*/config.c`
Ignore `DT_SYNONYM`, `D_INTERNAL_DEPRECATED`.

## Deprecated Quads

Find `D_INTERNAL_DEPRECATED` and `DT_SYNONYM` pointing to `DT_QUAD`.

## Numbers

Find `DT_NUMBER` in `mutt_config.c` and `*/config.c`
Ignore `DT_SYNONYM`, `D_INTERNAL_DEPRECATED`.

## Deprecated Numbers

Find `D_INTERNAL_DEPRECATED` and `DT_SYNONYM` pointing to `DT_NUMBER`.

## Expandos

Find `DT_EXPANDO` in `mutt_config.c` and `*/config.c`
Include `date_format` (which uses `strftime` expandos)

escapesConditionals("XyzFormat", CHARS, PAD, COND)
creates:
- muttrc + XyzFormat + Escapes        (if PAD)
- muttrc + XyzFormat + Conditionals

```
syntax region muttrcXyzFormatString contained skipwhite keepend start=+"+ skip=+\\"+ end=+"+ contains=muttrcXyzFormatEscapes,muttrcXyzFormatConditionals,muttrcFormatErrors nextgroup=muttrcVPrefix,muttrcVarBool,muttrcVarQuad,muttrcVarNum,muttrcVarString
syntax region muttrcXyzFormatString contained skipwhite keepend start=+'+ skip=+\\'+ end=+'+ contains=muttrcXyzFormatEscapes,muttrcXyzFormatConditionals,muttrcFormatErrors nextgroup=muttrcVPrefix,muttrcVarBool,muttrcVarQuad,muttrcVarNum,muttrcVarString

syntax match muttrcVarEqualsXyzFormat contained skipwhite "=" nextgroup=muttrcXyzFormatString

syntax keyword muttrcVarString contained skipwhite query_format nextgroup=muttrcVarEqualsXyzFormat

highlight def link muttrcXyzFormatString       muttrcString
highlight def link muttrcXyzFormatEscapes      muttrcEscape
highlight def link muttrcXyzFormatConditionals muttrcFormatConditionals2
```

## Strings

Lots of complicated rules

## Commands

Find: `const struct Command`

## Functions

Find `static const struct MenuFuncOp`

------------------------------------------------------------

## Questions / Notes

Who/what determines if a format string allows conditionals?
    ALL expandos can use conditionals
    BUT for many format strings id doesn't make sense to

Need to expand patterns to allow `%{long-name}`

