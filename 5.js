let fs = require('fs');
fs.readFile('./input-3.txt', (err, data) => {
    // console.log(data.toString());
    let lines = data.toString().split('\n');
    console.log(lines.map((l, i) => Array.from(l.matchAll(/\d+/g)).filter(
        m => [-1, 0, 1].some(j => i+j >= 0 && i+j < lines.length &&
            Array.from(lines[i+j].slice(Math.max(m.index-1, 0),
                Math.min(m.index+m[0].length+1, l.length)))
            .some(c => (c < '0' || c > '9') && c != '.'))))
        .flat().map(x=>parseInt(x[0])).reduce((a, b) => a+b));
});
