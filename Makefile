
all: 

  
t1:
	ghc --make t1.hs


ls: ls.hs
	ghc --make ls.hs

echo: echo.hs
	ghc --make echo.hs

c_echo: c_echo.c
	cc -o c_echo c_echo.c

cpp_echo: cpp_echo.cpp
	g++ -o cpp_echo cpp_echo.cpp



clean:
	rm -f c-run cpp-run go-run io0 io0.hi io0.o io1 io1.hi io1.o t1 t1.hi t1.o a.out cpp_echo c_echo io0_c io0_cpp io1_c io1_cpp io3 io2 io2_c io2_cpp io3_cpp io3_c

test1: io0.test1

pages: p0.html p1.html p2.html p3.html


p0.html: p0.m4.html
	m4 -P p0.m4.html >p0.html



# #############################################################################################################################
 
io0: io0.hs
	ghc --make io0.hs

io0_c: io0.c
	cc -o io0_c io0.c

io0_cpp: io0.cpp
	g++ -o io0_cpp io0.cpp


io0.test1: io0 io0_c io0_cpp
	mkdir -p ./tmp
	./io0 >tmp/hs.out
	diff tmp/hs.out ref/io0.ref
	./io0_c >tmp/c.out
	diff tmp/c.out ref/io0.ref
	./io0_cpp >tmp/cpp.out
	diff tmp/cpp.out ref/io0.ref
	python3 io0.py >tmp/py.out
	diff tmp/py.out ref/io0.ref
	node io0.js >tmp/js.out
	diff tmp/js.out ref/io0.ref
	go run io0.go >tmp/go.out
	diff tmp/go.out ref/io0.ref


p1.html: p1.m4.html Makefile io0.hs io0.py io0.c io0.cpp io0.js io0.go fixHtml.sh
	mkdir -p ./tmp
	fix0.sh < io0.hs  | cat -n | fixHtml.sh >tmp/io0.hs.txt
	fix0.sh < io0.py  | cat -n | fixHtml.sh >tmp/io0.py.txt
	fix0.sh < io0.c   | cat -n | fixHtml.sh >tmp/io0.c.txt
	fix0.sh < io0.cpp | cat -n | fixHtml.sh >tmp/io0.cpp.txt
	fix0.sh < io0.js  | cat -n | fixHtml.sh >tmp/io0.js.txt
	fix0.sh < io0.go  | cat -n | fixHtml.sh >tmp/io0.go.txt
	m4 -P p1.m4.html >p1.html


# #############################################################################################################################

io1: io1.hs
	ghc --make io1.hs

io1_c: io1.c
	cc -o io1_c io1.c

io1_cpp: io1.cpp
	g++ -o io1_cpp io1.cpp

# NOTE: ndoe.js produces diffent output by echoing its input to the output file!
io1.test1: io1 io1_c io1_cpp
	mkdir -p ./tmp
	./io1 <ref/io1.in >tmp/hs.out
	diff tmp/hs.out ref/io1.ref
	./io1_c <ref/io1.in >tmp/c.out
	diff tmp/c.out ref/io1.ref
	./io1_cpp <ref/io1.in >tmp/cpp.out
	diff tmp/cpp.out ref/io1.ref
	python3 io1.py <ref/io1.in >tmp/py.out
	diff tmp/py.out ref/io1.ref
	node io1.js <ref/io1.in >tmp/js.out
	diff tmp/js.out ref/io1-a.ref
	go run io1.go <ref/io1.in >tmp/go.out
	diff tmp/go.out ref/io1.ref


p2.html: p2.m4.html Makefile io1.hs io1.py io1.c io1.cpp fixHtml.sh io1.js io1.go 
	mkdir -p ./tmp
	fix0.sh < io1.hs  | cat -n | fixHtml.sh >tmp/io1.hs.txt
	fix0.sh < io1.py  | cat -n | fixHtml.sh >tmp/io1.py.txt
	fix0.sh < io1.c   | cat -n | fixHtml.sh >tmp/io1.c.txt
	fix0.sh < io1.cpp | cat -n | fixHtml.sh >tmp/io1.cpp.txt
	fix0.sh < io1.js  | cat -n | fixHtml.sh >tmp/io1.js.txt
	fix0.sh < io1.go  | cat -n | fixHtml.sh >tmp/io1.go.txt
	m4 -P p2.m4.html >p2.html
 
 


# #############################################################################################################################

io2: io2.hs
	ghc --make io2.hs

io2_c: io2.c
	cc -o io2_c io2.c

io2_cpp: io2.cpp
	g++ -o io2_cpp io2.cpp

io2.test1: io2 io2_c io2_cpp
	mkdir -p ./tmp
	./io2 aa bb ccc >tmp/hs.out
	diff -w tmp/hs.out ref/io2.ref
	./io2_c aa bb ccc >tmp/c.out
	diff -w tmp/c.out ref/io2.ref
	./io2_cpp aa bb ccc >tmp/cpp.out
	diff -w tmp/cpp.out ref/io2.ref
	python3 io2.py aa bb ccc >tmp/py.out
	diff -w tmp/py.out ref/io2.ref
	node io2.js aa bb ccc >tmp/js.out
	diff -w tmp/js.out ref/io2.ref
	go run io2.go aa bb ccc >tmp/go.out
	diff -w tmp/go.out ref/io2.ref


p3.html: p3.m4.html Makefile io2.hs io2.py io2.c io2.cpp fixHtml.sh io2.js io2.go 
	mkdir -p ./tmp
	fix0.sh < io2.hs  | cat -n | fixHtml.sh >tmp/io2.hs.txt
	fix0.sh < io2.py  | cat -n | fixHtml.sh >tmp/io2.py.txt
	fix0.sh < io2.c   | cat -n | fixHtml.sh >tmp/io2.c.txt
	fix0.sh < io2.cpp | cat -n | fixHtml.sh >tmp/io2.cpp.txt
	fix0.sh < io2.js  | cat -n | fixHtml.sh >tmp/io2.js.txt
	fix0.sh < io2.go  | cat -n | fixHtml.sh >tmp/io2.go.txt
	m4 -P p3.m4.html >p3.html
 
 


# #############################################################################################################################

io3: io3.hs
	ghc --make io3.hs

io3_c: io3.c
	cc -o io3_c io3.c

io3_cpp: io3.cpp
	g++ -o io3_cpp io3.cpp

# TODO: sort in C
# TODO: sort in C++
io3.test1: io3 io3_c io3_cpp
	mkdir -p ./tmp
	ls -1 >ref/io3.ref
	./io3 >tmp/hs.out
	diff -w tmp/hs.out ref/io3.ref
	./io3_c >tmp/c.out
	-diff -w tmp/c.out ref/io3.ref
	./io3_cpp >tmp/cpp.out
	-diff -w tmp/cpp.out ref/io3.ref
	python3 io3.py >tmp/py.out
	diff -w tmp/py.out ref/io3.ref
	node io3.js >tmp/js.out
	diff -w tmp/js.out ref/io3.ref
	go run io3.go >tmp/go.out
	diff -w tmp/go.out ref/io3.ref

# test with a path
io3.test2: io3 io3_c io3_cpp
	mkdir -p ./tmp
	ls -1 ./ref >ref/io3.ref
	ls -1 ./tmp >>ref/io3.ref
	./io3 ./ref ./tmp >tmp/hs.out
	diff -w tmp/hs.out ref/io3.ref
	./io3_c ./ref ./tmp >tmp/c.out
	-diff -w tmp/c.out ref/io3.ref
	./io3_cpp ./ref ./tmp >tmp/cpp.out
	-diff -w tmp/cpp.out ref/io3.ref
	python3 io3.py ./ref ./tmp >tmp/py.out
	diff -w tmp/py.out ref/io3.ref
	node io3.js ./ref ./tmp >tmp/js.out
	diff -w tmp/js.out ref/io3.ref
	go run io3.go ./ref ./tmp >tmp/go.out
	diff -w tmp/go.out ref/io3.ref


p4.html: p4.m4.html Makefile io3.hs io3.py io3.c io3.cpp fixHtml.sh io3.js io3.go 
	mkdir -p ./tmp
	fix0.sh < io3.hs  | cat -n | fixHtml.sh >tmp/io3.hs.txt
	fix0.sh < io3.py  | cat -n | fixHtml.sh >tmp/io3.py.txt
	fix0.sh < io3.c   | cat -n | fixHtml.sh >tmp/io3.c.txt
	fix0.sh < io3.cpp | cat -n | fixHtml.sh >tmp/io3.cpp.txt
	fix0.sh < io3.js  | cat -n | fixHtml.sh >tmp/io3.js.txt
	fix0.sh < io3.go  | cat -n | fixHtml.sh >tmp/io3.go.txt
	m4 -P p4.m4.html >p4.html
 
 
