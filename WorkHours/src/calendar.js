const fs = require('fs');
const Promise = require('promise');
const readline = require('readline');
const { google } = require('googleapis');

const SCOPES = [
	'https://www.googleapis.com/auth/calendar',
	'https://www.googleapis.com/auth/calendar.events'
];

var TOKEN_PATH;
var CREDENTIALS_PATH;

function init(auth)
{
	TOKEN_PATH 			= (process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE) + '/.credentials/' + process.env.PATH_TOKEN;
	CREDENTIALS_PATH 	= __dirname + '/config/' + process.env.PATH_CREDENTIALS;

	return new Promise(
		function(resolve, reject)
		{
			fs.readFile(CREDENTIALS_PATH, (err, content) => {
			  if (err) return reject('Error loading client secret file: ' + err);

			  authorize(JSON.parse(content)).then(function(auth) { resolve(google.calendar({version: 'v3', auth})); });
			});
		}
	);
}

function authorize(credentials, callback) {
  const {client_secret, client_id, redirect_uris} = credentials.installed;
  const oAuth2Client = new google.auth.OAuth2(
	  client_id, client_secret, redirect_uris[0]);

  return new Promise(
  		function(resolve, reject)
  		{
  			fs.readFile(TOKEN_PATH, (err, token) => {
				if (err) return getAccessToken(oAuth2Client).then(function(auth) { resolve(auth); });
				
				oAuth2Client.setCredentials(JSON.parse(token));

				resolve(oAuth2Client);
			});
  		}
  	);
}

function getAccessToken(oAuth2Client) {
  const authUrl = oAuth2Client.generateAuthUrl({
	access_type: 'offline',
	scope: SCOPES,
  });

  console.log('Authorize this app by visiting this url:', authUrl);

  const rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
  });
  return new Promise(
		function(resolve, reject)
		{
			rl.question('Enter the code from that page here: ', (code) => {
				rl.close();
				
				oAuth2Client.getToken(code, (err, token) => {
					if (err) return reject('Error retrieving access token ' + err);
					
					oAuth2Client.setCredentials(token);

					fs.writeFile(TOKEN_PATH, JSON.stringify(token), (err) => {
						if (err) return console.error(err);
						console.log('Token stored to', TOKEN_PATH);
					});

					resolve(oAuth2Client);
				});
			});
		}
	);
}

module.exports = init;
