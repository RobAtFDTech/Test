
// TEST PROJECT
// test branch

#include <iostream>
#include <fstream>

struct testOutput {
    int a;
    float b;
    std::string d;

};

int main(int argc, char *argv[])
{
    using namespace std;
    testOutput to = {0, 1.234f, ""};

    cout << "Test app start" << endl;
    cout << "==============" << endl;

    ofstream fout("test.log");

    fout << "TEST APP LOG FILE" << endl;
    fout << "=================" << endl;

    for(int i = 0; i < 20; i++) {

        to.a = to.a + 2;
        to.b = to.b + 0.1f;
        to.d = "hello world " + to_string(to.a) ;

        fout << to.a
             << "   "
             << to.b
             << "   "
             << to.d
             << endl;
    }

    fclose(stdout);
    return 0;
}

