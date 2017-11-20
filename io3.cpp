
#include <stdlib.h>
#include <dirent.h>
#include <iostream>

void ls ( char *dir ) {
	struct dirent *ep;		 
	DIR *dp;

	dp = opendir (dir);
	if (dp == NULL) { 
		std::cerr << "Couldn't open the directory " << dir << std::endl;
        exit(1);
    }

    while ((ep = readdir (dp)) != NULL) {
        std::cout << ep->d_name << std::endl;
    }
    (void) closedir (dp);
}

int main (int argc, char *argv[]) {

    if ( argc <= 1 ) {
        ls ( (char *)"." );
    } else {
        for ( int i = 1; i < argc; i++ ) {
            ls ( argv[i] );
        }
    }
	return 0;

}
