//var connection = require('../routes/con.js').localConnect();
var db = require('./connection.js').db;

module.exports = function SaveRecord(req , res , next){
    
    var ref = db.ref("server/saving-data/fireblog/"+req.session.companyname+"");
    var usersRef = ref.child("postdetails");
    usersRef.push().set(
        {
            name: req.session.name,
            role: req.session.role,
            company:req.session.companyname,
            post: req.body.post
        }
    );

    res.redirect('/customer');

  /*  
    var input = JSON.parse(JSON.stringify(req.body));

    var RecordDetailParsedFromForm = {

        name    : input.name,
        address : input.address,
        email   : input.email,
        phone   : input.number

    };
    connection.query("INSERT INTO customer set ? ",RecordDetailParsedFromForm, function(err, rows)
    {

        if (err)
            console.log("Error inserting : %s ",err );

        res.redirect('/customer');

    });*/


}
