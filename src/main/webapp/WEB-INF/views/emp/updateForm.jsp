<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>결근&조퇴 신청서 수정</title>
</head>
<body>
    <h1>결근&조퇴 신청서 수정</h1>
    <p>내용을 수정해주세요, ${employeeDTO.name}님!</p>

    <form action="/lateness/eatUpdate" method="post">
        날짜: <input type="date" name="ness_date" value="${latenessDTO.ness_date}"><br>
              <input type="hidden" name="original_ness_date" value="${latenessDTO.ness_date}">
        유형:
        <select name="atte_flag">	
			<option value="3" ${latenessDTO.atte_flag == 3 ? 'selected' : ''}>조퇴</option>
			<option value="4" ${latenessDTO.atte_flag == 4 ? 'selected' : ''}>결근</option>
        </select><br>
        내용: <textarea name="content" required>${latenessDTO.content}</textarea><br>
        
        <input type="hidden" name="employee_id" value="${latenessDTO.employee_id}">
        <input type="hidden" name="status" value="0">
        
        <button type="submit">수정하기</button>
        
         <button type="submit" formaction="/lateness/eatUpdateNew">새로운 방식 수정</button>
    </form>

    <a href="/lateness/eatView">목록으로 돌아가기</a>

</body>
</html>