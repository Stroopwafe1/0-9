#include <stdio.h>

void print0_9() {
    for (int i = 0; i <= 9; i++) {
        printf("%d\n", i);
    }
}

int main(int argc, char** argv) {
    print0_9();
    return 0;
}
