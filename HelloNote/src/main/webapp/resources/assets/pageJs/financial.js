
function add_row() {
	var my_tbody = document.getElementById('my_tbody');
	// var row = my_tbody.insertRow(0); // 상단에 추가
	var row = my_tbody.insertRow(my_tbody.rows.length);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	var cell4 = row.insertCell(3);
	var cell5 = row.insertCell(4);

	cell2.innerHTML = document.getElementById('date').value;
	cell3.innerHTML = document.getElementById('Transaction').value;
	cell4.innerHTML = document.getElementById('amount').value;

}

// function delete_row() {
// var my_tbody = document.getElementById('my_tbody');
// if (my_tbody.rows.length < 1) return;
// // my_tbody.deleteRow(0); // 상단부터 삭제
// my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
// }

