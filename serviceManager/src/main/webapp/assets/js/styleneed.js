function display() {
	  var insertForm = document.getElementById('insertForm');
	  var table = document.getElementById('table');
	  if (insertForm.style.display === 'none') {
	    insertForm.style.display = 'block';
	    table.style.display = 'none';
	  } else {
	    insertForm.style.display = 'none';
	    table.style.display = 'block';
	  }
	} 