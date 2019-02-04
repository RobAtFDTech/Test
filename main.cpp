
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

    if(argc < 2) {
        cerr << "Commandline error" << endl;
        return 1;
    }

    int input = atoi(argv[1]);

    cout << "Test app start, index: " << input << endl;

    ofstream fout("test.log");

    fout << "TEST APP LOG FILE" << endl;
    fout << "=================" << endl;

    for(int i = 0; i < 20; i++) {

        to.a = to.a + input;
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

