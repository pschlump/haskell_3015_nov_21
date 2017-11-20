#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <dirent.h>

// https://stackoverflow.com/questions/18292619/c-string-array-sorting

void ls ( char *dir ) {
	struct dirent *ep;		 
	DIR *dp;

	dp = opendir (dir);
	if (dp == NULL) { 
		fprintf ( stderr, "Couldn't open the directory %s\n", dir );
        exit(1);
    }

    while ((ep = readdir (dp)) != NULL) {
        printf ( "%s\n", ep->d_name );
    }
    (void) closedir (dp);
}

int main (int argc, char *argv[]) {

    if ( argc <= 1 ) {
        ls ( "." );
    } else {
        for ( int i = 1; i < argc; i++ ) {
            ls ( argv[i] );
        }
    }
	return 0;

}
