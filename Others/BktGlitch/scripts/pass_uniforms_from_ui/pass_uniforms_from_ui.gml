function pass_uniforms_from_ui() {
	for (var i = 0; i < array_length_1d(attr); i++){
	    script_execute(uniformSetter[i], attr[i]);
	}


}
