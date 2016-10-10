//Get database connection
var connection = require('../routes/connection.js').localConnect();
var nodemailer = require('nodemailer');
var xoauth2 = require('xoauth2');
var config = require('../config/config.json');
var username = config.emailconfig.username;
var clientid = config.emailconfig.clientid;
var clientsecret = config.emailconfig.clientsecret;
var refreshtoken = config.emailconfig.refreshtoken;
var accesstoken = config.emailconfig.accesstoken;
var mailfrom = config.emailconfig.mailfrom;
var fs = require('fs');

module.exports = {
    getCreateResourceAccount: function(req, res, next) {
        res.render('resource/account', {
            page_title: "Create Resource Account"
        });
    },
    setCreateResourceAccount: function(req, res, next) {
        var input = JSON.parse(JSON.stringify(req.body));
        var sql_check_exist = "select count(*) cnt from ppr_users where email='" + input.email + "' ";
        connection.query(sql_check_exist, function(err_check_exist, rows_check_exist) {
            if (err_check_exist) console.log("Error inserting : %s ", err);
            if (rows_check_exist[0].cnt > 0) {
                res.status(404).json({
                    "message": "Email already exist"
                })
            } else {

                var transporter = nodemailer.createTransport({
                    service: 'gmail',
                    auth: {
                        xoauth2: xoauth2.createXOAuth2Generator({
                            user: username,
                            clientId: clientid,
                            clientSecret: clientsecret,
                            refreshToken: refreshtoken,
                            accessToken: accesstoken
                        })
                    }
                });
                
                var company_id = 1;
                var reporting_to = 3;
                var sql = "insert into ppr_users (id,name,contact,email,role_id,password,user_status_id,uploadfile,country,language,isenterprise,costforuse,costforhour,reportingto,company_id) " + "values(null,'" + input.name + "','" + input.contact + "','" + input.email + "',(select id from ppr_user_roles where role='" + input.role + "'),MD5('" + input.password + "'),(select id from ppr_user_status where status='Active'),'" + input.userimage + "','" + input.country + "','" + input.language + "',false," + " '" + input.costforuse + "','" + input.costforhour + "'," + reporting_to + "," + company_id + " ) ";                
                connection.query(sql, function(err, rows) {
                    if (err) {

                        console.log("Error inserting : %s ", err);
                        res.status(404).json({
                            "message": 0,
                            "error": err,
                            "sql": sql
                        });
                    } 
                    else 
                    {
                        var content = '';
                        var text = fs.readFileSync('./public/templates/account_creation.txt', "utf8");
            			content = ((text.replace("[user]", input.name)).replace("[email]", input.email)).replace("[password]", input.password);

                        var mailOptions = {
                            from: mailfrom, // sender address
                            to: 'akhilesh.shete@akshayit.com', // list of receivers
                            subject: 'PPR Account Creation', // Subject line
                            html: content //, // plaintext body
                        };

                        transporter.sendMail(mailOptions, function(error, info) {
                            if (error) {
                                console.log('Error sending account creation mail'+error)
                            } else {
                                console.log('Email Sent Successfully');
                            };
                        });

                        res.json({
                            "message": 1,
                            data: input
                        });
                    }

                });
            }
        });
    }
};
//module.exports =