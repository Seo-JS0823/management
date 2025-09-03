<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/empHeader.css">
<link rel="stylesheet" href="/css/empMain.css"> 

<style>
	
	* {
		box-sizing : border-box;
		border-collapse: collapse;
	}
	
  table {
    border-collapse: collapse;
    width : 1000px;
		height : 900px;
    margin: 20px auto;
    background : white;
		border : 3px solid black;
    box-shadow: 0 0 3px #FFF;
    margin-top : 80px;
    white-space: nowrap;
  }
  
  h2 { 
  text-align : center;
  font-size : 35px;
   }
  
  td, th {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
  }
  
  td:nth-of-type(1) { width : 8%; }
  td:nth-of-type(2) { width : 55%; }
  td:nth-of-type(3) { width : 12%; }
  td:nth-of-type(4) { width : 25%; }
  
  input { padding : 6px; }
  
  #emp_submit_btn {
  	display : block;
  	width : 190px;
  	height :52px;
  	background : #2C3E50;
  	color : white; 
  	border-radius : 10px;
  	font-size : 20px;
  	font-weight : 700;
  	&:hover {
  		text-shadow : 0 0 3px #FFF;
    }
  
  }
  
  .overlay {
	 position: fixed;
	 top: 0;
	 left: 0;
	 width: 100%;
	 height: 100%;
	 background: rgba(0, 0, 0, 0.5); /* 투명도를 더하는 스타일(아주 유용한듯) */
	 display: flex;
	 justify-content: center;
	 align-items: center;
	 z-index: 1000;
}

	.modal {
	  background: white;
	  padding: 20px;
	  border-radius: 8px;
	  text-align: center;
	}
	
	button {
	  margin: 10px;
	  padding: 8px 16px;
	}
</style>

</head>
<body>

	<%@ include file="empHeader.jsp" %>

	<main class="emp_dashboard">		
	<form id="form" action="/leave/leaveUpdate" method="GET">
		<input type ="hidden" name="employee_id" value="${leaveReqDTO.employee_id}"/>
		<input type ="hidden" name="seq" value="${leaveReqDTO.seq}"/>
		<input id="status" type ="hidden" name="status" value="${leaveReqDTO.status}"/>
		<table>
		  <tr>
		    <td colspan="4" class="title"><h2>휴가 신청서</h2></td>
		  </tr>
		  <tr>
		    <td>성명</td>
		    <td><input type="text" name="name" value="${leaveReqDTO.name}"></td>
		    <td>부서담당자</td>
		    <td><input type="text" name="manager_name" value="${leaveReqDTO.manager_name}"></td>
		  </tr>
		  <tr>
		    <td>부서</td>
		    <td><input type="text" name="department_name" value="${leaveReqDTO.department_name}"></td>
		    <td>전화번호</td>
		    <td><input type="text" name="phone_num" value="${leaveReqDTO.phone_num}"></td>
		  </tr>
		  <tr>
		  	<td>신청일</td>
		  	<td colspan="3"><input type="date" name="reg_date" value="${leaveReqDTO.reg_date}"/></td>
		  </tr>
		  <tr>
		  <tr>
		    <td>기간</td>	    
		    <td>
		    <input type="date" name="leave_start_date" value="${leaveReqDTO.leave_start_date}">
		     ~ 
		     <input type="date" name="leave_end_date" value="${leaveReqDTO.leave_end_date}">
		    </td>		    
		    <td>휴가일수</td>
		    <td><input type="number" min="0" max="15" name="annual_days" value="${leaveReqDTO.annual_days}"></td>
		  </tr>
		  <tr>
		    <td>사유</td>
		    <td colspan="3">
		    <textarea style="width:100%; height:120px; resize:none;" name="content" >${leaveReqDTO.content}</textarea>
		    </td>
		  </tr>
		  <tr>
		    <td>신청자 (인)</td>
		    <td colspan="3"><input type="text" value="${leaveReqDTO.name}"></td>
		  </tr>
		  <tr>
		    <td colspan="4" style="text-align:center;">주식회사 ○○○</td>
		  </tr>
		  <tr>
		  	<td colspan="4">
		  	<input id="emp_submit_btn" type="submit" value="수정사항 제출하기"/>
		  	</td>
		  </tr>
		</table>
	</form>
		
	</main>
	
  <script src="/js/nowtime.js"></script>
	
	<script>
		const statusEl = document.getElementById('status')
		const formEl = document.getElementById('form')
		const titleEL  = document.querySelector('.title')
		
	
		const btnEl = document.querySelector('#emp_submit_btn')
		
		btnEl.addEventListener('click', function(e) {
		
			e.preventDefault(); // 기존 기능 실행취소
			
			const overlay = document.createElement('div');
			overlay.className= "overlay";
			
			const modal = document.createElement('div');
			modal.className = "modal";
			
			const message = document.createElement('p')
			message.innerHTML = "수정사항을 제출 하겠습니까?";
			
			const check = document.createElement('button')
			check.innerHTML = "확인";
			check.addEventListener('click', function() {
				
				if(statusEl.value == 0) {
					alert('관리자가 확인전까지 수정 불가합니다.');
					e.preventDefault();
					return false;
				}
				
				if(statusEl.value == 1) {
					alert('승인된 휴가는 수정할 수 없습니다.');
					e.preventDefault();
					return false;
				}
				
				alert("제출 성공")
				document.body.removeChild(overlay);
				formEl.submit();
			})
			
			const cancel = document.createElement('button')
			cancel.innerHTML = "취소";
			cancel.addEventListener('click', function() {
				document.body.removeChild(overlay);
			})
			
			document.body.appendChild(overlay);
			overlay.appendChild(modal);
			modal.appendChild(message);
			modal.appendChild(check);
			modal.appendChild(cancel);
		
		});
	</script>
	
</body>
</html>


