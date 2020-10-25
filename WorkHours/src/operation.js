const Promise = require('promise');

function insertEvents(calendar, events)
{
	var promises = [  ];

	for(event of events)
	{
		let start = new Date();
		let end = new Date();

		start.setHours(event.start.hour, event.start.minute ? event.start.minute : 0, 0);
		end.setHours(event.end.hour, event.end.minute ? event.end.minute : 0, 0);

		let eventObj = {
		  summary: event.activity,
		  start: {
			dateTime: start.toISOString(),
			timeZone: process.env.TIMEZONE,
		  },
		  end: {
			dateTime: end.toISOString(),
			timeZone: process.env.TIMEZONE,
		  },
		};

		promises.push(new Promise(
			function(resolve, reject)
			{
				var data = {
					calendarId: process.env.CALENDAR_ID,
					resource: eventObj,
				};

				calendar.events.insert(data, function(err, event) {
					if (err) {
						console.log('There was an error contacting the Calendar service: ' + err);
						return;
					}
					console.log('Event created');
				});
			}
		));
	}

	Promise.all(promises).then(function() { console.log("All Done!!!"); }).catch(console.log);
}

module.exports.insertEvents = insertEvents;
