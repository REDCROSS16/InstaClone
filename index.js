const express = require('express');
const fs = require('fs');

const app = express();

app.use((req, res, next)=> {
    let now = new Date();
    let hour = now.getHours();
    let minutes = now.getMinutes();
    let seconds = now.getSeconds();
    let data = `${hour}:${minutes}:${seconds} [method:${req.method}] [URL:${req.url}]`;
    console.log(data);
    fs.appendFile('server.log', data + "\n", function(){});
    next();
});

// роутинг
app.use('/', (req, res)=> {
    res.sendFile(__dirname + '/template/index.html');
});

app.get('/json', (req, res) => {
    res.status(200).json({
        message:'Hello',
        age: 23,
        name: "Alex",
    });
});

app.get("/about", (req, res) => {
    console.log(res.status);
    res.send("<h1>О сайте</h1>");
    });


// прослушка порта 3000
app.listen(3000, ()=> {
    console.log('Смотрим порт 3000!');
}); 