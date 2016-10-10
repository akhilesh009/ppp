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
    //Render register user page
    getForgetpwd: function(req, res, next) {
        res.render('forgetpwd', {
            page_title: "Forget Password"
        });
    },
    setForgetpwd: function(req, res, next) {
        var input = JSON.parse(JSON.stringify(req.body));
        sql1 = "select count(*) cnt from ppr_users where email ='" + input.email + "' ";
        connection.query(sql1, function(err1, rows1) {
            if (rows1[0].cnt == 0) {
                res.status(404).json({
                    "message": "Email does not exist"
                });
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
                var random_pwd = Math.random().toString(36).substring(2)
                var sql2 = "update ppr_users set password = MD5('"+random_pwd+"') where email = '" + input.email + "' ";
                connection.query(sql2, function(err2, rows2) {
                    if (err2) {
                		res.status(404).json({
                			"success":0,
		                    "message": "Failed to update password"
		                })        
                    } 
                    else 
                    {
                        var content = '';
                        var text = fs.readFileSync('./public/templates/forgetpwd.txt', "utf8");
                        content = (text.replace("[emailid]", input.email)).replace("[password]", random_pwd);
                        var mailOptions = {
                            from: mailfrom, // sender address
                            to: input.email, // list of receivers
                            subject: 'New password genrated', // Subject line
                            html: content //, // plaintext body
                        };
                        transporter.sendMail(mailOptions, function(error, info) {
                            if (error) {
                                console.log('Error Sending Mail' + error)
                            } else {
                                console.log('Email Sent Successfully');
                            };
                        });

                        res.json({
                            "success" : 1,
                            "new_password" : random_pwd
                        });
                    }
                })
            }
        });
    },
    getChangepwd: function(req, res, next) {
        res.render('changepwd', {
            page_title: "Change Password"
        });
    },
    setChangepwd: function(req, res, next) {

        var input = JSON.parse(JSON.stringify(req.body));
        var userid = input.id;
        var sql1 = "select count(*) cnt from ppr_users where password = MD5('" + input.current_pwd + "') and id=" + userid + " ";
                
        connection.query(sql1, function(err1, rows1) {
            if (rows1[0].cnt > 0) {
                if (input.current_pwd == input.new_pwd) {
                    res.json({
                        "success": 0,
                        "message": "Current and New password are same"
                    })
                } else {
                    var sql2 = "update ppr_users set password= MD5('" + input.new_pwd + "') where id=" + userid + " ";
                    
                    connection.query(sql2, function(err2, rows2) {
                        if (err2) {
                            console.log("Error : %s ", err2);
                            res.status(404).json({
                                "success": 0,
                                "error": err2,
                                "sql": sql2,
                                "message": "Failed to change password"
                            });
                        } else {
                            res.json({
                                "success": 1,
                                "message": "Password changed successfully"
                            });
                        }
                    })
                }
            } else {
                res.json({
                    "success": 0,
                    "message": "Wrong Current Password"
                })
            }
        });
    }
};
//module.exports =