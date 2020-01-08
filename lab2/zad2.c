#include <stdio.h>

int main()
{
	int n = 5, result = 0, i;
	for(i = 1; i <= n; result += (i++));
	result *= result;
	printf("%d", result);
	return 0;
}
