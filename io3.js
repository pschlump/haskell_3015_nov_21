const testFolder = '.';
const fs = require('fs');

fs.readdir(testFolder, (err, files) => {
    files.sort();
	files.forEach(file => {
        if ( file.substring(0,1) != '.' ) {
            console.log(file);
        }
	});
})
