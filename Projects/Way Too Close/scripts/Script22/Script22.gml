var arr = [0, 1, 2];


//function __array_length

//#macro each var i = 0; var var a = 
//#macro in	; var val = a[i]; repeat(array_length(a))

#macro each for (var i = 0; i < array_length(
#macro in	); ++i) 

each arr in 
{
	log(arr[i]);
}

		