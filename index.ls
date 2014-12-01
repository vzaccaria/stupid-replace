
{docopt} = require('docopt')
{cat} = sh = require('shelljs')
require! 'fs'
vex = require('verbal-expressions')

doc = """
Usage:
    stupid-replace TAG -f FILE
    stupid-replace -h | --help 

Options:
    -f, --file FILE     If no <input> is passed, it is read from stdin
"""

get-option = (a, b, def, o) ->
    if not o[a] and not o[b]
        return def
    else 
        return o[b]

o = docopt(doc)


filename      = get-option('-f' , '--file'     , '/dev/stdin'  , o)

content = cat(filename)

fs.readFile '/dev/stdin', 'utf-8', (err, data) ->
    if not err
        exp = vex().then(o['TAG'])
        console.log data.replace(exp, content)







