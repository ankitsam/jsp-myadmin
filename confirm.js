function dTable(url){
	var retcode = true;
	retcode = confirm('Are you sure, you want to delete the table with all the data?');
	
	if (retcode)
	    window.location.href = url;
}

function dData(url){
	var retcode = true;
	retcode = confirm('Are you sure, you want to delete all the data in table?');

	if (retcode)
	    window.location.href = url;
}

function dRecord(url){
	var retcode = true;
	retcode = confirm('Are you sure, you want to delete the record?');

	if (retcode)
	    window.location.href = url;
}

function dDatabase(url){
	var retcode = true;
	retcode = confirm('Are you sure, you want to delete the database?');

	if (retcode)
	   window.location.href = url;
}
