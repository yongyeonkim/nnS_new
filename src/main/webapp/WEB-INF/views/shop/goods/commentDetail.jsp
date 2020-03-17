<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
  .comments {
    width: 100%;

    border-collapse: collapse;
    border-style: solid;
    border: 1px;
  	padding: 20px;
    text-align: center;    
    vertical-align: center;
  }
  
  .comments th {
  	background: #ffda73;
  	font-size: 12px;
  	text-decoration: inherit;
  }

  .comments tr {
  
  }
  
  .comments td {
    border-style: solid;
    border: 1px;
  	padding: 20px;
  	font-size:11px;
  }
  
  .contentClass{
	background-color:white;
	border-radius:10px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    border: 1px dashed #cecece;
    padding:15px;
	
	}
	.contentClass p{
		background-color:white;
	}
</style>
<meta charset="EUC-KR">
</head>
<body>
	<div id="modal">
		<div class="modal-bg">
			 <div class="modal-cont">

			<form id="frm2" name="frm2">
			<table class="comments">
				<tbody id="commentDetail_a" class="contentClass">
				
				</tbody>
			</table>
			</form>
			<a href="#" class="close close1">
                <svg viewBox="0 0 24 24">
                    <path d="M14.1,12L22,4.1c0.6-0.6,0.6-1.5,0-2.1c-0.6-0.6-1.5-0.6-2.1,0L12,9.9L4.1,2C3.5,1.4,2.5,1.4,2,2C1.4,2.5,1.4,3.5,2,4.1
    L9.9,12L2,19.9c-0.6,0.6-0.6,1.5,0,2.1c0.3,0.3,0.7,0.4,1.1,0.4s0.8-0.1,1.1-0.4l7.9-7.9l7.9,7.9c0.3,0.3,0.7,0.4,1.1,0.4
    s0.8-0.1,1.1-0.4c0.6-0.6,0.6-1.5,0-2.1L14.1,12z"/>
			</svg>
            </a>


			</div>
		</div>
	</div>
</body>
</html>
