String::capitalize = -> @charAt(0).toUpperCase() + @slice(1)

String::camelize = -> (w.capitalize() for w in @split('_')).join('')
