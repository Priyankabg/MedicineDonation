var express=require('express');
var app=express();
var fs = require('fs');
app.set('views', './views');
app.set('view engine', 'ejs');
// app.set('view engine','ejs');
require('dotenv').config();
var debug = require('debug')('http');
var morgan = require('morgan');
var path = require('path');
var cookieParser = require('cookie-parser');
var router = express.Router();
var bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: false})); // support encoded bodies
// app.use('/assets', express.static('./public'));
app.set('view engine', 'ejs');
var nodemailer = require('nodemailer');
var transporter = nodemailer.createTransport({
  host: 'smtp.ethereal.email',
  port: 2525,
  service: 'gmail',
  auth: {
    user: 'helpify123@gmail.com',
    pass: '02512609841'
  }
});

var mysql = require('mysql');
var con = mysql.createConnection({
 host: "localhost",
 user: "root",
 password: "2609841",
 database: "medicine"
});
app.use(express.static(path.join(__dirname, '/public')));
// app.use(express.static(__dirname + '/public'));
 con.connect(function(err) {
  if (err) throw  err;
  console.log("connected");});
var mysqlAdmin = require('node-mysql-admin');
app.use(mysqlAdmin(app));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname,'index.html'));
});
app.get('/donate', (req, res,next) => {
  res.sendFile(path.join(__dirname,'donate.html'));
});
app.get('/bank', (req, res) => {
  var err=false;
  res.render('bank',{err:err});
});
app.get('/moneydonation', (req, res) => {
  res.sendFile(path.join(__dirname,'money.html'));
});
app.get('/admin', function(req,res) {
  var err=false;
  var corr=false;
  res.render('admin',{err:err});
  // body...
});
app.get('/ngo', (req, res) => {
  res.sendFile(path.join(__dirname,'ngo.html'));
});
app.get('/req', (req, res) => {
   con.query('SELECT * FROM ngo ', function(err, result, fields) {
      if (err) throw err;
      if (result.length > 0) {
        // console.log(result)
        var err=true;
        var corr=false;
        res.render('req',{err:err,data:result,corr:corr});
      } else {
        var err=false;
        var corr=true;
        res.render('req',{err:err,corr:corr});
      }     
    });


});

app.get('/med', (req, res) => {
   con.query('SELECT * FROM donor', function(err, result, fields) {
      if (err) throw err;
      if (result.length > 0) {
        console.log(result)
        var err=true;
        var corr=false;
        res.render('med',{err:err,data:result,corr:corr});
      } else {
        var err=false;
        var corr=true;
        res.render('med',{err:err,corr:corr});
      }     
    });
});
app.get('/money', (req, res) => {

con.query('UPDATE money SET active ="1" ', function(err, result, fields) {
    if (err) throw err;
});

   con.query('SELECT * FROM money', function(err, result, fields) {
      if (err) throw err;
      if (result.length > 0) {
        console.log(result)
        var err=true;
        var corr=false;
        res.render('money',{err:err,data:result,corr:corr});
      } else {
        var err=false;
        var corr=true;
        res.render('money',{err:err,corr:corr});
      }     
    });
});


app.post('/donate', function(req, res) {
  console.log(req.body.exp);
  var sql = "INSERT INTO donor (fname,lname,address,city,state,medicine,contact,exp) VALUES ('"+req.body.fname+"','"+req.body.lname+"','"+req.body.add+"','"+req.body.city+"','"+req.body.state+"','"+req.body.medi+"','"+req.body.phoneno+"','"+req.body.exp+"')";
  con.query(sql, function(err, result)  {
    // console.log("i am query")
   if(err) throw err;
   console.log("table created");
   });
  var go= "INSERT INTO illness (name,illness,city,medicine,contact,medicom) VALUES ('"+req.body.fname+"','"+req.body.ill+"','"+req.body.city+"','"+req.body.medi+"','"+req.body.phoneno+"','"+req.body.medicom+"')";
  con.query(go, function(err, result)  {
    // console.log("i am query")
   if(err) throw err;
   // console.log("table created");
   });
  res.sendFile(path.join(__dirname,'index.html'));
});

app.post('/admin', function(req, res) {
  var username = req.body.username;
  var password = req.body.password;
  console.log(username);
  console.log(password);
    con.query('SELECT * FROM accounts WHERE username = ? AND password = ?', [username, password], function(err, result, fields) {
      if (err) throw err;
      
      if (result.length > 0) {
        console.log(result)
        res.sendFile(path.join(__dirname,'main.html'));
      } else {
        var err=true;
        res.render('admin',{err:err})
      }     
    });

});

app.post('/bank', function(req, res) {
  var medi = req.body.medi;
  var city = req.body.city;
  var ill=req.body.ill;
  // console.log(medi);
  // console.log(city);
  // console.log(ill);
    con.query('SELECT * FROM donor WHERE medicine = ? AND city = ?', [medi,city], function(err, result, fields) {
      if (err) throw err;
      if (result.length > 0) 
      {
        var err=true;
        var corr=false;
        var t=false;
        res.render('bank',{err:err,data:result,corr:corr,medi:req.body.medi,t:t});
      } 
      else 
      {
      con.query('SELECT * FROM illness WHERE illness = ? AND city = ?', [ill,city], function(err, result, fields) {
      if (err) throw err;
      if (result.length > 0) 
      {
        var err=false;
        var corr=false;
        var t=true;
        res.render('bank',{err:err,data:result,corr:corr,medi:req.body.medi,t:t});
      }
      else{

        var err=false;
        var corr=true;
        var t=false
        res.render('bank',{err:err,corr:corr,t:t});
      } 
    });
    }
    });
});
app.post('/ngo', function(req, res) {

  var sql = "INSERT INTO ngo (name,address,city,state,phoneno,email) VALUES ('"+req.body.name+"','"+req.body.add+"','"+req.body.city+"','"+req.body.state+"','"+req.body.phoneno+"','"+req.body.email+"')";
  con.query(sql, function(err, result)  {
    // console.log("i am query")
   if(err) throw err;
   // console.log("table created");
   });


  res.sendFile(path.join(__dirname,'index.html'));
});
app.post('/ngo', function(req, res) {

  var sql = "INSERT INTO ngo (name,address,city,state,phoneno,email) VALUES ('"+req.body.name+"','"+req.body.add+"','"+req.body.city+"','"+req.body.state+"','"+req.body.phoneno+"','"+req.body.email+"')";
  con.query(sql, function(err, result)  {
    // console.log("i am query")
   if(err) throw err;
   // console.log("table created");
   });


  res.sendFile(path.join(__dirname,'index.html'));
});




app.post('/delete/:_id', function(req, res, next){
var ser=req.params._id;
con.query('SELECT email FROM ngo WHERE did = ?',[ser], function(err, result, fields) {
  if (err) throw err;
  var s=result[0].email;
  console.log(result);
  console.log(s);   
  if (result.length > 0) {
    console.log(result.email)
    var mailOptions = {
    from: 'helpify123@gmail.com',
    to:result[0].email,
    subject: 'Sorry we could not approve your request',
    text: 'The information provided by your NGO  has some invalid information which is restricting us to coordinate with your team. Do recheck the information you have provided.'
    };    
      }
// console.log(Object.assign({}, mailOptions)); 
  transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});     
    });

app.post('/d/:_id', function(req, res, next){
var ser=req.params._id;
console.log(req.params._id);
  con.query('DELETE FROM donor WHERE did = ?',[ser], function (err, result) {
    if (err) throw err;
    console.log("Number of records deleted: " + result.affectedRows);
    res.redirect('/med')
  });

});



  con.query('DELETE FROM ngo WHERE did = ?',[ser], function (err, result) {
    if (err) throw err;
    console.log("Number of records deleted: " + result.affectedRows);
    res.redirect('/req')
  });

});
app.post('/acc/:_id', function(req, res, next){
var ser=req.params._id;
con.query('SELECT * FROM ngo WHERE did = ?',[ser], function(err, result, fields) {
    if (err) throw err;
    var mailOptions = {
    from: 'helpify123@gmail.com',
    to:result[0].email,
    subject: 'Welcome to the family',
    text: 'Thank you for coordinating/joing your hands with us We require a few more details regarding the working of your NGO in order to complete the procedure. Do revert back with the same to this mail. Helpify will soon get in touch with you regarding the furthur procedures.'
    };   
    // console.log(Object.assign({}, mailOptions)); 
    transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});
});



  con.query('DELETE FROM ngo WHERE did = ?',[ser], function (err, result) {
    if (err) throw err;
    console.log("Number of records deleted: " + result.affectedRows);
    res.redirect('/req')
  });

});

app.post('/moneydonation', function(req, res, next){
var sql = "INSERT INTO money(name,email,amount,city,state,cardname,cardno,expmonth,year,cvv) VALUES ('"+req.body.name+"','"+req.body.email+"','"+req.body.amount+"','"+req.body.city+"','"+req.body.state+"','"+req.body.cname+"','"+req.body.ccnum+"','"+req.body.expmonth+"','"+req.body.expyear+"','"+req.body.cvv+"')";
  con.query(sql, function(err, result)  {
     if(err) throw err;
   console.log("table created");
});
  res.redirect('/')
});
app.post('/money/:_id', function(req, res, next){
var ser=req.params._id;
console.log(ser)
var r=0;
con.query('SELECT * FROM money  WHERE cardno = ?',[ser], function(err, result, fields) {
    if (err) throw err;
    var mailOptions = {
    from: 'helpify123@gmail.com',
    to:result[0].email,
    subject: 'Welcome to the family',
    text: 'There is an accurate quote Generosity is the most natural outward expression of an inner attitude of compassion and loving-kindness.” —The Dalai Lama XIV  We thank you for having shown kindness and donated previously. You provided for the needy whose life as ben improved because of you.We strive to help those in need. You can make further donations to us here.'
    };   
    // console.log(Object.assign({}, mailOptions)); 
    transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});
});
con.query('UPDATE money SET active = ? WHERE cardno = ?',[r,ser], function(err, result, fields) {
    if (err) throw err;
});

   con.query('SELECT * FROM money', function(err, result, fields) {
      if (err) throw err;
      if (result.length > 0) {
        console.log(result)
        var err=true;
        var corr=false;
        res.render('money',{err:err,data:result,corr:corr});
      } else {
        var err=false;
        var corr=true;
        res.render('money',{err:err,corr:corr});
      }     
    });
  
});

app.listen(3000);
console.log('you are listening to port 3000')

