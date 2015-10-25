
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
	("../"++w++"/synths/*.scd").resolveRelative.pathMatch.collect{|f|
		f.load;
	};

	2.wait;

	"mapHub2Synths".postln;
	"mapHub2Synths.scd".resolveRelative.load;

	2.wait;

	( "load patch :" ++ w ).postln;

	q = ("../"++w++"/"++w++".scd");
	q.resolveRelative.load;

	"Done.".postln;

}}
