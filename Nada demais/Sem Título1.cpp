#include <iostream>
#include <locale>
#include <stdlib.h>
#include <windows.h>
#include <string.h>

using namespace std;

int main(){
	setlocale(LC_ALL, "portuguese");
	char ia;
	cout<<"O hugo é lindo?\n";
	cin>>ia;
	switch(ia){
		case 'sim': case'sim':  case'SiM': case'Sim': case'sIm': case'SIm': case'S': case'SS': case'sIM':case'siM':case 's': case 'ss':
		cout<<"R: Errado. Ele n é lindo.\n\n \n";
		break;
		
		case 'não': case 'nao': case'NÃO': case'Não': case'NÃo': case'nÃo': case'nÃO': case'nãO': case'NAO': case'Nao': case'NAo': case'nAo': case'nAO': case'naO':case 'nn': case'Nn': case'nN': case'N': case 'n':
		cout<<"R: Burro, ele é lindo sim\n\n \n";
		break;
		
		default:
		cout<<"Só pode responder sim ou nao besta\n\n \n";
		break;
	
	}
	system("pause");
	return 0;
}
