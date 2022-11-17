all: maindrec maindloop loops mains

clean:
	rm -rf *.o
	rm -rf *.so

mains: main.c recursives
	gcc main.c -L. -lclassrec -o mains

maindloop: main.c loopd
	gcc -Wall main.c -L. -lclassloops -o maindloop

maindrec: main.c recursived
	gcc -Wall main.c -L. -lclassrec -o maindrec

loops:advancedClassificationLoop.o basicClassification.o
	ar -rc libclassloops.a advancedClassificationLoop.o basicClassification.o

recursives:advancedClassificationRecursion.o basicClassification.o
	ar -rc libclassrec.a advancedClassificationRecursionPIC.o basicClassification.o

recursived:basicClassificationPIC.o advancedClassificationRecursionPIC.o
	gcc -shared -Wall basicClassificationPIC.o advancedClassificationRecursionPIC.o  -o libclassrec.so
	export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

loopd:advancedClassificationLoopPIC.o basicClassificationPIC.o
	gcc -shared -Wall , advancedClassificationLoopPIC.o basicClassificationPIC.o -o libclassloops.so
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
