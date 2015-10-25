"load test synths".postln;


// sintes:

~x = {|freq_1|
	(
		RLPF.ar(
			WhiteNoise.ar,
			freq_1,
			0.01 ) * 5

	! 1

	).tanh / 6

};

~y = {|freq_2| LFPulse.ar( freq_2 ) * 0.2};






// arreglo de sintes
z = [~x,~y];
// arreglo de params:

k=[\freq_1, \freq_2];
