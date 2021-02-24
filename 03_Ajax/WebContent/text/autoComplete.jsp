<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax - autoComplete</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<h1>Auto Complete</h1>
	<div class="wrapper">
		<input type="text" id="searchName"/>
	</div>
	<script>
	function ajaxSearchName(request, response){
		$.ajax({
			url : "<%=request.getContextPath()%>/autoComplete",
			data : {
				searchName : request.term
			},
			method : "GET",
			dataType : "text",
			success : function(data){
				console.log(data);
				
				var arr = data.split(",");
				console.log(arr);
				/*
				[
					{label : '강유정', value : '강유정'},
					{label : '이효정', value : '이효정'},
					{label : '정다미', value : '정다미'},
				]
				*/
				arr = $.map(arr, function(str){
					//배열요소 -> 변경처리 -> 요소리턴
					return {
						label : str,
						value : str
					};
				});
				
				console.log(arr);
				//검색어 목록 작성
				response(arr);
			},
			error : function(xhr, status, err){
				console.log(xhr, status, err);	
			}
		});
	}
	
//	var a = [1,2,3];
// 	var other = $.map(a, function(num){
// 		return num * num;
// 	});
// 	console.log(a);
// 	console.log(other);
	
	$("#searchName").autocomplete({
		//source는 배열 또는 함수를 받는다.
//		source : ['Apple', 'application', 'appear', 'abcde'],
		source : function(request,response){
			console.log(request);  //사용자 입력값을 포함하는 객체
			console.log(response); //자동검색어 목록을 만들기 위한 함수
			
			//서버 비동기 통신
			ajaxSearchName(request, response);
			
		}, //end of source
		minLength : 1, //최소 입력값
		delay : 500,    //살짝의 지연시간
		focus : function(e, focus){
			//포커스를 얻을 때 선택되지 않도록 함
			return false;
		}
	});
	
	/*
	$("#searchName").keyup(function(){
		console.log($(this).val());
		if($(this).val().length==0)
			return;
		
		$.ajax({
			url : "<%=request.getContextPath()%>/autoComplete",
			data : {
				searchName : $(this).val()
			},
			method : "GET",
			dataType : "text",
			success : function(data){
				console.log(data);
				
				var arr = data.split(",");
				console.log(arr);
			},
			error : function(xhr, status, err){
				console.log(xhr, status, err);	
			}
		});
	
	});
	*/
	</script>
	
</body>
</html>