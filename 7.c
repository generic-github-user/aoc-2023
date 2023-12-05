#include <stddef.h>
#include <stdio.h>

int main() {
    char buffer[255];
    FILE* f = fopen("./input-4.txt", "r");
    int n = 0, start = 10, start2 = start + 30 + 2;
    // printf("%d\n", 1 << -1);
    while (fgets(buffer, 255, f) != NULL) {
        int m = 0;
        for (int i=0; i<10; i++) {
            for (int j=0; j<25; j++) {
                if (buffer[start+3*i]==buffer[start2+3*j] &&
                        buffer[start+3*i+1]==buffer[start2+3*j+1]) m++;
            }}
        n += m ? 1 << m-1 : 0;
    }
    printf("%d\n", n);
    fclose(f);
}
