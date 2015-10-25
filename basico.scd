// configuracion de red:

(
r = ();

NetAddr.broadcastFlag = true;

r.addrs = (0..1).collect{|x|
	NetAddr("255.255.255.255", 57120 + x );
};
r.sendAll = {|r ... args|
	r.addrs.do {| addr |
		addr.sendMsg( * args );
	}; "sended";
}
);


MandelHub.join( "furenku",
	action: {
		m = MandelHub.instance
	}
);

m.gui;
m.takeLead;
m.timer.reset;
m.changeTempo(126/60,1);

m.clear;
m.tools.metro
m.tools.stopMetro

m.gui
m.tools








// inicializar proxyspace:

p = ProxySpace.push(s);

// sintes:

~x = {|freq_1| ( RLPF.ar( WhiteNoise.ar, freq_1 , 0.01 ) * 5 ).tanh / 3 };

~y = {|freq_2| LFPulse.ar( freq_2 ) * 0.2};




// interfaz:
x[\freq_1]=80;
x[\freq_2]=500;


x[k[0]]=80;
x[k[1]]=500;


(


// inicialización:

// arreglo de sintes
z = [~x,~y];
// arreglo de params:

k=[\freq_1, \freq_2];

z.collect{ |np| np.play; };

var init = {

	k.collect{|key,i|
		key.asSymbol.postln;

		x[key].addDependant(
			{|o,w,v|
				v.postln;
				"hola?".postln;
				z[i].set( key.asSymbol, v.value );
			}
		);

	};

};


init.value();

)