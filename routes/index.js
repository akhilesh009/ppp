var express  = require('express');
var router   = express.Router();
var Register = require("../routes/Register");
var Login    = require("../routes/Login");
var Account  = require("../routes/Account");
var Forgetpwd = require("../routes/Forgetpwd");
var multer  = require('multer')
var upload = multer({ dest: 'uploads/' })
/**
 * Define custom routes for application
 */
router.get('/', function(req, res, next) {
	res.redirect('/login');
});

router.get('/login',Login.getLogin);
router.post('/login',Login.setLogin);

router.get('/admin',Register.getAdmin);
router.post('/admin', upload.single('uploadimage'),Register.setAdmin);

router.get('/updateuser',Register.getUpdateuser);
router.post('/updateuser',Register.setUpdateuser);

router.get('/company',Register.getCompany);
router.post('/company',Register.setCompany);

router.get('/company/id/:companyid',Register.getChangeCompany);
router.post('/changecompany',Register.setChangeCompany);

router.get('/forgetpwd',Forgetpwd.getForgetpwd);
router.post('/forgetpwd',Forgetpwd.setForgetpwd);

router.get('/changepwd',Forgetpwd.getChangepwd);
router.post('/changepwd',Forgetpwd.setChangepwd);

router.get('/resource',Register.getResource);
router.post('/resource',Register.setResource);
router.get('/resource/email/:emailid',Register.getResourceDetail);

router.get('/account',Account.getCreateResourceAccount);
router.post('/account',Account.setCreateResourceAccount);

router.get('/assignproject',Register.getAssignproject);
router.post('/assignproject',Register.setAssignproject);

module.exports = router;
