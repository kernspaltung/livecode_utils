
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
