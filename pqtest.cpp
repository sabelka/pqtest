#include <libpq-fe.h>
#include <iostream>
#include <pthread.h>

int main()
{
    int lib_ver = PQlibVersion();
    std::cout << lib_ver << "\n";

    PQregisterThreadLock(nullptr);

    return 0;
}


