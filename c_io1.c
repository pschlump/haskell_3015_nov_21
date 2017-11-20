
#include <stdio.h>

int main ( void ) {
    char buf[1024];

    printf ( "Some Input Please? " );
    fgets ( buf, 1024, stdin );
    printf ( "Echo of ->%s<-\n", buf );
}

