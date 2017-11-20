
#include <stdlib.h>
#include <dirent.h>
#include <iostream>
#include <vector>

void ls ( char *dir ) {
	struct dirent *ep;		 
	DIR *dp;
    std::vector<std::string> names;

	dp = opendir (dir);
	if (dp == NULL) { 
		std::cerr << "Couldn't open the directory " << dir << std::endl;
        exit(1);
    }

    while ((ep = readdir (dp)) != NULL) {
        // std::cout << ep->d_name << std::endl;
        names.push_back(ep->d_name);
    }
    (void) closedir (dp);

    std::sort(names.begin(), names.end());

    for(auto & currentName : names) {
        if ( currentName.substr(0,1) != "." ) {
            std::cout << currentName << std::endl;
        }
    }
    
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
