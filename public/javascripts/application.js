// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function toggleActive(click) {

	resetAllAnchorsToInactive()
	a = click.element();

	if (a.hasClassName('active')) {
		a.removeClassName('active');
	} else {
		a.addClassName('active');
	}
}

function resetAllAnchorsToInactive() {
	anchors = $$('.article_list a');
	anchors.each( function(a) {
		if( a.hasClassName('active')) {
			a.removeClassName('active');
		}
	})
}

function bindAllAnchorsToToggleActiveOnClick() {
	anchors = $$('.article_list a');
	anchors.each( function(a) {
		a.observe('click', toggleActive)
	});
}
function addTargetToLink(class_array) {
	$A(class_array).each( function(class) {
		$$(class + ' a').each(function(e) {
			e.writeAttribute('target','_blank');
		});
	});
}

Event.observe(window, 'load', function() {
	bindAllAnchorsToToggleActiveOnClick();

})
