let fs = require('fs');
fs.readFile('./input-3.txt', (err, data) => {
    let lines = data.toString().split('\n');
    let nums = lines.map(l => Array.from(l.matchAll(/\d+/g)));
    console.log(lines.map((l, i) => Array.from(l.matchAll(/\*/g)).map(j => j.index)
        .map(j => nums.slice(Math.max(i-1, 0), i+2).flat().filter(
            n => j >= n.index-1 && j <= n.index+n[0].length).map(n => parseInt(n[0])))
        .filter(x => x.length == 2).map(x => x.reduce((a,b) => a*b)))
        .flat().reduce((a,b) => a+b));
});
