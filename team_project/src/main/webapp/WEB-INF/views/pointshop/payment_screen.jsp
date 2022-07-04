<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/main_header.jsp" %>

<style>
.order_title {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
	height: 35px;
}

.order_title_li {
	display: block;
	float: left;
	margin: 5px;
	font-family: jua;
	font-size: 18px;
	color: #d1d1d1;
}
.order_title_li_this {
	display: block;
	float: left;
	margin: 5px;
	padding-bottom: 12px;
	font-family: jua;
	font-size: 18px;
	color: rgb(248, 56, 1);
}

.order_title_span {
	margin-right: 5px;
	font-family: jua;
	font-size: 18px;
	color: #d1d1d1;
}

.order_title_span_this {
	margin-right: 5px;
	padding-bottom: 12px;
	font-family: jua;
	font-size: 18px;
	color: rgb(248, 56, 1);
}

.order_title_span_arrow {
	margin-left: 5px;
	color: #d1d1d1;
	margin-top: 3px;
}

/* 주문 상세 내역 css */
.order_list_div {
	margin-top: 30px;
}

.order_list_tbl {
	width: 100%;
	height: auto;
	border-bottom: 2px solid rgb(204, 204, 204);
	border-top: 2px solid rgb(204, 204, 204);
}

.order_list_tbl th {
	font-size: 15px;
	vertical-align: middle;
}

.order_list_tbl td {
	width: 1100px;
	height: 60px;
	border: 1px solid #eee;
	font-size: 15px;
	vertical-align: middle;
	text-align: center;
}

.pay_order_product_div {
	display: flex;
	justify-content:center;
	float: left;
	align-items: center;
}

.pay_product_img {
	width: 248px;
	height: 248px;
}

.pay_order_product_title {
    vertical-align: middle;
	margin-left: 10px;
	text-align: left;
}

.pay_order_product_a {
	font-size: 15px;
	font-weight: bold;
}

.pay_order_product_span  {
	font-size: 12px;
	color: #808080;
}

/* 배송 정보 css */

#pay_address_tbl {
	width: 1300px;
	height: auto;
	border-bottom: 2px solid rgb(204, 204, 204);
	border-top: 2px solid rgb(204, 204, 204);
	vertical-align: middle;
}

#pay_address_tbl th {
	width: 150px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
}

#pay_address_tbl td {
	width: 1100px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
}

.new_saved_address_rdo {
	margin-left: 10px;
	margin-right: 5px;
}

.new_address_btn {
	margin-left: 10px;
	width: 120px;
	height: 40px;
	border-radius: 5px;
	border:none;
	background-color: rgb(255, 227, 219);
}

#pay_address_tbl td input {
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	margin: 5px;
}

.pay_search_address {
	padding-left: 10px;
	padding-right: 10px;
	width: 120px;
	height: 30px;
	border-radius: 5px;
	border:none;
	background-color: rgb(255, 227, 219);
}

.pay_search_input {
	width: 300px;
}

#comment_select {
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	width: 610px;
	margin: 5px;
	appearance: none;
}

#direct_comment {
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	width: 610px;
	display: none;
}

/* 결제 정보 css */

.pay_final {
	border-top: 1px solid rgb(204, 204, 204);
	border-bottom: 1px solid rgb(204, 204, 204);
}

.pay_final table {
	margin-left: auto;
	margin-right: auto;
}

.pay_final_div {  
 	margin: 30px; 
 	font-size: 20px; 
 	text-align: center; 
 	vertical-align: middle; 
} 

.pay_final_icon {
	font-weight: bold;
	color: rgb(204, 204, 204);
}

.pay_final_discount h2 {
	color: rgb(248, 56, 1);
}

.pay_final_point h2 {
	color: #57DA4C;
}


/* 모달창1 */
.modal_list_foot {
	display:flex;
	justify-content: flex-end;
	margin-bottom: 20px;
	margin-right: 20px;
}

#modal_new_address_btn {
	width: 120px; 
 	height: 30px; 
	border-radius: 5px;
	border:none;
	background-color: rgb(255, 227, 219);
}

#modal_list_tbl {
	border-top: 1px solid rgb(204, 204, 204);
}

#modal_list_tbl td{
	border-top: 1px solid rgb(204, 204, 204);
	border-bottom: 1px solid rgb(204, 204, 204);
	vertical-align: middle;
}

#modal_list_tbl button{
	width: 70px; 
 	height: 30px; 
	border-radius: 5px;
	border:1px solid rgb(204, 204, 204);
	background-color: white;
}

/* 모달창2 */

.new_address_tbl {
	width: 1300px;
	height: auto;
	border-bottom: 2px solid rgb(204, 204, 204);
	border-top: 2px solid rgb(204, 204, 204);
	vertical-align: middle;
}

.new_address_tbl th {
	width: 180px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
}

.new_address_tbl td {
	width: 1100px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
}
.new_address_tbl td input {
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	margin: 5px;
}
.modal_new_search_address {
	padding-left: 10px;
	padding-right: 10px;
 	width: 120px; 
 	height: 30px; 
	border-radius: 5px;
	border:none;
	background-color: rgb(255, 227, 219);
}

.modal_btn_cancel {
	width: 150px; 
 	height: 50px; 
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	background-color: white;
}

.modal_btn_regist {
	width: 150px; 
 	height: 50px; 
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	background-color: rgb(255, 227, 219);
}

.modal_btn_modify {
	width: 150px; 
 	height: 50px; 
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	background-color: rgb(255, 227, 219);
}

.modal_new_code {
	margin-left: 5px;
}

/* 모달창3 */

#modi_address_tbl {
	width: 1300px;
	height: auto;
	border-bottom: 2px solid rgb(204, 204, 204);
	border-top: 2px solid rgb(204, 204, 204);
	vertical-align: middle;
}

#modi_address_tbl th {
	width: 180px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
}

#modi_address_tbl td {
	width: 1100px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
}
#modi_address_tbl td input {
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	margin: 5px;
}
.modal_modi_search_address {
	padding-left: 10px;
	padding-right: 10px;
 	width: 120px; 
 	height: 30px; 
	border-radius: 5px;
	border:none;
	background-color: rgb(255, 227, 219);
}

/* 주문완료 버튼 */
#order_complete_btn {
	margin: 10px;
	width: 300px;
	height: 70px;
	border-radius: 5px;
	border:none;
	background-color: rgb(255, 227, 219);
	font-size: 20px;
	font-weight: bold;
}
.order_complete_div {
	display: flex;
	justify-content: center;
}

</style>
<script>
getBasicAddress();

$(function(){
	
	$("#address_list_btn").click(function(e){
		e.preventDefault();
		getAddrList();
		$("#address_list_modal").modal("show");
	}); // modal list 출력 버튼
	
	$("#modal_new_address_btn").click(function(e){
		e.preventDefault();
		$(".new_address_tbl td input").val("");
		$("#modal_new_address").modal("show");
	}); // modal insert창 출력 버튼
	
	$(".modal_btn_regist").click(function(e){
		e.preventDefault();
		if ($("#chk_code").is(":checked")) {
			$("#add_code").val("1002");
		} else {
			$("#add_code").val("1001");
		};
		
		if ($("#modal_new_nickname").val() == "") {
			alert("배송지 이름을 입력해주세요");
		} else if ($("#modal_new_receiver").val() == "") {
			alert("받으실분의 이름을 입력해주세요");			
		} else if ($("#add_postcode").val() == "") {
			alert("우편번호를 검색한 후 선택해주세요");			
		} else if ($("#modal_new_cellphone").val() == "") {
			alert("휴대폰 번호를 입력해주세요");
		} else {
			var form = $("#modal_frm");
			var formData = new FormData(form[0]);
			var url = "/pay/insertAddr";
			
			$.ajax({
				"enctype" : "multipart/form-data",  
				"processData" : false,
				"contentType" : false,
				"url" : url,
				"method" : "post",
				"data" : formData,
				"success" : function(rData) {
					if (rData == "true") {
						getAddrList();		
					}
				}
			});
			$(this).attr("data-dismiss", "modal");
			$("#address_list_modal").modal("show");
		}
		
	}); // modal insert창 저장 버튼
	
	$("#modal_list_tbl").on("click", ".modal_modi_btn", function(e){
		e.preventDefault();
		var url = "/pay/readAddr";
		var addNo = $(this).attr("data-addNo");
		var sData = {
				"add_no" : addNo
		}
		$.get(url, sData, function(rData){
			$("#modi_address_tbl > tbody > tr > td input").eq(0).val(rData.add_nickname);
			$("#modi_address_tbl > tbody > tr > td input").eq(1).val(rData.add_receiver);
			$("#modi_address_tbl > tbody > tr > td input").eq(2).val(rData.add_postcode);
			$("#modi_address_tbl > tbody > tr > td input").eq(3).val(rData.add_address);
			$("#modi_address_tbl > tbody > tr > td input").eq(4).val(rData.add_addrdetail);
			$("#modi_address_tbl > tbody > tr > td input").eq(5).val(rData.add_cellphone);
			$("#modal_modi_add_no").val(rData.add_no);
			$("#modal_modi_add_code").val(rData.add_code);
		});
		$("#modal_modi_address").modal("show");
	}); // modal list 수정 버튼
	
	
	$(".modal_btn_modify").click(function(e){
		e.preventDefault();
		
		var form = $("#modal_modi_frm");
		var formData = new FormData(form[0]);
		
		if ($("#modal_modi_nickname").val() == "") {
			alert("배송지 이름을 입력해주세요");
		} else if ($("#modal_modi_receiver").val() == "") {
			alert("받으실분의 이름을 입력해주세요");			
		} else if ($("#modal_modi_postcode").val() == "") {
			alert("우편번호를 검색한 후 선택해주세요");			
		} else if ($("#modal_modi_cellphone").val() == "") {
			alert("휴대폰 번호를 입력해주세요");
		} else {
			var url = "/pay/modifyAddr";
			$.ajax({
				"enctype" : "multipart/form-data",  
				"processData" : false,
				"contentType" : false,
				"url" : url,
				"method" : "post",
				"data" : formData,
				"success" : function(rData) {
					getAddrList();
				}
			});
			$(this).attr("data-dismiss", "modal");
			$("#address_list_modal").modal("show");	
		}
	}); // modal 수정창 수정완료 버튼
	
	$("#modal_list_tbl").on("click", ".modal_del_btn", function(e){
		e.preventDefault();
		var url = "/pay/deleteAddr";
		var addNo = $(this).attr("data-addNo");
		var sData = {
				"add_no" : addNo
		}
		$.get(url, sData, function(rData){
			getAddrList();
		});
	}); // modal list delete 버튼
	
	$("#modal_list_tbl").on("click", ".modal_choose_btn", function(e){
		e.preventDefault();
		var add_no = $(this).attr("data-addNo");
		console.log("add_no: ", add_no);
		var url = "/pay/readAddr";
		var sData = {
				"add_no" : add_no
		};
		$.get(url, sData, function(rData){
			console.log("rData: ", rData);
			$("#pay_address_tbl > tbody > tr > td input").eq(3).val(rData.add_receiver);
			$("#pay_address_tbl > tbody > tr > td input").eq(4).val(rData.add_postcode);
			$("#pay_address_tbl > tbody > tr > td input").eq(5).val(rData.add_address);
			$("#pay_address_tbl > tbody > tr > td input").eq(6).val(rData.add_addrdetail);
			$("#pay_address_tbl > tbody > tr > td input").eq(7).val(rData.add_cellphone);
		});
	}); // modal list 선택 버튼
	
	$(".new_saved_address_rdo").on("click", function(){
		var chked_rdo = $(".new_saved_address_rdo:checked").val();
		
		if (chked_rdo == "basic") {
			getBasicAddress();
		} else if (chked_rdo == "recent") {
			
		} else if (chked_rdo == "edit") {
			$("#pay_address_tbl > tbody > tr > td input").eq(3).val("");
			$("#pay_address_tbl > tbody > tr > td input").eq(4).val("");
			$("#pay_address_tbl > tbody > tr > td input").eq(5).val("");
			$("#pay_address_tbl > tbody > tr > td input").eq(6).val("");
			$("#pay_address_tbl > tbody > tr > td input").eq(7).val("");
		}
	}); // 배송정보 radio button
	
	$("#comment_select").change(function(){
		var comment_select = $("#comment_select option:selected").val();
		console.log(comment_select);
		if (comment_select == "direct") {
			$("#direct_comment").show();
		} else {
			$("#direct_comment").hide();			
		}
	}); // 배송 메모
	
	$("#email3").change(function(){
		if($(this).val()==9){
			$("#emailAdInput").removeAttr("disabled");
		}else{
			$("#emailAdInput").val($("#email3").val());
			$("#emailAdInput").attr("disabled", true);
		}
    }); // email
	
	$("#emailIdInput").blur(function(){
		email();
	});
	
	$("#email3").change(function(){
		email();
	});
	
});

function email(){
	const email = $("#emailIdInput").val();
	const middle = $("#emailB").text();
	const address = $("#emailAdInput").val();
	if(email != "" && address != "") {
		$("#totalemail").val(email+middle+address);
	}
}; // 배송정보 이메일 값 hidden 입력 함수

function getAddrList() {
	var url = "/pay/addrList";
	$.get(url, function(rData) {
		$("#modal_list_tbl > tbody > tr").remove();
		var addrListTable = "<tr>";
		$.each(rData, function(v, addrVo) {
			addrListTable += "<td><button type='button' class='modal_choose_btn' data-dismiss='modal' data-addNo=" + addrVo.add_no + ">선택</button></td>";
			addrListTable += "<td>" + addrVo.add_nickname + "</td>";
			addrListTable += "<td>" + addrVo.add_receiver + "</td>";
			addrListTable += "<td>" + addrVo.add_address + "<br>"
			if (addrVo.add_addrdetail != null) {
				addrListTable += addrVo.add_addrdetail
			}
			addrListTable += "</td>";				
			addrListTable += "<td>" + addrVo.add_cellphone + "</td>";
			addrListTable += "<td>";
			addrListTable += "<div class='modal_modi_del_div'>";
			addrListTable += "<button class='modal_modi_btn' data-dismiss='modal' data-addNo=" + addrVo.add_no + ">수정</button><br>";
			addrListTable += "<button class='modal_del_btn' data-addNo=" + addrVo.add_no + ">삭제</button>";
			addrListTable += "</div>";
			addrListTable += "</td>";
			addrListTable += "</tr>";
		});// 리스트 append $.each()
		
		$("#modal_list_tbl>tbody").append(addrListTable);
	});
} // getAddrList() modal address list 출력 함수

function getBasicAddress(){
	var url = "/pay/getBasicAddr";
	$.get(url, function(rData) {
		console.log("rData: ", rData);
		if (rData != "") {
			$("#basic_addr_rdo").prop("checked", true);
			$("#pay_address_tbl > tbody > tr > td input").eq(3).val(rData.add_receiver);
			$("#pay_address_tbl > tbody > tr > td input").eq(4).val(rData.add_postcode);
			$("#pay_address_tbl > tbody > tr > td input").eq(5).val(rData.add_address);
			if (rData.add_addrdetail == null) {
				$("#pay_address_tbl > tbody > tr > td input").eq(6).val("");			
			} else {
				$("#pay_address_tbl > tbody > tr > td input").eq(6).val(rData.add_addrdetail);				
			}
			$("#pay_address_tbl > tbody > tr > td input").eq(7).val(rData.add_cellphone);
		} else if (rData == "") {
			$("#edit_addr_rdo").prop("checked", true);
		}
	});
} // radio button 기본 배송지 함수

function final_order() {
	if ($("#pay_receiver").val() == "") {
		alert("받으실분의 이름을 입력해주세요");			
	} else if ($("#pay_search_postcode").val() == "") {
		alert("우편번호를 검색한 후 선택해주세요");			
	} else if ($("#pay_cellphone").val() == "") {
		alert("휴대폰 번호를 입력해주세요");
	} else if($("#emailIdInput").val() == "") {
		alert("이메일 아이디를 입력해주세요.");
	} else if($("#emailAdInput").val() == "") {
		alert("상세 이메일 주소를 선택하거나 입력해주세요");
	} else {
		$("#final_order_frm").submit();		
	};
	
}

function pay_search_address() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('pay_search_postcode').value = data.zonecode;
            document.getElementById("pay_search_addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("pay_search_detail").focus();
        }
    }).open();
} // radio button 직접 입력의 주소 api

function modal_search_address() {
    new daum.Postcode({
        oncomplete: function(data) {
          
        	var addr = ''; 
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

           
            document.getElementById('modal_new_postcode').value = data.zonecode;
            document.getElementById("modal_new_addr").value = addr;
            
            document.getElementById("modal_new_detail").focus();
        }
    }).open();
} // modal 배송지 등록 주소api
function modal_modi_address() {
    new daum.Postcode({
        oncomplete: function(data) {

        	var addr = ''; 
            var extraAddr = ''; 

            
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            document.getElementById('modal_modi_postcode').value = data.zonecode;
            document.getElementById("modal_modi_addr").value = addr;
            
            document.getElementById("modal_modi_detail").focus();
        }
    }).open();
} // modal 배송지 수정 주소 api
</script>
<!-- 리스트 모달창 -->
<div class="modal fade" id="address_list_modal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">나의 배송지 관리</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table" id="modal_list_tbl">
					<thead>
						<tr>
							<th width="3%">선택</th>
							<th width="15%">배송지 이름</th>
							<th width="15%">받으실 분</th>
							<th width="40%">주소</th>
							<th width="17%">연락처</th>
							<th width="10%">수정/삭제</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="modal_list_foot">
				<button type="button" id="modal_new_address_btn" data-dismiss="modal">+ 새 배송지 추가</button>
			</div>
		</div>
	</div>
</div>

<!-- 입력 모달창 -->

<div class="modal fade" id="modal_new_address" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">새 배송지 등록</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modal_frm" action="/pay/insertAddr" method="get">
				<input type="hidden" id="add_code" name="add_code" value="">
				<input type="hidden" name="userid" value="${loginVo.userid}">
					<table class="table new_address_tbl">
						<tbody>
							<tr>
								<th>배송지 이름</th>
								<td><input type="text" name="add_nickname" id="modal_new_nickname" value=""></td>
							</tr>
							<tr>
								<th>받으실분</th>
								<td><input type="text" name="add_receiver" id="modal_new_receiver" value=""></td>
							</tr>
							<tr>
								<th>받으실 곳</th>
								<td>
									<input type="text" id="modal_new_postcode" name="add_postcode" readonly>
									<button type="button" onclick="modal_search_address()" class="modal_new_search_address">우편번호 검색</button><br>
									<input type="text" id="modal_new_addr" name="add_address" readonly><input type="text" id="modal_new_detail" name="add_addrdetail">
								</td>
							</tr>
							<tr>
								<th>휴대폰 번호</th>
								<td><input type="text" name="add_cellphone" class="modal_new_cellphone"></td>
							</tr>
						</tbody>
					</table>
					<div class="modal_new_code">
						<input type="checkbox" id="chk_code" checked>
						<span>기본 배송지로 설정합니다</span>
					</div>
				</form>			
			</div>
			<div class="modal-footer">
				<button type="button" class="modal_btn_cancel" data-dismiss="modal">취소</button>
				<button type="button" class="modal_btn_regist">저장</button>
			</div>
		</div>
	</div>
</div>

<!-- 수정 모달창 -->
<div class="modal fade" id="modal_modi_address" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">배송지 수정</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modal_modi_frm" action="">
					<input type="hidden" name="userid" value="${loginVo.userid}">
					<input type="hidden" name="add_no" id="modal_modi_add_no" value="">
					<input type="hidden" name="add_code" id="modal_modi_add_code" value="">
					<table class="table" id="modi_address_tbl">
						<tbody>
							<tr>
								<th>배송지 이름</th>
								<td><input type="text" name="add_nickname" id="modal_modi_nickname"></td>
							</tr>
							<tr>
								<th>받으실분</th>
								<td><input type="text" name="add_receiver" id="modal_modi_receiver"></td>
							</tr>
							<tr>
								<th>받으실 곳</th>
								<td>
									<input type="text" id="modal_modi_postcode" name="add_postcode" readonly>
									<button type="button" onclick="modal_modi_address()" class="modal_modi_search_address">우편번호 검색</button><br>
									<input type="text" id="modal_modi_addr" name="add_address" readonly>
									<input type="text" id="modal_modi_detail" name="add_addrdetail">
								</td>
							</tr>
							<tr>
								<th>휴대폰 번호</th>
								<td><input type="text" id="modal_modi_cellphone" name="add_cellphone"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="modal_btn_cancel" data-dismiss="modal">취소</button>
				<button type="button" class="modal_btn_modify">수정</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달창 끝 -->

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="order_title">
			<h1>주문/결제</h1>
			<ol type="1" class="order_title_ol">
				<li class="order_title_li">
					<span class="order_title_span">01</span>장바구니
					<span class="order_title_span_arrow">
						<i class="fas fa-chevron-circle-right"></i>
					</span>
				</li>
				<li class="order_title_li_this">
					<span class="order_title_span_this">02</span>주문/결제
					<span class="order_title_span_arrow">
						<i class="fas fa-chevron-circle-right"></i>
					</span>
				</li>
				<li class="order_title_li"><span class="order_title_span">03</span>주문 완료</li>
			</ol>
		</div>
		
		<hr>
		<form method="post" action="/pay/getFinalOrder" id="final_order_frm">
			<div class="order_list_div">
				<h4>주문 상세 내역</h4>
				<table class="table order_list_tbl">
					<thead>
						<tr>
							<th width="50%">상품 정보</th>
							<th width="10%">수량</th>
							<th width="10%">상품 금액</th>
							<th width="10%">할인</th>
							<th width="10%">합계 금액</th>
							<th width="10%">배송비</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderLists}" var="orderVo">
						<input type="hidden" name="o_pno" value="${orderVo.o_pno}">
						<input type="hidden" name="h_pictures" value="${orderVo.o_titlepic}">
						<input type="hidden" name="h_titles" value="${orderVo.p_title}">
						<input type="hidden" name="h_options" value="${orderVo.p_option}">
						<input type="hidden" name="h_amounts" value="${orderVo.o_amount}">
						<input type="hidden" name="h_prices" value="${orderVo.p_price}">
						<input type="hidden" name="h_sales" value="${orderVo.p_discount}">
						<input type="hidden" name="h_sum_prices" value="${orderVo.o_sum}">
						<input type="hidden" name="h_deliverycharges" value="${orderVo.o_deliverycharge}">
							<tr>
								<td>
									<div class="pay_order_product_div">
										<div>
											<img class="pay_product_img" src="/pay/displayImage?filename=${orderVo.o_titlepic}">
										</div>
										<div class="pay_order_product_title">
											<div>
												<a class="pay_order_product_a" href="#">
													<span>${orderVo.p_title}</span>
												</a>
											</div>
											<div>
												<span class="pay_order_product_span">${orderVo.p_option}</span>
											</div>
										</div>
									</div>
								</td>
								<td>${orderVo.o_amount}</td>
								<td><fmt:formatNumber value="${orderVo.p_price}" type="number" maxFractionDigits="3"/>P</td>
								<td>${orderVo.p_discount}%</td>
								<td><fmt:formatNumber value="${orderVo.o_sum}" type="number" maxFractionDigits="3"/>P</td>
								<c:choose>
									<c:when test="${orderVo.o_deliverycharge == 0}">
									</c:when>
									<c:otherwise>
										<td rowspan='<c:out value="${orderVo.deliver_count}"/>'>
											<fmt:formatNumber value="${orderVo.o_deliverycharge}" type="number" maxFractionDigits="3"/>P
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
			<div class="pay_address_div">
				<h4>배송 정보</h4>
				<table class="table" id="pay_address_tbl">
					<tbody>
						<tr>
							<th>배송지 확인</th>
							<td>
								<input type="radio" id="basic_addr_rdo" class="new_saved_address_rdo" name="new_saved_address" value="basic"><label for="new_saved_address">기본 배송지</label>
								<input type="radio" id="recent_addr_rdo" class="new_saved_address_rdo" name="new_saved_address" value="recent"><label for="new_saved_address">최근 배송지</label>
								<input type="radio" id="edit_addr_rdo" class="new_saved_address_rdo" name="new_saved_address" value="edit"><label for="new_saved_address">직접 입력</label>
								<button type="button" id="address_list_btn" class="new_address_btn">배송지 관리</button>
							</td>
						</tr>
						<tr>
							<th>받으실분</th>
							<td><input type="text" name="h_receiver" id="pay_receiver"></td>
						</tr>
						<tr>
							<th>받으실 곳</th>
							<td>
								<input type="text" name="h_postcode" id="pay_search_postcode" readonly>
								<button type="button" onclick="pay_search_address()" class="pay_search_address">우편번호 검색</button><br>
								<input type="text" name="h_address" id="pay_search_addr" class="pay_search_input" readonly>
								<input type="text" name="h_address_detail" id="pay_search_detail" class="pay_search_input">
							</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="text" name="h_cellphone" id="pay_cellphone"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="hidden" name="h_email" id="totalemail">
								<input type="text" name="email1" id="emailIdInput" /><span id="emailB">@</span>
								<input type="text" name="email2" id="emailAdInput" disabled/>
								<select name="email3" id="email3">
									<option value=''>메일 선택</option>
									<option value='9'>직접 입력하기</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="kakao.com">kakao.com</option>
									<option value="nate.com">nate.com</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>배송 메모</th>
							<td>
								<select id="comment_select" name="h_deliver_comment">
									<option value=""></option>
									<option value="배송 전에 미리 연락 부탁드려요.">배송 전에 미리 연락 부탁드려요.</option>
									<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
									<option value="부재시 문자나 전화 주세요.">부재시 문자나 전화 주세요.</option>
									<option value="direct">직접 입력</option>
								</select><br>
								<input type="text" name="direct_comment" id="direct_comment">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<c:forEach items="${orderLists}" var="orderVo">
				<c:set var="total_price" value="${total_price + (orderVo.p_price * orderVo.o_amount)}"/>
				<c:set var="total_delivery" value="${total_delivery + orderVo.o_deliverycharge}"/>
				<c:set var="final_price" value="${final_price + orderVo.o_sum}"/>
			</c:forEach>
			<input type="hidden" name="h_totaldeliverycharge" value="${total_delivery}">
			<input type="hidden" name="h_totalsale" value="${total_price - final_price}">
			<input type="hidden" name="h_totalprice" value="${total_price}">
			<div class="pay_final">
				<table>
					<tr>
						<td>
							<div class="pay_final_div">
								<div><h4>총 상품 합계 금액</h4></div>
								<div><h2><fmt:formatNumber value="${total_price}" type="number" maxFractionDigits="3"/></h2></div>
							</div>
						</td>
						<td>
							<div class="pay_final_div">
								<span><i class="fa-solid fa-plus pay_final_icon"></i></span>				
							</div>
						</td>
						<td>
							<div class="pay_final_div">
								<div><h4>총 배송비</h4></div>
								<div><h2><fmt:formatNumber value="${total_delivery}" type="number" maxFractionDigits="3"/></h2></div>				
							</div>
						</td>
						<td>
							<div class="pay_final_div">
								<span><i class="fa-solid fa-minus pay_final_icon"></i></span>				
							</div>
						</td>
						<td>
							<div class="pay_final_div">
								<div><h4>할인</h4></div>
								<div class="pay_final_discount"><h2><fmt:formatNumber value="${total_price - final_price}" type="number" maxFractionDigits="3"/></h2></div>				
							</div>
						</td>
						<td>
							<div class="pay_final_div">
								<span><i class="fa-solid fa-equals pay_final_icon"></i></span>				
							</div>
						</td>
						<td>
							<div class="pay_final_div">
								<div><h4>최종 결제 포인트</h4></div>
								<div class="pay_final_point"><h2><fmt:formatNumber value="${final_price}" type="number" maxFractionDigits="3"/></h2></div>			
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<div>
			<div class="order_complete_div">
				<button type="button" id="order_complete_btn" onclick="final_order()">주문 완료</button>
			</div>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>

<%@include file="/WEB-INF/views/include/main_footer.jsp" %>