#include <iostream>
#include <string.h>
using namespace std;

struct cliente {
    char *nombre;
    int edad;
    float *cc;
};

int main()
{
    float numero;
    cliente **cartera=new cliente*[2]; //lo he reducido a 2 para poder comprobar si se guardan bien los datos

    cout << "Se ha creado el puntero que apunta al vector de punteros y este a su vez a una estructura cliente y reservado\n";
    cout << "la memoria para los clientes"<< endl;
    for (int i=0;i<2;i++){
            cartera[i]=new cliente;
            cout << "\nDime la edad del cliente " << i+1<<" : ";
            cin >> cartera[i]->edad;
            cout << "\nDime el nombre del cliente "<<i+1<<" : ";
            cartera[i]->nombre=new char [100];
            cin >>cartera[i]->nombre;
            cartera[i]->cc=new float [5];
            cout << "\n";
            for (int j=0; j<5;j++){
                cout << "Dime el numero de cuenta " <<j+1<< " del cliente "<<i+1<<" : ";
                cin >> numero;
                cartera[i]->cc[j]=numero;
            }
    }
    for (int j=0;j<2;j++){
    cout <<"\nNombre: "<<cartera[j]->nombre<< endl ;//aqui mostrariamos por pantalla los dos clientes del ejemplo
    cout <<"Edad: "<< cartera[j]->edad<<endl<<endl ;
        for (int i=0;i<5;i++){
            cout <<"Numero de cuenta "<<i+1<<" : " << cartera[j]->cc[i]<< endl ;
        }
    }

    for (int i=0;i<2;i++){ //aqui borramos toda la memoria reservada
        delete[]cartera[i]->nombre;
        delete[]cartera[i]->cc;
        delete cartera[i];
    }

    delete[]cartera;
    cout << "\nSe ha borrado la memoria reservada" << endl;


    return 0;
}
