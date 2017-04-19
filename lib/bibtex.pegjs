bibliography = e:(entry)* {
  return e;
}

entry = "@" type:type "{" space? key:word space? fields:field* "}" space? {
  return {
    type: type,
    key: key.join(''),
    fields: fields
  };
}

field = "," space? name:word space? "=" space? val:escapedString space? {
  return { name: name.join(''), value: val };
}

escapedString = curlyString / dqString

curlyString = "{" s:([^{}])+ "}" { return s.join(''); }
dqString = '"' s:([^"])+ '"' { return s.join(''); }

type = "article" / "book"

word = (letter+)

letter = [a-zA-Z0-9]

space = [ \t\n\r]*
