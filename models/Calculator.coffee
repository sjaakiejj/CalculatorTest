mongoose = require 'mongoose'

equationHistory = new mongoose.Schema({
			equation: 'String',
			step: 'String',
			operation: 'String',
			stack: 'String'
		  	});

exports.History = mongoose.model("History",equationHistory)
