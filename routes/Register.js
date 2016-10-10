var connection = require('../routes/connection.js').localConnect();
var fs = require('fs');
module.exports = {
    //Render register user page
    getAdmin: function(req, res, next) {

        var sql1="select * from projects";
        connection.query(sql1,function(err1,rows1){
            fs.writeFile("./routes/test.sql", JSON.stringify(rows1), function(err) {
                if(err) {
                    return console.log(err);
                }
                console.log("SQL File Saved");
                res.sendFile(__dirname + '/test.sql');
            });                         
        });

        /*var sql1="select * from projects";
        connection.query(sql1,function(err1,rows1) {
            var content = fs.readFileSync('./routes/test.html', "utf8");        
            console.log("innn")
            res.sendFile(__dirname + '/test.html');
        });
        res.render('admin/register', {
            page_title: "Register"
        });*/
    },
    /**
     * Register user as Admin
     * @param {[type]}   req  [description]
     * @param {[type]}   res  [description]
     * @param {Function} next [description]
     */
    setAdmin: function(req, res, next) {
        //console.log(req.file)
        var input = JSON.parse(JSON.stringify(req.body));
        if (req.file != undefined) {
            input.uploaded_filename = req.file.originalname;
        }
        var sql_user_exist = "select count(*) as cnt from ppr_users where email='" + input.email + "' ";
        connection.query(sql_user_exist, function(err_user_exist, rows_user_exist) {
            if (rows_user_exist[0].cnt > 0) {
                res.status(404).json({
                    "message": "Email already exist"
                });
            } else {
                sql = "insert into ppr_users (id,name,contact,email,role_id,password,user_status_id,uploadfile,country,language,isenterprise) " + "values(null,'" + input.name + "','" + input.contact + "','" + input.email + "',(select id from ppr_user_roles where role='Admin'),MD5('" + input.password + "'),(select id from ppr_user_status where status='Active'),'" + input.uploadimage + "','" + input.country + "','" + input.language + "',false) ";
                connection.query(sql, function(err, rows) {
                    if (err) {
                        console.log("Error inserting : %s ", err);
                        res.status(404).json({
                            "success": 0,
                            "error": err,
                            "sql": sql
                        });
                    } else {
                        res.json({
                            "success": 1,
                            "data": input
                        });
                    }
                });
            }
        });
    },
    getCompany: function(req, res, next) {
        res.render('admin/register_company', {
            page_title: "Company Registration"
        });
    },
    setCompany: function(req, res, next) {
        var input = JSON.parse(JSON.stringify(req.body));
        sql_check_exist = "select count(*) cnt from ppr_company where name= '" + input.cname + "' ";
        connection.query(sql_check_exist, function(err_check_exist, rows_check_exist) {
            if (rows_check_exist[0].cnt > 0) {
                res.status(404).json({
                    "message": "Company name already exist"
                });
            } else {
                sql_get_max_id = "SELECT case when max(id) is null then 0 else max(id) end as max_id  from ppr_company";
                connection.query(sql_get_max_id, function(err_get_max_id, rows_get_max_id) {
                    var id_to_insert = rows_get_max_id[0].max_id + 1;
                    var admin_user_id = 3;
                    sql = " insert into ppr_company (id,name,contact_number,address,status) " + " values(" + id_to_insert + ",'" + input.cname + "','" + input.cnumber + "','" + input.address + "','Active')";
                    connection.query(sql, function(err, rows) {
                        if (err) {
                            console.log("Error inserting : %s ", err);
                            res.status(404).json({
                                "success": 0,
                                "error": err,
                                "sql": sql
                            });
                        } else {
                            sql_user_update = "update ppr_users set company_id=" + id_to_insert + " where id=" + admin_user_id + " ";
                            connection.query(sql_user_update, function(err_user_update, rows_user_update) {
                                if (err_user_update) {
                                    console.log('Error updating company id' + err_user_update);
                                } else {
                                    console.log('user updated successfully');
                                }
                            });
                            res.json({
                                "success": 1,
                                "data": input
                            });
                        }
                    });
                });
            }
        });
    },
    getResource: function(req, res, next) {
        res.render('resource/register', {
            page_title: "Resource Registration"
        });
    },
    setResource: function(req, res, next) {
        var input = JSON.parse(JSON.stringify(req.body));
        var sql_check_exist = "select count(*) cnt from user where email='" + input.email + "' ";
        connection.query(sql_check_exist, function(err_check_exist, rows_check_exist) {
            if (err_check_exist) console.log("Error: %s ", err);
            if (rows_check_exist[0].cnt == 0) {
                res.status(404).json({
                    "message": "Enter valid email"
                })
            } else {
                var sql = "update user set password = MD5('" + input.password + "')," + "name = '" + input.name + "'," + "contact = '" + input.contact + "'," + "country = '" + input.country + "'," + "language = '" + input.language + "'," + "company_domain = '" + input.domain + "' where email= '" + input.email + "' ";
                connection.query(sql, function(err, rows) {
                    if (err) console.log("Error : %s ", err);
                    res.json({
                        "message": "Successful"
                    });
                });
            }
        });
    },
    getResourceDetail: function(req, res, next) {
        var email = req.params.emailid;
        var sql = "select name,contact,email from ppr_users where email='" + email + "' ";
        connection.query(sql, function(err, rows) {
            res.json(rows);
        });
    },
    getChangeCompany: function(req, res, next) {
        res.render('admin/change_company', {
            page_title: "Change company details"
        });
        /* var companyid = req.params.companyid;
         var sql1 = "select * from ppr_company where id= "+companyid+" ";
         connection.query(sql1, function(err1,rows1){

             res.render('admin/change_company',{page_title:"Change company details", data:rows1});                    

         });*/
    },
    setChangeCompany: function(req, res, next) {
        var input = JSON.parse(JSON.stringify(req.body));
        var companyid = req.body.companyid;
        var sql1 = "update ppr_company set  name='" + input.cname + "', contact_number=" + input.cnumber + " , address='" + input.address + "' where id=" + companyid + " ";
        connection.query(sql1, function(err1, rows1) {
            if (err1) {
                console.log("Error: %s ", err1);
                res.status(404).json({
                    "success": 0,
                    "error": err1,
                    "sql": sql1,
                    "message": "Failed to update company details"
                });
            } else {
                res.json({
                    "success": 1,
                    "data": input,
                    "message": "Company details changed sucessfully"
                });
            }
        });
    },
    getUpdateuser: function(req, res, next) {
        res.render('user/updateuser', {
            page_title: "Update user"
        });
        /*        var userid = req.params.userid;
                var sql1 = "select name,contact,country,language,uploadfile from ppr_users where id = "+userid+" ";
                connection.query(sql1,function(err1,rows1){

                    if(err1){
                        console.log("Error: %s ", err1);
                        res.status(404).json({
                            "success": 0,
                            "error": err1,
                            "sql": sql1,
                            "message": "Failed to load user details"
                        });

                    } else {
                        res.json({
                            "success": 1,
                            "message":"User details fetched successfully",
                            "data": rows1[0]
                        });   
                    }          
                });*/
    },
    setUpdateuser: function(req, res, next) {
        var userid = req.body.id;
        var input = JSON.parse(JSON.stringify(req.body));
        var sql1 = "update ppr_users set name='" + input.name + "' , contact='" + input.contact + "',country='" + input.country + "',language='" + input.language + "',uploadfile='" + input.uploadimage + "' where id=" + userid + "  ";
        connection.query(sql1, function(err1, rows1) {
            if (err1) {
                console.log("Error: %s ", err1);
                res.status(404).json({
                    "success": 0,
                    "error": err1,
                    "sql": sql1,
                    "message": "Failed to update user"
                });
            } else {
                res.json({
                    "success": 1,
                    "message": "User updated successfully",
                    "data": input
                });
            }
        });
    },
    getAssignproject: function(req, res, next) {
        res.render('user/assignproject', {
            page_title: "Assign Project to User"
        });
    },
    setAssignproject: function(req,res,next) {

        var input = JSON.parse(JSON.stringify(req.body));
        var insertString = '';

        /*for(i=0; i<input.project.length; i++) {

            insertString += "("+input.userid+","+input.project[i]+"),";
        }
        insertString = insertString.substr(0, insertString.length - 1);*/
        //var sql1 = "insert into ppr_user_projects(userid,projectid)  values "+insertString;
        var sql1 = "insert into ppr_user_projects values("+input.userid+","+input.project+")";
        connection.query(sql1,function(err1,rows1){
            if(err1){
                console.log('Error-'+err1);
                res.status(404).json({
                    "success": 0,
                    "error": err1,
                    "sql": sql1,
                    "message": "Failed to assign project to user"
                });
            } else {
                res.json({
                    "success": 1,
                    "message": "Project assigned successfully to user",
                    "data": input
                });
            }                    
        });        
    }
};
//module.exports =