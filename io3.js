const fs = require('fs');

function ls ( testFolder ) {
    fs.readdir(testFolder, (err, files) => {
        files.sort();
        files.forEach(file => {
            if ( file.substring(0,1) != '.' ) {
                console.log(file);
            }
        });
    });
}

if ( process.argv.length > 2 ) {
    for ( var i = 2; i < process.argv.length; i++ ) {
        ls ( process.argv[i] );
    }
} else {
    ls ( "." );
}
