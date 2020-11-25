/*
	Hey there!

	This is the client file for your theme. If you need to do any client-side work in javascript,
	this is where it needs to go.

	You can listen for page changes by writing something like this:

	  $(window).on('action:ajaxify.end', function(data) {
		var	url = data.url;
		console.log('I am now at: ' + url);
	  });
*/
const bootbox = require('bootbox');

$(document).ready(function() {

	var html = undefined;

	ajaxify.loadTemplate('login', function(template) {
		html = templates.parse(template, {});
		console.log(html);
	});
});

$(window).on("click", ".show-login", function(e) {
	var dialog = bootbox.dialog({
		title: 'Log In',
		message: "hi",
	});
});