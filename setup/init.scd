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


	if( j, {

		MandelHub.join( "furenku",
			action: {
				m = MandelHub.instance
			}
		);

	},{

		m = MandelHub.start("furenku");

	});



m.gui;


m.tools.genres.choose().postln;



});

)

