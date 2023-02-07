const express = require('express'); 
const bodyParser = require('body-parser');
const mysql = require('mysql')

const app = express();              //Instantiate an express app, the main work horse of this server

//Idiomatic expression in express to route and respond to a client request
app.get('/', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('index.html', {root: __dirname});      //server responds by sending the index.html file to the client's browser
                                                        //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile 
});
  
var connection = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"<Senha do Root>",
    database : "aula3exer1"
})
  
// Connecting to database
connection.connect(function(err) {
    if(err){
      console.log("Error in the connection")
      console.log(err)
    }
    else{
      console.log(`Database Connected`)
      connection.query(`USE aula3exer1;`, 
      function (err) {
        if(err)
          console.log(`Error executing the query - ${err}`)
        else
          console.log("Using aula3exer1...") 
      })
    }
})

app.use(bodyParser.urlencoded({ extended: true }));

app.post('/submit', (req, res) => {
  const matricula = req.body.matricula;
  console.log(`matricula: ${matricula}`);
  // o valor inserido no input é concatenado a Query de consulta Select como sendo a condição de filtragem
  // porém ao passar uma condição que é sempre verdadeira, ex: 1 = 1, todas as tuplas são retornadas.
  connection.query("SELECT * FROM Plantonista WHERE matricula = " + matricula + ";", 
      function (err, result) {
        const resultTreated = result?.map(item =>`<tr><td>${item?.nomeCompleto}</td></tr>`)
        if(err)
          console.log(`Error executing the query - ${err}`)
        else
          res.send(
            `<body style="background-color:cornflowerblue; width: 100vw; height: 100vh; margin: 0px;"><div style="display: flex; justify-content: center; margin-top: 30px"><table><tr><th style="font-size: large; font-weight:bold; font-family: Verdana, Geneva, Tahoma, sans-serif;">Info</th></tr>${resultTreated}</table></div></body>`
          )
      })
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});