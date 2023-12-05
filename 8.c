#include <stddef.h>
#include <stdio.h>

int main() {
    char buffer[255];
    FILE* f = fopen("./input-4.txt", "r");
    int l = 0;
    const int lines = 203, a = 10, b = 25, 
        start = 10, start2 = start + 3*a + 2;
    long int counts[203];
    for (int i=0; i<lines; i++) counts[i] = 1;

    while (fgets(buffer, 255, f) != NULL) {
        int m = 0;
        for (int i=0; i<a; i++) {
            for (int j=0; j<b; j++) {
                if (buffer[start+3*i]==buffer[start2+3*j] &&
                        buffer[start+3*i+1]==buffer[start2+3*j+1]) m++; }}
        if (l == lines) break;
        for (int i=l+1; i<(lines < l+m+1 ? lines : l+m+1); i++)
            counts[i] += counts[l];
        l++;
    }

    long int n=0;
    for (int i=0; i<lines; i++) n += counts[i];
    printf("%d\n", n);
    fclose(f);
}
