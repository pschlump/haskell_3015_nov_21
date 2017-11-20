
all: 

recompile: c go cpp hs0 hs1 t1

c:
	cc -o c-run io.c

go:
	go build -o go-run io.go

cpp:
	g++ -o cpp-run io.cpp

hs0:
	ghc --make io0.hs
  
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
	rm -f c-run cpp-run go-run io0 io0.hi io0.o io1 io1.hi io1.o t1 t1.hi t1.o a.out cpp_echo c_echo


 
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

pages: p0.html p1.html

p0.html: p0.m4.html
	m4 -P p0.m4.html >p0.html

p1.html: p1.m4.html Makefile io0.hs io0.py io0.c io0.cpp io0.js io0.go fixHtml.sh
	mkdir -p ./tmp
	fix0.sh < io0.hs  | cat -n | fixHtml.sh >tmp/io0.hs.txt
	fix0.sh < io0.py  | cat -n | fixHtml.sh >tmp/io0.py.txt
	fix0.sh < io0.c   | cat -n | fixHtml.sh >tmp/io0.c.txt
	fix0.sh < io0.cpp | cat -n | fixHtml.sh >tmp/io0.cpp.txt
	fix0.sh < io0.js  | cat -n | fixHtml.sh >tmp/io0.js.txt
	fix0.sh < io0.go  | cat -n | fixHtml.sh >tmp/io0.go.txt
	m4 -P p1.m4.html >p1.html
 
