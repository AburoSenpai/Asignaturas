#include <iostream>

using namespace std;

int main()
{
    float *pa=NULL,*pb=NULL,*pc=NULL;
    pa=new float;
    pb=new float;
    pc=new float;
    cout << "Escribe por teclado el contenido al que apunta A: ";
    cin >> *pa;
    cout << "Esto es a lo que apunta A: "<<*pa;
    cout << "\nEscribe por teclado el contenido al que apunta B: ";
    cin >> *pb;
    cout << "Esto es a lo que apunta B: "<<*pb;
    *pc=*pa;
    *pa=*pb;
    *pb=*pc;
    cout << "\n\nAhora el contenido de A es el de B: "<< *pa << endl;
    cout << "Ahora el contenido de B es el de A: "<< *pb << endl;
    pc=pa;
    pa=pb;
    pb=pc;
    cout << "\nAhora el puntero de A apunta al contenido al que apuntaba el puntero de B: "<<*pa<< endl;
    cout << "Ahora el puntero de B apunta al contenido al que apuntaba el puntero de A: "<<*pb<< endl;


    return 0;
}
