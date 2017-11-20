
all: 

  
hs1:
	ghc --make io1.hs
  
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
	rm -f c-run cpp-run go-run io0 io0.hi io0.o io1 io1.hi io1.o t1 t1.hi t1.o a.out cpp_echo c_echo io0_c io0_cpp

test1: io0.test1

pages: p0.html p1.html p2.html


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

io1: io1.hs
	ghc --make io1.hs

io1_c: io1.c
	cc -o io1_c io1.c

io1_cpp: io1.cpp
	g++ -o io1_cpp io1.cpp


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
 
 
