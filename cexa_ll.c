#include <stdio.h>


int fun(const int* x)
{
	return *x+1;
}
int main()
{
	int t=4;
	fun(&t);
	return 0;
}
