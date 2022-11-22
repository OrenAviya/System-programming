all: maindrec maindloop loops mains

clean:
	rm -rf *.o
	rm -rf *.so
	rm -rf *.a
	rm maindloop
	rm mains
	rm maindrec
loopd:libclassloops.so

loops:libclassloops.a

recursived:libclassrec.so

recursives:libclassrec.a

mains: main.o libclassrec.a
	gcc main.o ./libclassrec.a -lm -o mains

maindloop: main.o libclassloops.so
	gcc -Wall main.o ./libclassloops.so -lm -o maindloop

maindrec: main.o libclassrec.so
	gcc -Wall main.o ./libclassrec.so -lm -o maindrec

libclassloops.a:advancedClassificationLoop.o basicClassification.o
	ar -rc libclassloops.a advancedClassificationLoop.o basicClassification.o

libclassrec.a:advancedClassificationRecursion.o basicClassification.o
	ar -rc libclassrec.a advancedClassificationRecursionPIC.o basicClassification.o

libclassrec.so:basicClassificationPIC.o advancedClassificationRecursionPIC.o
	gcc -shared -Wall basicClassificationPIC.o advancedClassificationRecursionPIC.o  -o libclassrec.so
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

libclassloops.so:advancedClassificationLoopPIC.o basicClassificationPIC.o
	gcc -shared -Wall advancedClassificationLoopPIC.o basicClassificationPIC.o -o libclassloops.so
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

basicClassification.o:basicClassification.c NumClass.h
	gcc -Wall -c basicClassification.c -o basicClassification.o

advancedClassificationLoop.o:advancedClassificationLoop.c NumClass.h
	gcc -Wall -c advancedClassificationLoop.c -o advancedClassificationLoop.o

advancedClassificationRecursion.o:advancedClassificationRecursion.c NumClass.h
	gcc -Wall -c advancedClassificationRecursion.c -o advancedClassificationRecursion.o

basicClassificationPIC.o:basicClassification.c NumClass.h
	gcc -c -Wall -Werror -fpic basicClassification.c -o basicClassificationPIC.o

advancedClassificationRecursionPIC.o:advancedClassificationRecursion.c NumClass.h
	gcc -c -Wall -Werror -fpic advancedClassificationRecursion.c -o advancedClassificationRecursionPIC.o

advancedClassificationLoopPIC.o:advancedClassificationLoop.c NumClass.h
	gcc -c -Wall -Werror -fpic advancedClassificationLoop.c -o advancedClassificationLoopPIC.o

main.o: main.c NumClass.h
	gcc -c main.c -o main.o

.PHONEY:all clean loopd loops recursives recursived