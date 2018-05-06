//modules

var express =  require('express'),
    mysql = require('mysql'),
    bodyParser = require('body-parser');

var app = express();

app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

//application initializer

var connection = mysql.createConnection(
    {
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'hms'
    }
);

function getNextPrimaryKey(tableName,primaryKey,getNext) {

    connection.query('SELECT '+primaryKey+' FROM ' +tableName+' ORDER BY '+primaryKey+' DESC LIMIT 1',function (err,result) {
        if(err){
             console.log("error");
        }else{
            return getNext(null,Object.values(result[0])[0]+1);
        }
    });
}


function returnsComma(a,b) {
    if(a==b)
        return "";
    else
        return",";
}

function sqlInsert(tableName,data) {

    console.log(data);
    data = Object.values(data);

        var sql = "INSERT INTO " + tableName +" VALUES (";

        for(var i = 0; i < data.length; i++)
        {


            if(Number(data[i]))
            {
                sql = sql + " "+data[i]+ returnsComma(i,data.length-1);
            }
            else
            {

                sql = sql + "'"+data[i]+"'" +returnsComma(i,data.length-1);
            }


        }

        sql = sql + ");";

    return sql;

}

/**********************************ROUTES******************************************/
//index
app.get('/',function (req,res) {
   res.render('index');
});

//doctors
app.get('',function (req,res) {

});
app.post('',function (req,res) {

});

//medicines
app.get('/medicines/',function (req,res) {
    //res.render('./Medicines/view');
    connection.query("SELECT * FROM Medicines",function(err,result){
        if(err){
            console.log("medicine data error");
        }else{
            var a=Object.values(result);
            res.render("./Medicines/view", {data:a} );
        }
    });
});

app.get('/medicines/new',function (req,res) {
    getNextPrimaryKey("Medicines","medicineId",function(err,result){
        console.log("Outside "+result);
        res.render('./Medicines/new',{medC:result});
    });
});

app.post('/medicines',function (req,res) {

    console.log(sqlInsert("Medicines",req.body));
    connection.query(sqlInsert("Medicines",req.body));
    res.redirect('/medicines');

});


//nurses
app.get('',function (req,res) {

});
app.post('',function (req,res) {

});


//words
app.get('',function (req,res) {

});
app.post('',function (req,res) {

});


//patients
app.get('/patients/new',function (req,res) {

    res.render('./Patients/new');
});
app.post('',function (req,res) {

});


//signup
app.post('/signup',function (req,res) {

    //console.log(sqlGenerator('Users',req.body));
    //var user = req.body.username;
    //var pass = req.body.password;
    connection.query(sqlInsert('Users',req.body),function (err) {
        if(err)
        {
            console.log('something went wrong');
        }else
        {
            console.log('data inserted');
        }
    });

    res.redirect('/');
});


app.get('/signup',function (req, res) {
    res.render('signup');
});






app.listen(3000,function () {
    console.log('server started');
});



