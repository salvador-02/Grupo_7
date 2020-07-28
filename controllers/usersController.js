const { User } = require('../database/models');
const bcryptjs = require('bcryptjs')
const { validationResult } = require("express-validator");
const fs = require("fs");
const jsonModel = require('../models/jsonModel');
const userModel = jsonModel('users');

const controller = {
	register: (req, res) => {
		return res.render('register')
	},

	login: (req, res) => {

		return res.render('login');
	},

	processRegister: function (req, res) {
		const errors = validationResult(req);
		// console.log(errors);
		if (errors.isEmpty()) {
			let user = req.body;
			// console.log(user)
			user.image = req.file.filename;
			delete user.retypePassword;
			user.password = bcryptjs.hashSync(user.password, 10);
			

			// User.guardarUno(user);

			User.create(user)
				.then( user => {

					return res.redirect('/users/login');
				})
				.catch(err => {
					console.log(err);
				})

			
		} else {
			return res.render("register", { errors: errors.mapped(), old: req.body });
		}
	  },

	store: (req, res) => {
		let user = req.body;
		user.password = bcryptjs.hashSync(user.password, 10);
		delete req.body.retypePassword;
		User.guardarUno(user);
		return res.render('login');
	},

	processLogin: function (req, res) {
    
		const errors = validationResult(req);
	
		if(errors.isEmpty()){

			// LOGUEO AL USUARIO ETC
			let user = userModel.findBySomething(user => user.email == req.body.email);
	
			delete user.password;
	
			req.session.user = user; // YA ESTÁ EN Session
	
		if (req.body.remember) {
			// Creo la cookie
			res.cookie('email', user.email, { maxAge: 1000 * 60 * 60 * 24 });
		}

		return res.redirect('/');
	
		} else {
			
		  // return res.send(errors);
	
			return res.render("login", { errors: errors.mapped(), old: req.body});
		}
	},

	logOut: function(req, res) {
		
		req.session.destroy();

		if (req.cookies.email) {
			res.clearCookie('email');
		}

		return res.redirect('/');
	},

	profile: function(req, res) {
		
		return res.render('profile')
		

	}
	
	
}
;

module.exports = controller;