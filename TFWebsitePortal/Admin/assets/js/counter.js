$( function() {
	
	//Counters
	$('.counter').countUp();

	// changed output patterns
	$( '#timer-outputpattern' ).countdown( {
		outputPattern: '$day Days $hour Hours $minute Miniuts $second Seconds',
		from: 60 * 60 * 24 * 3
	} );
	
});