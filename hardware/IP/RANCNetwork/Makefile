all: myhdl.vpi

myhdl.vpi:
	cd src/simulations/iverilog && $(MAKE)

clean:
	cd src/simulations/iverilog && $(MAKE) clean

test:
	cd src/simulations/tests && python3 -m unittest -v; rm *.o
