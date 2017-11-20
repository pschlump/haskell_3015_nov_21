var readline = require('readline');

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: true
});

process.stdout.write ( "Some Input Please? " );
rl.on('line', function (line) {
	console.log ( "Echo	of ->" + line + "<-" );
	process.exit();
});
