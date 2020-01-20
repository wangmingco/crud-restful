// 连接数据库
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  database : 'helloworld'
});
 
connection.connect();

// 创建server
var express = require('express'),
  app = express(),
  port = 5002;

// 注册路由
var router = express.Router();            
router.get('/helloworld', function(req, res) {
    res.send("welcome");   
});
router.get('/SelectAll', function(req, res) {
    
    connection.query('SELECT * from helloworld', function (error, results, fields) {
        if (error) throw error;
        res.send(results); 
    });  
});

app.use('/', router);

// 启动服务
app.listen(port);

console.log('Node 服务监听端口: ' + port);