#include <iostream>

using namespace std;

class Cliente{
    int dni[8];
    char nCliente[8];
    public:
        void tabla();
};
void Cliente::tabla(){
    Cliente **pCliente=new Cliente*[1000];
    cout << "Se han creado 1000 punteros que apuntan a clientes"<< endl;
    for (int i=0;i<1000;i++){
        pCliente[i]=NULL;
    }
    cout << "\nSe han apuntado todos los punteros a NULL"<< endl;
    for (int i=0;i<1000;i++){
        delete pCliente[i];
        }
    cout << "\nSe ha borrado el contenido del vector de punteros"<< endl;
    delete[]pCliente;
    cout << "\nSe borra el vector de punteros"<<endl;
    pCliente=NULL;
    cout << "\nEl puntero que apuntaba al vector de punteros ahora apunta a NULL"<< endl;
}
int main()
{
    //EL EJERCICIO 5 SERIA LO MISMO PERO RELLENANDO LOS PROVEEDORES CON EL PRIMER FOR QUE HACEMOS
    //Y COMO EL EJERCICIO 6 Y 7 ES DESTRUIR LAS TABLAS TAMBIEN SE INCLUYEN EN ESTE EJERCICIO
    Cliente p;
    p.tabla();
    return 0;
}
