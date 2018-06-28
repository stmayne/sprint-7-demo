createResponse(qs("id"));

function qs(search_for) {
		var query = window.location.search.substring(1);
		var parms = query.split('&');
		for (var i=0; i<parms.length; i++) {
			var pos = parms[i].indexOf('=');
			if (pos > 0  && search_for == parms[i].substring(0,pos)) {
				return parms[i].substring(pos+1);;
			}
		}
		return "";
	}

function createResponse(id) {
	currentDataString = data.data[id-1];
	response = {"id":currentDataString[0], 
				"last_name":currentDataString[9],
				"first_name":currentDataString[10],
				"department":currentDataString[8],
				"role":currentDataString[11],
				"salary":currentDataString[12]};
	document.write(JSON.stringify(response));
	return response;
}