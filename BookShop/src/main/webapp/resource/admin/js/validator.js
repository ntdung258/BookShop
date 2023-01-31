
/* Validate form add product */
function formAddProductValidate() {
	var bookName = document.getElementById("bookName").value;
	var errBookName = document.getElementById("errBookName");
	if (bookName == null || bookName == "") {
		errBookName.innerHTML = "Book Name not empty";
	} else {
		errBookName.innerHTML = "";
	}


	var publisher = document.getElementById("publisher").value;
	var errPublisher = document.getElementById("errPublisher");
	if (publisher == null || publisher == "") {
		errPublisher.innerHTML = "Publisher not empty";
	} else {
		errPublisher.innerHTML = "";
	}

	var price = document.getElementById("price").value;
	var errPrice = document.getElementById("errPrice");
	if (price == null || price == "") {
		errPrice.innerHTML = "Price not empty";
	} else if (price < 0) {
		errPrice.innerHTML = "Price not be better 0";
	} else {
		errPrice.innerHTML = "";
	}

	var quantity = document.getElementById("quantity").value;
	var errQuantity = document.getElementById("errQuantity");
	if (quantity == null || quantity == "") {
		errQuantity.innerHTML = "Quantity not empty";
	} else if (quantity <= 0) {
		errQuantity.innerHTML = "Quantity not be better 0";
	} else {
		errQuantity.innerHTML = "";
	}

	var pages = document.getElementById("pages").value;
	var errPages = document.getElementById("errPages");
	if (pages == null || pages == "") {
		errPages.innerHTML = "Pages not empty";
	} else if (pages <= 0) {
		errPages.innerHTML = "Pages not be better 0";
	} else {
		errPages.innerHTML = "";
	}
	
	var currentDate = new Date();
	var publicationDate = document.getElementById("publicationDate").value;
	var publicationDate1 = new Date(publicationDate);
	var errPublicationDate = document.getElementById("errPublicationDate");
	if (publicationDate == null || publicationDate == "") {
		errPublicationDate.innerHTML = "Publication Date not empty";
	}else if(publicationDate1>currentDate){
		errPublicationDate.innerHTML = "Publication can't pass the current date";
	} else {
		errPublicationDate.innerHTML = "";
	}

	var language = document.getElementById("language").value;
	var errLanguage = document.getElementById("errLanguage");
	if (language == null || language == "") {
		errLanguage.innerHTML = "Language not empty";
	} else {
		errLanguage.innerHTML = "";
	}
	
	var errSize = document.getElementById("errSize");

	
	if (errBookName.innerHTML == "" && errPublisher.innerHTML == "" && errPrice.innerHTML == "" && errQuantity.innerHTML == ""
		&& errPages.innerHTML == "" && errPublicationDate.innerHTML == "" && errSize.innerHTML == "" ) {
		return true;
	}
	return false;

}
/* Validate form chart category */
function formChartCategoryValidate() {

	var currentDate = new Date();
	var date1 = document.getElementById("startDate").value;
	var startDate = new Date(document.getElementById("startDate").value)
	var errStartDate = document.getElementById("errStartDate");
	if (date1 == null || date1 == "") {
		errStartDate.innerHTML = "Not empty";
	}else if(startDate > currentDate){
		errStartDate.innerHTML = "Start date cannot be greater than current date";
	} else {
		errStartDate.innerHTML = "";
	}

	var date2 = document.getElementById("endDate").value;
	var endDate = new Date(document.getElementById("endDate").value)
	var errEndDate = document.getElementById("errEndDate");
	if (date2 == null || date2 == "") {
		errEndDate.innerHTML = "Not empty";
	}else if(endDate < startDate ){
		errEndDate.innerHTML = "End date cannot be less than start date";
	} else {
		errEndDate.innerHTML = "";
	}
	
	if(errStartDate.innerHTML == "" && errEndDate.innerHTML == "" ){
		return true;
	}
	
	return false;
}

/* Validate form add author */
function formAddAuthorValidate() {
	var authorName = document.getElementById("authorName").value;
	var errAuthorName = document.getElementById("errAuthorName");
	if (authorName == null || authorName == "") {
		errAuthorName.innerHTML = "Author Name not empty";
	} else {
		errAuthorName.innerHTML = "";
	}

	var errSize = document.getElementById("errSize");

	
	if (errAuthorName.innerHTML == "" && errSize.innerHTML == "" ) {
		return true;
	}
	return false;

}

/* Validate form add category */
function formAddCategoryValidate() {
	var categoryName = document.getElementById("categoryName").value;
	var errCategoryName = document.getElementById("errCategoryName");
	if (categoryName == null || categoryName == "") {
		errCategoryName.innerHTML = "Category Name not empty";
	} else {
		errCategoryName.innerHTML = "";
	}
	
	if (errCategoryName.innerHTML == "") {
		return true;
	}
	return false;

}


/* Validate form edit author */
function formEditAuthorValidate() {
	var editAuthorName = document.getElementById("editAuthorName").value;
	var errEditAuthorName = document.getElementById("errEditAuthorName");
	if (editAuthorName == null || editAuthorName == "") {
		errEditAuthorName.innerHTML = "Author Name not empty";
	} else {
		errEditAuthorName.innerHTML = "";
	}

	var errSizeAuthor = document.getElementById("errSizeAuthor");

	
	if (errEditAuthorName.innerHTML == "" && errSizeAuthor.innerHTML == "" ) {
		return true;
	}
	return false;

}

/* Validate form edit category */
function formEditCategoryValidate() {
	var editCategoryName = document.getElementById("editCategoryName").value;
	var errEditCategoryName = document.getElementById("errEditCategoryName");
	if (editCategoryName == null || editCategoryName == "") {
		errEditCategoryName.innerHTML = "Category Name not empty";
	} else {
		errEditCategoryName.innerHTML = "";
	}
	
	if (errEditCategoryName.innerHTML == "") {
		return true;
	}
	return false;

}