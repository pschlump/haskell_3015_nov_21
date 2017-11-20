#include <stdio.h>
#include <string.h>

int main ( void ) {
    char buf[1024];
    int len;

    printf ( "Some Input Please? " );
    fgets ( buf, 1024, stdin );
    len = strlen(buf);
    if ( len > 0 && len < 1024 ) {
        buf[ len - 1 ] = '\0';      // trim off newline
    }
    printf ( "Echo of ->%s<-\n", buf );
}
