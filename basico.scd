(

// init server:

s.boot;




s.doWhenBooted({
// configuracion de red:
().play;

r = ();

NetAddr.broadcastFlag = true;

r.addrs = (0..1).collect{|x|
	NetAddr("255.255.255.255", 57120 + x );
};
r.sendAll = {|r ... args|
	r.addrs.do {| addr |
		addr.sendMsg( * args );
	}; "sended";
};


m = MandelHub.start("furenku");


/*

if there's a mandelhub active, join it:

MandelHub.join( "furenku",
	action: {
		m = MandelHub.instance
	}
);
*/

m.gui;



/*
m.takeLead;
m.timer.reset;
m.changeTempo(126/60,1);
m.clear;
m.tools.metro
m.tools.stopMetro
*/

m.tools.genres.choose();



// inicialización:



// asignar mandelspace:

x=m.space;


// inicializar proxyspace:

p = ProxySpace.push(s);

// sintes:

~x = {|freq_1|
	(
		RLPF.ar(
			WhiteNoise.ar,
			freq_1,
			0.01 ) * 5

	).tanh / 3

};

~y = {|freq_2| LFPulse.ar( freq_2 ) * 0.2};






// arreglo de sintes
z = [~x,~y];
// arreglo de params:

k=[\freq_1, \freq_2];

z.collect{ |np| np.play; };

f = {

	k.collect{|key,i|
		x[key].addDependant(
			{|o,w,v|

				(
					"Set synth " ++ i
					++ " variable '"
					++ key ++
					"' to: "
					++ v
				).postln;

				z[i].set(
					key.asSymbol,
					v.value
				);
			}
		);

	};

};


f.value();

});

)




// interfaz:
x[\freq_1]=180;
x[\freq_2]=50;


x[k[0]]=80;
x[k[1]]=100;

