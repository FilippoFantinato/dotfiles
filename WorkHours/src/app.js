const calendar 	= require('./calendar.js');
const operation = require('./operation.js');

const week 		= require('../week.json');

require('dotenv').config();

var today = process.argv[2] ? process.argv[2] : new Date().getDay();
var events = week[today];

if(events)
{
	calendar()
	.then(
		function(calendar)
		{
			operation.insertEvents(calendar, events);
		}
	)
	.catch(console.err);
}
