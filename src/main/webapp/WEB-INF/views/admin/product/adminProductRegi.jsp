<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
<script>
let ckeditor_config = {
  resize_enabled: false,
  enterMode: CKEDITOR.ENTER_BR,
  shiftEnterMode: CKEDITOR.ENTER_P,
  filebrowserUploadUrl: "/adminProductImg"
};

function count(type)  {
	console.log("count 들어옴");
	console.log("에디터 버전 : " + CKEDITOR.version);
  // 결과를 표시할 element
  const productQuantity = document.getElementById('productQuantity');
  
  // 현재 화면에 표시된 값
  let number = productQuantity.value;
  
  // 더하기/빼기
  if(type === 'quantityPlus') {
    number = parseInt(number) + 1;
  }else if(type === 'quantityMinus')  {
    number = parseInt(number) - 1;
    if(number == -1) {
    	number = 0;
    }
  }
  
  // 결과 출력
  productQuantity.value = number;
}

function productRepImg() {
	console.log("gdgd");
	let img = document.getElementById('productRepImgInput').files;
	console.log("img : " + img);
	console.log("img[0] : " + img[0]);
	console.log("img[1] : " + img[1]);
	let productRepImg = img[0];
	
	let result = new FormData();
	if(productRepImg) {
		console.log(productRepImg.name);
		result.append("productRepImg", productRepImg);
		console.log("test1");
	} else {
		alert('상품 대표이미지를 선택해주세요.');
		return false;
	}
	console.log("test2");
	
  $.ajax({
    url: "/productRepImg",
    type: "POST",
    data: result,
    contentType: false,
    processData: false,
    success: function (data) {
      console.log("이미지 업로드 성공: " + data);
      alert('대표이미지 등록되었습니다'); 
    },
    error: function (request, status, error) {
      alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
      console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    }
  });
	
}

function productRegi() {
  // CKEditor에서 입력한 내용을 가져옵니다.
  console.log("등록 버튼 눌렀습니다");
  let choice = document.getElementById('productClassification');
  let name = document.getElementById('productName');
  let price = document.getElementById('productPrice');
  let quantity = document.getElementById('productQuantity');
  console.log("choice : " + choice);
  
  let productClassification = choice.value;
  let productContent = CKEDITOR.instances.productContent.getData();
  let productName = name.value;
  let productPrice = price.value;
  let productQuantity = quantity.value;
  console.log("productClassification : " + productClassification);
  console.log("productContent : " + productContent);
  console.log("productName : " + productName);
  console.log("productPrice : " + productPrice);
  console.log("productQuantity : " + productQuantity);
  
  if(productChoice === '') {
  	alert("상품 분류를 선택해주세요");
  	return false;
  }
  if(productName === '') {
  	alert("상품명을 입력해주세요");
  	return false;
  }
  if(productPrice == '') {
  	alert("상품가격을 입력해주세요");
  	return false;
  }
  if(productQuantity == '0') {
  	alert("상품수량를 입력해주세요");
  	return false;
  }
  if(productContent == '') {
  	alert("내용을 입력해주세요");
  	return false;
  }
  let pattern = /src="([^"]+)"/g;
	let results = productContent.match(pattern);
  let filePathAndName = '';
  let fileNames = [];
  let filePaths = [];
  console.log("results : " + results)
 	if(results) {
 	  for (let i = 0; i < results.length; i++) {
 	    filePathAndName = results[i].match(/src="([^"]+)"/)[1];
 	    console.log("filePathAndName : " + filePathAndName);
 	   	let lastBackslashIndex = filePathAndName.lastIndexOf("\\");
  		filePath = filePathAndName.substring(0, lastBackslashIndex + 1);
 	  	fileName = filePathAndName.substring(lastBackslashIndex + 1);
 	    console.log("파일 경로 " + (i + 1) + ": " + filePath);
 	    console.log("파일 이름 " + (i + 1) + ": " + fileName);
 	    filePaths.push(filePath);
 	    fileNames.push(fileName);	
  	}
  }
  console.log(" 분류 : " + productClassification);
  console.log(" 이름 : " + productName);
  console.log(" 가격 : " + productPrice);
  console.log(" 수량 : " + productQuantity);
  console.log(" 내용 : " + productContent);
  console.log(" 경로 : " + filePaths);
  console.log(" 이름 : " + fileNames);
  
  // FormData 객체 생성
  let formData = new FormData();
  formData.append("productClassification", productClassification)
  formData.append("productName", productName);
  formData.append("productPrice", productPrice);
  formData.append("productQuantity", productQuantity);
  formData.append("productContent", productContent);
  // formData.append("productRepImg", productRepImg);
  formData.append("filePath", filePaths);
  formData.append("fileName", fileNames);
 	
  $.ajax({
    url: "/adminProductInfo",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (data) {
      console.log("이미지 업로드 성공: " + data);
      
      if (data != '') {
        alert('등록되었습니다'); 
        window.close();
        window.opener.location.reload();
      } else {
      	alert('이미 사용 중인 아이디입니다.');
      	return false;
      }

    },
    error: function (request, status, error) {
      alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
      console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    }
  });
}

</script>
</head>
<body>
  <h1> < 상 품 등 록 > </h1>

  <!-- The toolbar will be rendered in this container. -->
  <div id="productChoice">
  	<div>상품분류</div>
  	<select id="productClassification">
  		<option value=""></option>
  		<option value="CAR">CAR</option>
		  <option value="STARWARS">STARWARS</option>
		  <option value="MARVEL">MARVEL</option>
		  <option value="HARRYPOTTER">HARRYPOTTER</option>
		</select>
  </div><br>
  
  <div id="productNameDiv">
  	<div>상품명</div>
    <input id="productName" type="text">
  </div><br>
   
  <div id="productPriceDiv">
   	<div>상품가격</div>
   	<input id="productPrice" type="text">
  </div><br>
   
  <div id="productQuantityDiv">
   	<div>상품수량</div>
   	<input id="quantityMinus" type="button" onclick='count("quantityMinus")' value="-"/>
   	<input id="productQuantity" type="text" readonly="readonly" value="0"/>
		<input id="quantityPlus" type="button" onclick='count("quantityPlus")' value="+"/>
  </div><br>
  
  <div id="productRepImg">
   	<div>상품 대표이미지</div>
   	<input id="productRepImgInput" type="file" name="file" onchange="productRepImg();">
  </div><br>
	
	<div>상품내용</div>
	<textarea name="productContent" id="productContent"></textarea>
	<script>
		CKEDITOR.replace("productContent", ckeditor_config);
	</script><br>
	<input type="button" value="등록" id="productRegiBtn" onclick="productRegi()">
	
</body>
</html>