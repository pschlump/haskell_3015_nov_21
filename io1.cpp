#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main ( void ) {
    string buf;
    cout << "Some Input Please? " ;
    getline(std::cin, buf);
    cout << "Echo of ->" << buf << "<-" << std::endl;
}
