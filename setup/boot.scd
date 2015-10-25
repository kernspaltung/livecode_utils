
fork{1.do{

	"init".postln;
	"init.scd".resolveRelative.load;
	2.wait;


	// inicialización:

	// asignar mandelspace:
	"Init  MandelSpace".postln;
	x=m.space;


	// inicializar proxyspace:
	"Init ProxySpace".postln;
	p = ProxySpace.push(s);


	2.wait;


	"load synths".postln;
	"../synths.scd".resolveRelative.load;

	2.wait;

	"mapHub2Synths".postln;
	"mapHub2Synths.scd".resolveRelative.load;

	1.wait;
	"done".postln;

}}
