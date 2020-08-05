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
			user.image = req.file.filename;
			delete user.retypePassword;
			user.password = bcryptjs.hashSync(user.password, 10);
			// User.guardarUno(user)
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
			User.findOne( { 
				where: { 
					email: req.body.email
				}
			})
				.then((user) => {

					delete user.dataValues.password;
					req.session.user = user; // YA ESTÁ EN Session
			
					if (req.body.remember) {
						// Creo la cookie
						res.cookie('email', user.email, { maxAge: 1000 * 60 * 60 * 24 });
					}
			
					return res.redirect('/');
				})
				.catch( e => console.log(e))
			
	
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

		User.findByPk(req.session.user.id)
			.then(user => {
				return res.render('profile', { user });
			})
	},

	edit: function(req, res) {
		
		return res.render('edit')

	},

	update: function(req, res) {

		const errors = validationResult(req);

		if (errors.isEmpty()) {
			User.findByPk(req.session.user.id)
			.then(user => {
				const _body = req.body;

				_body.name = req.body.name;
				_body.email = req.body.email;
				_body.lastname = req.body.lastname;
				_body.username = req.body.username;
				_body.image = req.file ? req.file.filename : user.image;

				return User.update({
					email: _body.email,
					name: _body.name,
					lastname: _body.lastname,
					username: _body.username,
					image: _body.image
				} , 
				{ 
					where: {
						id: req.session.user.id
					}
				}).then(user => {
					
					return res.render('profile');
					
				})
			})
		}


	}		
}
;

module.exports = controller;