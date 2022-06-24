<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.pay_comment {
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	width: 610px;
}

/* 주문자 정보 css */
.pay_orderer_tbl {
	width: 1300px;
	height: auto;
	border-bottom: 2px solid rgb(204, 204, 204);
	border-top: 2px solid rgb(204, 204, 204);
	vertical-align: middle;
}

.pay_orderer_tbl th {
	width: 150px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
}

.pay_orderer_tbl td {
	width: 1100px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
}

.pay_orderer_tbl td input {
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	margin: 5px;
}

/* 결제 정보 css */
.pay_final_tbl {
	width: 1300px;
	height: auto;
	border-bottom: 2px solid rgb(204, 204, 204);
	border-top: 2px solid rgb(204, 204, 204);
	vertical-align: middle;
}

.pay_final_tbl th {
	width: 150px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
}

.pay_final_tbl td {
	width: 1100px;
	height: 60px;
	font-size: 15px;
	vertical-align: middle;
	text-align: left;
}

.pay_final_tbl td span {
	margin: 5px;
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

</style>
<script>
$(function(){
	$("#address_list_btn").click(function(e){
		e.preventDefault();
		getAddrList();
		$("#address_list_modal").modal("show");
	});
	
	$("#modal_new_address_btn").click(function(e){
		e.preventDefault();
		$("#modal_new_address").modal("show");
	});
	
	$(".modal_btn_regist").click(function(e){
		e.preventDefault();
		if ($("#chk_code").is(":checked")) {
			$("#add_code").val("1002");
		} else {
			$("#add_code").val("1001");
		};
		
		
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
					
				}
			}
		});
		$(".new_address_tbl td input").val("");
		getAddrList();
		$("#address_list_modal").modal("show");
	});
	
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
	});
	
	
	$(".modal_btn_modify").click(function(e){
		e.preventDefault();
		
		var form = $("#modal_modi_frm");
		var formData = new FormData(form[0]);
		
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
		$("#address_list_modal").modal("show");
	});
	
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
	});
	
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
		
	});
});

function getAddrList() {
	var url = "/pay/addrList";
	$.get(url, function(rData) {
		$("#modal_list_tbl > tbody > tr").remove();
		var addrListTable = "<tr>";
		$.each(rData, function(v, addrVo) {
			addrListTable += "<td><button type='button' class='modal_choose_btn' data-dismiss='modal' data-addNo=" + addrVo.add_no + ">선택</button></td>";
			addrListTable += "<td>" + addrVo.add_nickname + "</td>";
			addrListTable += "<td>" + addrVo.add_receiver + "</td>";
			addrListTable += "<td>" + addrVo.add_address + "<br>" + addrVo.add_addrdetail + "</td>";
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
} // getAddrList()

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
}

function modal_search_address() {
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
            document.getElementById('modal_new_postcode').value = data.zonecode;
            document.getElementById("modal_new_addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("modal_new_detail").focus();
        }
    }).open();
} // 배송지 등록 모달 주소api
function modal_modi_address() {
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
            document.getElementById('modal_modi_postcode').value = data.zonecode;
            document.getElementById("modal_modi_addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("modal_modi_detail").focus();
        }
    }).open();
} // 배송지 수정 모달 주소 api
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
								<td><input type="text" name="add_nickname" class="modal_new_nickname" value=""></td>
							</tr>
							<tr>
								<th>받으실분</th>
								<td><input type="text" name="add_receiver" class="modal_new_receiver" value=""></td>
							</tr>
							<tr>
								<th>받으실 곳</th>
								<td>
									<input type="text" id="modal_new_postcode" name="add_postcode">
									<button type="button" onclick="modal_search_address()" class="modal_new_search_address">우편번호 검색</button><br>
									<input type="text" id="modal_new_addr" name="add_address"><input type="text" id="modal_new_detail" name="add_addrdetail">
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
				<button type="button" class="modal_btn_regist" data-dismiss="modal">저장</button>
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
								<td><input type="text" name="add_nickname" class="modal_modi_nickname" value=""></td>
							</tr>
							<tr>
								<th>받으실분</th>
								<td><input type="text" name="add_receiver" class="modal_modi_receiver" value=""></td>
							</tr>
							<tr>
								<th>받으실 곳</th>
								<td>
									<input type="text" id="modal_modi_postcode" name="add_postcode"  value="">
									<button type="button" onclick="modal_modi_address()" class="modal_modi_search_address" value="">우편번호 검색</button><br>
									<input type="text" id="modal_modi_addr" name="add_address" value="">
									<input type="text" id="modal_modi_detail" name="add_addrdetail" value="">
								</td>
							</tr>
							<tr>
								<th>휴대폰 번호</th>
								<td><input type="text" name="add_cellphone" class="modal_modi_cellphone" value=""></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="modal_btn_cancel" data-dismiss="modal">취소</button>
				<button type="button" class="modal_btn_modify" data-dismiss="modal">수정</button>
			</div>
		</div>
	</div>
</div>

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
					<tr>
						<td>
							<div class="pay_order_product_div">
								<div>
									<img class="pay_product_img" src="/resources/pointshop/dakbal.jpg">
								</div>
								<div class="pay_order_product_title">
									<div>
										<a class="pay_order_product_a" href="#">
											<span>제목: 엄청 매운 닭발 엄청 매운 닭발엄청 매운 닭발 엄청 매운 닭발엄청 매운 닭발 엄청 매운 닭발</span>
										</a>
									</div>
									<div>
										<span class="pay_order_product_span">옵션: 한국에서 제일 매운맛 한국에서 제일 매운맛</span>
									</div>
								</div>
							</div>
						</td>
						<td>1</td>
						<td>10,000</td>
						<td>90%</td>
						<td>1,000</td>
						<td>20,000</td>
					</tr>
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
							<input type="radio" class="new_saved_address_rdo" name="new_saved_address"><label for="new_saved_address">기본 배송지</label>
							<input type="radio" class="new_saved_address_rdo" name="new_saved_address"><label for="new_saved_address">최근 배송지</label>
							<input type="radio" class="new_saved_address_rdo" name="new_saved_address"><label for="new_saved_address">직접 입력</label>
							<button type="button" id="address_list_btn" class="new_address_btn">배송지 관리</button>
						</td>
					</tr>
					<tr>
						<th>받으실분</th>
						<td><input type="text" class="pay_receiver"></td>
					</tr>
					<tr>
						<th>받으실 곳</th>
						<td>
							<input type="text" id="pay_search_postcode" name="add_postcode">
							<button type="button" onclick="pay_search_address()" class="pay_search_address">우편번호 검색</button><br>
							<input type="text" id="pay_search_addr"name="add_" class="pay_search_input">
							<input type="text" id="pay_search_detail" name="" class="pay_search_input">
						</td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td><input type="text" class="pay_cellphone"></td>
					</tr>
					<tr>
						<th>남기실 말씀</th>
						<td><input type="text" class="pay_comment"></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="pay_orderer_div">
			<h4>주문자 정보</h4>
			<table class="table pay_orderer_tbl">
				<tbody>
					<tr>
						<th>주문하시는분</th>
						<td><input type="text" class="pay_orderer"></td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td><input type="text" class="pay_orderer_cellphone"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" class="pay_orderer_email"></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="pay_final_div">
			<h4>결제 정보</h4>
			<table class="table pay_final_tbl">
				<tbody>
					<tr>
						<th>상품 합계 포인트</th>
						<td><span class="pay_prod_sum">1,000</span>
					</tr>
					<tr>
						<th>배송비</th>
						<td><span class="pay_deliver_fee">20,000</span>
					</tr>
					<tr>
						<th>최종 결제 포인트</th>
						<td><span class="pay_final_point">21,000</span>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>

<%@include file="/WEB-INF/views/include/main_footer.jsp" %>