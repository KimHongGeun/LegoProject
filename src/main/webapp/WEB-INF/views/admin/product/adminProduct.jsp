<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//페이지 로드 시 adminProductList 함수를 실행하여 초기 데이터를 가져옵니다.
$(document).ready(function() {
	const urlParams = new URLSearchParams(window.location.search);
	console.log("urlParams : " + urlParams);
  const currentPage = urlParams.get('curPage'); // URL에서 curPage 파라미터 값을 얻어옴
  console.log("currentPage : " + currentPage);
  adminProductList(currentPage);
});

function adminProductList(currentPage) {
	console.log("currentPage : " + currentPage);
	$.ajax({
		type : 'GET',
		url : '/adminProductList',
		dataType : 'json',
		data : {
			currentPage : currentPage
		},
		success: function(data) {
			console.log("ㅎㅇ");
			
		  // 페이징 처리를 위한 변수
			let pagePrevious = '';
			let pageNumber = '';
			let pageNext = '';
			let productInfo = '';
			// 서버에서 넘어온 페이징 처리 변수
			let productCount = data[0][0].productCount;
			let productSize = data[0][0].productSize;
			let productRow = data[0][0].productRow;
			let pageSize = data[0][0].pageSize;
			let pageCount = data[0][0].pageCount;
			let curPageStr = data[0][0].curPageStr;
			let curPage = data[0][0].curPage;
			let startPage = data[0][0].startPage;
			let endPage = data[0][0].endPage;
			let startIndex = data[0][0].startIndex;
			let endIndex = data[0][0].endIndex;
			// DB에서 넘어온 유저 데이터 변수
			let selBox = '<input id="productCheck" type="checkbox">';
			let productSeq = '';
			let productName = '';
			let productPrice = '';
			let productQuantity = '';
			// let productContent = '';
			let productClassification = '';
			let tr = '<tr>';
			let tr_ = '</tr>';
			let td = '<td>';
			let td_ = '</td>';
			console.log("productCount : " + productCount);
			console.log("productSize : " + productSize);
			console.log("productRow : " + productRow);
			console.log("pageSize : " + pageSize);
			console.log("pageCount : " + pageCount);
			console.log("curPageStr : " + curPageStr);
			console.log("curPage : " + curPage);
			console.log("startPage : " + startPage);
			console.log("endPage : " + endPage);
			console.log("startIndex : " + startIndex);
			console.log("endIndex : " + endIndex);
			
			$("#userTable").empty();
			for(let i = 0; i < productRow; i++) {
				// DB에서 넘어온 유저 데이터
				productSeq = data[1][i].productSeq;
				productName = data[1][i].productName;
				productPrice = data[1][i].productPrice;
				productQuantity = data[1][i].productQuantity;
				// productContent = data[1][i].productContent;
				productClassification = data[1][i].productClassification;
				
				console.log("productSeq : " + productSeq);
				console.log("productName : " + productName);
				console.log("productPrice : " + productPrice);
				console.log("productQuantity : " + productQuantity);
				// console.log("productContent : " + productContent);
				console.log("productClassification : " + productClassification);
				
				// userInfo 변수에 데이터 담기
				userInfo = tr +
										td + selBox + td_ +
										td + productSeq + td_ +
										td + productClassification + td_ +
										'<td id="selProducts">' + productName + '</td>' +
										td + productPrice + td_ +
										td + productQuantity + td_ +										
										td + '<button id="userModify" class="btn btn-secondary" onclick="" style="cursor: pointer;">내용수정</button>' + td_ +
										td + '<button id="userDelete" class="btn btn-secondary" onclick="productDel()" style="cursor: pointer;">상품삭제</button>' + td_ +
										tr_;
				console.log( i + " 번째 입니다.");

				// html 코드 초기화 후 hide으로 불필요한 bootstrap 숨기기
				$("#dataTable_length").empty();
				$(".dataTables_empty").empty();
        $("#dataTable_filter").empty();
        $("#dataTable_info").empty();
        $("#dataTable_previous").empty();
        $("#dataTable_next").empty();
        $('#dataTable_length').hide();
        $(".dataTables_empty").hide();
        $('#dataTable_filter').hide();
        $("#dataTable_info").hide();
        $('#dataTable_previous').hide();
        $('#dataTable_next').hide();
        $('#userTable').append(userInfo);
			}
			$("#pagePrevious").empty();
			$("#pageNext").empty();
			$("#pageNumber").empty();
			// 페이징 처리 <
			if(startPage > pageSize) {
				console.log("페이징처리 <");
				pagePrevious = '<a onclick="adminProductList(' + (startPage - 1) + ')"><</a>';
				console.log("pagePrevious : " + pagePrevious);
				$('#pagePrevious').append(pagePrevious);
			}
			
			// 페이징 처리 숫자 
			
			for(let i = startPage; i <= endPage; i++) {
				console.log("페이징처리 number");
				if(i == curPage) {
					pageNumber = '<a onclick="adminProductList(' + i + ')" style="border: 1px solid #ccc; color: red; font-weight: bold;">' + i + '</a>';
					console.log("pageNumber : " + pageNumber);
					$('#pageNumber').append(pageNumber);
				} else {
					pageNumber = '<a onclick="adminProductList(' + i + ')" style="border: 1px solid #ccc;">' + i + '</a>';
					console.log("pageNumber : " + pageNumber);
					$('#pageNumber').append(pageNumber);
				}
			}
			// 페이징 처리 >
			if(pageCount > endPage) {
				console.log("페이징처리 >");
				pageNext = '<a onclick="adminProductList(' + (endPage + 1) + ')">></a>';
				$('#pageNext').append(pageNext);
			}
		},
 	 	error : function(request,status,error) {
	 	 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 	 	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function productRegi() {
  alert("상품등록 버튼 누름");
  // 팝업 창의 URL
  let popupUrl = "adminProductRegi";
  // 팝업 창의 속성 설정
  let popupFeatures = "width=800,height=700,scrollbars=yes,resizable=yes";
  // 팝업 창 열기
  window.open(popupUrl, "상품등록", popupFeatures);
}

function productDel() {
  let selProducts = [];
  $('input[id="productCheck"]:checked').each(function() {
  	selProducts.push($(this).closest('tr').find('#selProducts').text());
    console.log("selProducts : " + selProducts);
  });
  console.log("-_-selProducts-_- : " + selProducts);
  
  if(selProducts != '') {
	  if(confirm("선택한 상품을 정말 삭제하시겠습니까?")) {
	    let selProduct = selProducts.join(',');
	    console.log("selProduct : " + selProduct);
	    $.ajax({
	    	type : 'GET',
	  		url : '/productDel',
	      data: { 
	      	selProduct: selProduct
	      },
	      success: function(data) {
	        console.log("data : " + data);
	        alert("상품이 삭제되었습니다");
	        location.reload();
	      },
	      error : function(request,status,error) {
	  	 	 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  	 	 	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  		}
	    });
	  } else {
	  	alert("취소되었습니다.");
	  	location.reload();
	  }
  } else {
  	alert("삭제하실 상품을 선택해주세요.");
		return false;
  }

}
</script>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template -->
    <link href="resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminMain">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">sikppang2<br>관리자 페이지</div>
            </a><br>

            <!-- Divider -->
            <hr class="sidebar-divider">
            <div class="sidebar-heading">
                회원관리
            </div>

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="adminUser">
                    <i class="fas fa-fw fa-table"></i>
                    <span>회원관리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                상품관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link" href="adminProduct">
                    <i class="fas fa-fw fa-table"></i>
                    <span>상품관리</span></a>
            </li>


            <hr class="sidebar-divider">
<!--
            <div class="sidebar-heading">
                게시판관리
            </div>

            <li class="nav-item active">
                <a class="nav-link" href="adminBoard">
                    <i class="fas fa-fw fa-table"></i>
                    <span>게시판관리</span></a>
            </li>

            <hr class="sidebar-divider d-none d-md-block">
 -->
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler Â· 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun Â· 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog Â· 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
                                <img class="img-profile rounded-circle"
                                    src="/resources/img/admin.png">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">상품관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품정보 조회</h6>
                        </div>
                        <div>
                        	<input type="button" value="상품등록" id="productRegi" class="productRegi" onclick="productRegi()"
                        	style="float: right; margin-right: 12px; margin-top: 8px;">
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        		<th>선택</th>
                                            <th>순서</th>
                                            <th>상품분류</th>
                                            <th>상품명</th>
                                            <th>상품가격</th>
                                            <th>상품수량</th>
                                            <th>상품내용수정</th>
                                            <th>상품삭제</th>
                                            <!-- <th>상품내용</th>  -->
                                        </tr>
                                    </thead>
                                    <tbody id="userTable">
                                    	
                                    </tbody>
                                </table>
                            </div>
                            <div class="page" style="display: flex; justify-content: center; cursor: pointer;">
	                            <a id="pagePrevious" style="font-size: 12px; text-align: center; margin-left: 5px;"></a>
	                            <a id="pageNumber" style="font-size: 12px; text-align: center; margin-left: 5px;"></a>
	                            <a id="pageNext"style="font-size: 12px; text-align: center; margin-left: 5px;"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                </div>
                <div class="modal-body">정말로 로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="admin/login/adminLogin">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/bootstrap/js/demo/datatables-demo.js"></script>

</body>

</html>