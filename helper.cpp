/*
*
*   Helper file to extract all the variables to write in the CodeBook.md
*
*/

#include <iostream>
#include <cstdio>
#include <cstring>
#include <string>
#include <cstdlib>
#include <sstream>
#include <fstream>

using namespace std;

int main() {
	freopen("./UCI HAR Dataset/features.txt", "rb", stdin);
	string line;
	cin.ignore();
	int itr = 2;
	while( getline(cin, line) ) {
		istringstream ss(line);
		string feature;
		while (ss >> feature);

		if (feature.find("mean()") != string::npos) {
			cout << ++itr << ". " << feature << endl;
		} else if (feature.find("std()") != string::npos) {
			cout << ++itr << ". " << feature << endl;
		}
	}
	return 0;
}