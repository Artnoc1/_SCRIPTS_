From Stack Overflow ( https://stackoverflow.com )
  https://stackoverflow.com/questions/16414410/delete-empty-lines-using-sed/16414489
  https://stackoverflow.com/a/24957725


Delete empty lines using sed.

   sed 's/^ *//; s/ *$//; /^$/d; /^\s*$/d'

 `s/^ *//` => left trim
 `s/ *$//` => right trim
 `/^$/d` => remove empty line 
 `/^\s*$/d` => delete lines which may contain white space 

This covers all the bases.

