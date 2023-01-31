
/*Validate Form Login User*/
function formLoginValidate() {
	var email = document.getElementById("email").value;
	var errEmail = document.getElementById("errEmail");
	var regx = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
	if (email == null || email == "") {
		errEmail.innerHTML = "Email not empty";
	} else if (!email.match(regx)) {
		errEmail.innerHTML = "Email Invalid VD: abc@gmail.com";
	} else {
		errEmail.innerHTML = "";
	}


	var password = document.getElementById("password").value;
	var errPassword = document.getElementById("errPassword");
	if (password == null || password == "") {
		errPassword.innerHTML = "Password not empty";
	} else {
		errPassword.innerHTML = "";
	}
	if (errEmail.innerHTML == "" && errPassword.innerHTML == "") {
		return true;
	}
	return false;
}

/*Validate Form Register User*/
function formRegisterValidate() {
	var email = document.getElementById("email").value;
	var errEmail = document.getElementById("errEmail");
	var regEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
	if (email == null || email == "") {
		errEmail.innerHTML = "Email not empty";
	} else if (!email.match(regEmail)) {
		errEmail.innerHTML = "Email Invalid VD: abc@gmail.com";
	} else {
		errEmail.innerHTML = "";
	}


	var password = document.getElementById("password").value;
	var errPassword = document.getElementById("errPassword");
	var regPasword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/; //Password it nhất 6 ký tự, có ít nhất 1 số hoặc 1 chữ
	if (password == null || password == "") {
		errPassword.innerHTML = "Password not empty";
	} else if (!password.match(regPasword)) {
		errPassword.innerHTML = "Password must be at least 6 characters, with at least 1 number or 1 letter:VD:123abc";
	} else {
		errPassword.innerHTML = "";
	}

	var conPassword = document.getElementById("conPassword").value;
	var errConPassword = document.getElementById("errConPassword");
	if (conPassword != password) {
		errConPassword.innerHTML = "Password is not the same";
	} else {
		errConPassword.innerHTML = "";
	}


	var currentDate = new Date();
	var birthday = document.getElementById("birthday").value;
	var birthday1 = new Date(birthday);
	var errBirthday = document.getElementById("errBirthday");
	if (birthday == null || birthday == "") {
		errBirthday.innerHTML = "Birthday not empty";
	} else if (birthday1 > currentDate) {
		errBirthday.innerHTML = "Birthday can't pass the current date ";
	}
	else {
		errBirthday.innerHTML = "";
	}

	var fullname = document.getElementById("fullname").value;
	var errFullName = document.getElementById("errFullName");
	if (fullname == null || fullname == "") {
		errFullName.innerHTML = "FullName not empty";
	} else {
		errFullName.innerHTML = "";
	}

	var phone = document.getElementById("phone").value;
	var errPhone = document.getElementById("errPhone");
	var regPhone = /0\d{9}/;
	if (phone == null || phone == "") {
		errPhone.innerHTML = "Phone not empty";
	} else if (!phone.match(regPhone)) {
		errPhone.innerHTML = "Phone Invalid";
	} else {
		errPhone.innerHTML = "";
	}

	var address = document.getElementById("address").value;
	var errAddress = document.getElementById("errAddress");
	if (address == null || address == "") {
		errAddress.innerHTML = "Address not empty";
	} else {
		errAddress.innerHTML = "";
	}

	if (errEmail.innerHTML == "" && errPassword.innerHTML == "" && errConPassword.innerHTML == "" && errBirthday.innerHTML == ""
		&& errFullName.innerHTML == "" && errPhone.innerHTML == "" && errAddress.innerHTML == "") {
		return true;
	}

	return false;

}


/*Validate Form Information Delivery */
function formCheckoutValidate() {
	var fullname = document.getElementById("fullname").value;
	var errFullName = document.getElementById("errFullName");
	if (fullname == null || fullname == "") {
		errFullName.innerHTML = "FullName not empty";
	} else {
		errFullName.innerHTML = "";
	}

	var phone = document.getElementById("phone").value;
	var errPhone = document.getElementById("errPhone");
	var regPhone = /0\d{9}/;
	if (phone == null || phone == "") {
		errPhone.innerHTML = "Phone not empty";
	} else if (!phone.match(regPhone)) {
		errPhone.innerHTML = "Phone Invalid";
	} else {
		errPhone.innerHTML = "";
	}

	var address = document.getElementById("address").value;
	var errAddress = document.getElementById("errAddress");
	if (address == null || address == "") {
		errAddress.innerHTML = "Address not empty";
	} else {
		errAddress.innerHTML = "";
	}

	var arr = document.getElementsByName('quantity');
	var a = new Array();
	for (var i = 0; i < arr.length; i++) {
		if (arr[i].value)
			a[i] = arr[i].value;
	}

	var arr2 = document.getElementsByName('inventory');
	var b = new Array();
	for (var i = 0; i < arr2.length; i++) {
		if (arr2[i].value)
			b[i] = arr2[i].value;
	}

	var arr3 = document.getElementsByName('bookId');
	var c = new Array();
	for (var i = 0; i < arr3.length; i++) {
		if (arr3[i].value)
			c[i] = arr3[i].value;
	}

	var count = 0;
	for (var i = 0; i < arr.length; i++) {
		if (parseInt(a[i]) > parseInt(b[i])) {
			$('#errInventory' + c[i]).text("Exceeding inventory " + a[i] + " → " + b[i]);
		} else {
			count = count + 1;
		}
	}

	if (errFullName.innerHTML == "" && errPhone.innerHTML == "" && errAddress.innerHTML == "" && count == a.length) {
		return true;
	}

	return false;
}

