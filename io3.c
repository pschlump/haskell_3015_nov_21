#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <dirent.h>

char *strdup (const char *s) {
	char *d = malloc (strlen (s) + 1);   // Space for length plus nul
	if (d == NULL) return NULL;		  // No memory
	strcpy (d,s);						// Copy the characters
	return d;							// Return the new string
}

int cmpStr (const void * a, const void * b)
{
	return strcmp (*(const char **) a, *(const char **) b);
}

void ls ( char *dir ) {
	struct dirent *ep;		 
	DIR *dp;
	int nitems = 0;
	int max = 250;
	char **list = (char **)malloc ( max * sizeof ( char * ) );

	dp = opendir (dir);
	if (dp == NULL) { 
		fprintf ( stderr, "Couldn't open the directory %s\n", dir );
		exit(1);
	}

	while ((ep = readdir (dp)) != NULL) {
		if ( ep->d_name[0] != '.' ) {
            if ( max <= nitems ) {
                max += 250;
                list = (char **)realloc ( list, max * sizeof ( char * ) );
            }
			list[nitems] = strdup ( ep->d_name );
            nitems++;
		}
	}
	(void) closedir (dp);

    qsort(list, nitems, sizeof(char *), cmpStr);

	for ( int i = 0; i < nitems; i++ ) {
		printf ( "%s\n", list[i] );
	}

	for ( int i = 0; i < nitems; i++ ) {
		(void) free ( list[i] );
	}
    (void) free ( list );
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
