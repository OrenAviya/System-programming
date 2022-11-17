tirgul1: tirgul1.o
	gcc tirgul1.o -o tirgul1
tirgul1.o: tirgul1.c
	gcc tirgul1.c -o tirgul1.o
main.o: main.c
	gcc -c main.c
