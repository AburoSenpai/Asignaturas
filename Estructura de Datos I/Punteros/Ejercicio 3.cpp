#include <iostream>

using namespace std;

class Cliente{
    int dni[8];
    char nCliente[8];
    public:
        void tabla();
};
void Cliente::tabla(){
    Cliente *pCliente=new Cliente[100];
    cout << "Se ha creado un puntero que apunta a una tabla de 100 clientes"<< endl;
    delete []pCliente;
    cout << "\nSe ha borrado la tabla de Clientes"<< endl;
    pCliente=NULL;
    cout << "\nEl puntero que apuntaba a la tabla de clientes ahora apunta a NULL"<< endl;
}
int main()
{
    Cliente p;
    p.tabla();
    return 0;
}
