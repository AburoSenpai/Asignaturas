#include <iostream>
#include <string.h>

using namespace std;
void funcion();
void funcion(){
    char *ptabla=NULL ,tabla [4][20],palabra[20];
    for (int i=0;i<4;i++){
        cout << "Escribe una palabra en la posicion "<<i+1<<": ";
        cin >> palabra;
        strcpy (tabla[i],palabra);
    }
    ptabla=&tabla[0][0];
    cout << "\nEsto es: "<<ptabla << endl;
    ptabla++;
    cout << "Esto es: "<<*ptabla << endl;
    ptabla++;
    cout << "Esto es: "<<*ptabla << endl;
    ptabla++;
    cout << "Esto es: "<<*ptabla << endl;

};
int main()
{
    funcion();
    return 0;
}
