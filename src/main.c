#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>

void help(void) __attribute__ ((noreturn));
void usage(void) __attribute__ ((noreturn));

void
help (void)
{
	printf("Usage: eichorncad [OPTION...]\n\n");
	printf("Options:\n");
	printf("  -h, --help                 print this help test\n");
	exit(EXIT_SUCCESS);
}

void
usage (void)
{
	printf("Usage: eichorncad [-h] [--help]\n");
	exit(EXIT_FAILURE);
}

int
main (int argc, char *argv[])
{
	int opt;

	char *optstr = "h";
	struct option longopts[] = {
		{ "help", no_argument, NULL, 'h' },
		{ NULL, no_argument, NULL, 0 }
	};

	while ((opt = getopt_long(argc, argv, optstr, longopts, NULL)) != -1){
		switch (opt) {
			case 'h':
				help();
			default:
				usage();
		}
	}

	printf ("EichornCAD\n");
	return (EXIT_SUCCESS);
}
