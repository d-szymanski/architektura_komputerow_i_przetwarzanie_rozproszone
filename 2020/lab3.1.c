#include <stdio.h>

int main()
{
  int arr1[5] = { 1, 2, 3, 4, 5}, arr2[5] = {5, 6, 7, 8, 9};
  int arr3[5];
  for (int i = 0; i < 5; i++) {
    arr3[i] = arr1[i] + arr2[i];
  }


  int sum = 0;
  for (int i = 0; i < 5; i++) {
    sum += arr3[i];
  }
	printf("%d\n", sum);
	return 0;
}
