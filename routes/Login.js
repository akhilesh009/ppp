var connection = require('../routes/connection.js').localConnect();
module.exports = {
    //Render register user page
    getLogin: function(req, res, next) {
        res.render('login', {
            page_title: "Login"
        });
    },
    /**
     * Register user as Admin
     * @param {[type]}   req  [description]
     * @param {[type]}   res  [description]
     * @param {Function} next [description]
     */
    setLogin: function(req, res, next) {
        var input = JSON.parse(JSON.stringify(req.body));
        var sql = "select count(*) as cnt from ppr_users where email= '" + input.email + "' and password= MD5('" + input.password + "') ";
        connection.query(sql, function(err, rows) {
            if (err) console.log("Error inserting : %s ", err);
            if (rows[0].cnt == 0) {
                res.status(404).json({
                    "success": 0,
                    "message":"Wrong username/password"
                });
            } else {
                var sql_userdetail = "select pu.*,pur.role as rolename from ppr_users pu,ppr_user_roles pur  where email='" + input.email + "' and pur.id=pu.role_id ";
                connection.query(sql_userdetail, function(err_userdetail, rows_userdetail) {
                        res.json({
                            "success": 1,
                            "data": rows_userdetail[0]
                        });
                    })
                    //res.redirect('/admin');		
            }
        });
    }
};
//module.exports =