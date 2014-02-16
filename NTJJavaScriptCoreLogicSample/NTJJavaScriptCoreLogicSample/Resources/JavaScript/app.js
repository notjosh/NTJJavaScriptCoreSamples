var Chance = require('chance')

var things = [];

function hunt() {
	var n =  Math.floor(Math.random() * 2) + 5;

	for (var i = 0; i < n; i++) {
		var thing = makeThing();

		// insert at random point of array
		things.splice(Math.floor(Math.random() * things.length), 0, makeThing());
	}
}

function zap() {
    var n =  Math.floor(Math.random() * 2) + 5;

    n = Math.min(things.length, n);

    for (var i = 0; i < n; i++) {
        // remove at random point of array
        things.splice(Math.floor(Math.random() * things.length), 1);
    }
}

function makeThing() {
	// random value generator
	var chance = new Chance(function() { return Math.random(); });

	var thing = Thing.thing();

	thing.title = chance.word({syllables: 3});
	thing.body = chance.sentence();

	return thing;
}
