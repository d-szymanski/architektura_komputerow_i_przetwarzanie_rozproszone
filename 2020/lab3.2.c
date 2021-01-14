#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

int main()
{
  int fd = open("imie.out", O_WRONLY|O_CREAT|O_TRUNC,0644);

  printf("Twoje imie: ");

  char imie[80];
  fgets(imie, 10, stdin);

  char line[] = "To jest nowy plik tekstowy stworzony przez: ";
  write(fd, line, strlen(line));

  lseek(fd, 0, SEEK_END);

  write(fd, imie, strlen(imie));
  close(fd);

	return 0;
}
