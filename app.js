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

//resposible for /root static items
//app.use('/',express.static('./views/Extra/Statics'));
app.use('/', express.static('./views/Extra/Statics'));

/******************************************Proyojonio functions :') *********/

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

function callPros(pros,data) {

    console.log(data);
    data = Object.values(data);

    var sql = "CALL " + pros +"(";

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



function docForm() {

    var doc={
        count:0,
        title1:["Serial No.","Degree","Board","Year","Division/CGPA","Position"],
        title2:["Serial NO","Job Title","From","To","Organization"],
        degree:["SSC","HSC","MBBS"]
    };

    return doc;
};

/**********************************ROUTES******************************************/
//index
app.get('/',function (req,res) {
   res.render('index');
});

//doctors
app.get('/doctors/',function (req,res) {
    res.render('./Doctors/view');
});


var a=docForm();
app.get('/doctors/new',function (req,res) {
    res.render('./Doctors/new',{title1: a['title1'], title2: a['title2'], degree: a['degree'], pid: "1", count: a['count']});
    a['count']++;
});

app.post('/doctors/new',function (req,res) {

    //console.log("submit button clicked "+a['count']+" times");
    console.log(req.body);
    if(a['count']<3) {
        res.redirect('/doctors/new');
    }else{
        res.redirect('/doctors/');
        a['count']=0;
    }
});



//medicines
app.get('/medicines/new',function (req,res) {
    getNextPrimaryKey("Medicines","medicineId",function(err,result){
        console.log("Outside "+result);
        res.render('./Medicines/new',{medC:result});
    });
});

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

app.post('/medicines',function (req,res) {

    //console.log(sqlInsert("Medicines",req.body));
    connection.query(sqlInsert("Medicines",req.body));
    res.redirect('/medicines');

});


//nurses

var b=docForm();
app.get('/nurses/',function (req,res) {
    res.render("./Nurses/view");
});

app.get('/nurses/new',function (req,res) {
    res.render('./Nurses/new',{title1: b['title1'], title2: b['title2'], degree: b['degree'], pid: "1", count: b['count']});
    b['count']++;
});

app.post('/nurses/new',function (req,res) {
    console.log(req.body);
    if(b['count']<3) {
        res.redirect('/nurses/new');
    }else{
        res.redirect('/nurses/');
        b['count']=0;
    }
});


//wards
app.get('',function (req,res) {

});
app.post('',function (req,res) {

});


//patients

app.get('/patients/new',function (req,res) {

    res.render('./Patients/new',{pid:"1"});
});
app.get('/patients/investigation',function (req,res) {

    res.render('./Patients/investigation');
});
app.post('/patients',function (req,res) {

    console.log(req.body);
    //console.log(callPros(req.body));
    res.redirect('/patients/investigation');
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



