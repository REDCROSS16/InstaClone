const express = require('express');

const app = express();


console.log('hello world');

let a = 5;
let b = 7;
console.log("А в степени B:");
console.log(a**b);

// роутинг
app.get('/', (req,res) => {
    res.send('<h1>Hello WORLD</h1>');
    
    
});
app.get('/json', (req, res) => {
    res.status(200).json({
        message:'Hello',
        age: 23,
        name: "Alex",
});
});
// прослушка порта 3000
app.listen(3000, ()=> {
    console.log('Example app listening on port 3000!');
});