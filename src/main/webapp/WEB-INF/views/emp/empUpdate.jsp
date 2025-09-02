<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>My Company Management</title>

  <style>
    * {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
      box-sizing: border-box;
    }

    body {
      background-color: #2c3e50;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .joinForm {
      width: 500px;
      background-color: #fff;
      padding: 40px 30px;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
      height: auto;
    }

    .joinForm h2 {
      margin-bottom: 30px;
      color: #2c3e50;
      font-size: 28px;
    }

    .textForm {
      margin-bottom: 20px;
    }

    .textForm input,
    .textForm select {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 15px;
      transition: all 0.3s;
      background-color: #f8f9fa;
    }

    .textForm input:focus,
    .textForm select:focus {
      outline: none;
      border-color: #6c5ce7;
      background-color: #fff;
      box-shadow: 0 0 5px rgba(108, 92, 231, 0.4);
    }

    .btn {
      width: 100%;
      padding: 12px;
      background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
      background-size: 200%;
      background-position: left;
      border: none;
      border-radius: 6px;
      color: white;
      font-weight: bold;
      font-size: 16px;
      cursor: pointer;
      transition: 0.4s;
      margin-top: 10px;
      
      display: inline-block;
      text-align: center;
      text-decoration: none;
    }

    .btn:hover {
      background-position: right;
    }

    .btn:active {
      transform: scale(0.98);
    }

    .address {
      background-color: #dfe6e9;
      border: none;
      width: 100%;
      padding: 10px;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
    }

    .address:hover {
      background-color: #b2bec3;
    }

    /* 모달창 스타일 */
    #addressModal {
      background-color: white;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
      z-index: 1000;
      
      width: 600px;
      margin: 0 auto;
      
    }

    #addressModal input[type="text"] {
      width: calc(100% - 80px);
      padding: 10px;
      margin-right: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    #searchBtn,
    #closeModal {
      padding: 10px 15px;
      background-color: #6c5ce7;
      border: none;
      color: white;
      border-radius: 5px;
      cursor: pointer;
    }

    #searchBtn:hover,
    #closeModal:hover {
      background-color: #4b4edc;
    }

    #addressList {
      list-style: none;
      margin-top: 15px;
      max-height: 500px;
      overflow-y: auto;
      padding-left: 0;
      
      padding: 10px;
    }

    #addressList li {
      padding: 8px;
      border-bottom: 1px solid #ddd;
      cursor: pointer;
    }

    #addressList li:hover {
      background-color: #f1f1f1;
    }
    
    .modal {
    	width: 100%;
    	height: 100%;
    	display: none;
    	
    	background-color: rgba(0, 0, 0, 0.8);
    	top: 50%;
		left: 50%;
		position: fixed;
		transform: translate(-50%, -50%);
		
		flex-direction: column;
		align-items: center;
		justify-content: center;
    }
  </style>
</head>
<body>
  <form action="/emp/empUpdate" method="POST" class="joinForm">
  	<input type="hidden" name="employee_id" value="${employee.employee_id}"/>
    <h2>직원정보 수정</h2>
    <div class="textForm">
    	<input type="text" readOnly value="부서 - ${employee.department_name}"/>
    </div>

    <div class="textForm">
      	<input type="text" readOnly value="직급 - ${employee.position_name}"/>
    </div>
	
	<div class="textForm">
		<input type="text" readOnly value="근무형태 - ${employee.worktype}"/>
	</div>
	
    <div class="textForm">
      <input type="text" value="${employee.name}" placeholder="이름" readOnly/>
    </div>

    <div class="textForm">
      <input type="text" value="${employee.gender}" placeholder="성별" readOnly/>
    </div>
	
	<div class="textForm">
		<input type="text" name="password" placeholder="변경할 패스워드를 입력하세요."/>
	</div>
	
    <div class="textForm">
      <input name="email" id="email" value="${employee.email}" type="email" placeholder="이메일" style="border-color: red;" />
    </div>

    <div class="textForm">
    	<input type="hidden" id="addressCode"/>
      <button type="button" id="addressSearch" class="address">주소검색</button>
      <input type="text" id="successAddr" name="address" readonly value="${employee.address}" style="margin-top: 10px; border-color: red;" required/>
    </div>

    
    <div class="textForm">
      <input name="phone_num" id="phone" type="text" value="${employee.phone_num}" style="border-color: red;" placeholder="전화번호" required />
    </div>
    <input type="submit" id="join" class="btn" value="U P D A T E" />
    <a href="/emp/empView" class="btn">뒤로가기</a>
  </form>
  	
  <div class="modal">
    <div id="addressModal">
      <div style="display: flex;">
        <input type="text" id="searchKeyword" placeholder="도로명 주소 입력" />
        <button type="button" id="searchBtn">검색</button>
      </div>
      <ul id="addressList"></ul>
      <button type="button" id="closeModal" style="margin-top: 10px;">닫기</button>
    </div>
  </div>
  <script src="/js/address.js"></script>
<script src="/js/empCreate.js"></script>
</body>
</html>
