#include <stdio.h>

int main()
{
	int a = 2, b = 8, c = 5, result;
	result = (a > b) ? (a > c) ? a : c : (b > c) ? b : c;
	printf("%d", result);
	return 0;
}
