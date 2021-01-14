#include <stdio.h>

int main()
{
	int a = 4, b = 8, c = 6, result;
	result = (a > b) ? (a > c) ? a : c : (b > c) ? b : c;
	printf("%d\n", result);
	return 0;
}
