<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
  .tracker {
    width: 100%;

    border-collapse: collapse;
    text-align: center;    
    vertical-align: center;
  }
  .tracker tr {
    border-top: 1px solid #444444;
  }
  .tracker td {
  	padding: 20px
  }
  
  /**
 * Created by yyh on 2020. 1. 29..
 */

@font-face {font-family: 'NotoSansCJKkr-R';font-style: normal;font-weight: 400;
    src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),
    url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),
    url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');
}

@font-face {font-family: 'NotoSansCJKkr-M';font-style: normal;font-weight: 500;
    src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),
    url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),
    url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');
}

@font-face {font-family: 'NotoSansCJKkr-DL';font-style: normal;font-weight: 300;
    src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),
    url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),
    url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');
}

body {
    font-family: NotoSansCJKkr-R;
    font-size: 13px;
}

.no-padding {
    padding: 0px !important;
}

.header-area {
    height: 60px;
    text-align: center;
    padding-top: 15px;
    font-size: 20px;
}

.title-area {
    border-top: 1px solid #d8d8d8;
    height: 48px;
    background-color: #f5f5f5;
}

.title-content {
    font-family: NotoSansCJKkr-M;
    padding: 10px 0 0 15px;
    font-size: 16px;
    color: #212121;
}

.info-area {
    margin: 25px 0 25px 0;
}

.info-back-line {
    position: relative;
}

.info-parcel-text-active {
    font-family: NotoSansCJKkr-M;
    font-size: 12px;
    font-weight: 500;
    color: #0400ffd1;
    margin-top: 6px;
}

.info-parcel-text-none {
    font-family: NotoSansCJKkr-DL;
    font-size: 10px;
    font-weight: 500;
    color: #757575;
    margin-top: 6px;
}

.info-back-line:before {
    content: '';
    position: absolute;
    background-color: #e2e5e8;
    height: 1px;
    top: 25px;
    right: 13%;
    left: 6%;
}

.notice-area {
    padding: 15px 0 15px 0;
}

.label-style {
    font-weight: normal;
    color: #aaaaaa;
    font-size: 14px;
}

.info-style {
    font-weight: normal;
    color: #212121;
    font-size: 14px;
    padding-left: 0px !important;
}

.cs_delivery .delivery_bx .delivery_history:before {
    content: '';
    position: absolute;
    height: 2px;
    background-color: #e2e5e8;
    top: 43px;
    right: 6%;
    left: 6%;
}

.arrow-area {
    display: inline-block;
}

i {
    border: solid black;
    border-width: 0 3px 3px 0;
    display: inline-block;
    padding: 3px;
}

.right {
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg);
}

.parcel-img {
    width: 50px;
    height: 50px;
}

.parcel-img-select {
    width: 55px;
    height: 55px;
    filter: drop-shadow(1px 1px 3px black);
    border-radius: 50%;
}

.table-header {
    background-color: #f5f5f5;
}

.table-header tr {
    height: 48px !important;
}

.table > thead > tr > th {
    font-family: NotoSansCJKkr-M;
    font-size: 13px;
    color: #757575;
    vertical-align: bottom;
    border-bottom: 0px;
    padding: 14px;
}

.table > tbody > tr {
    border-bottom: 1px solid #e1e1e1;
}

.table > tbody > tr > td {
    font-family: NotoSansCJKkr-DL;
    padding: 11px;
    line-height: 1.42857143;
    vertical-align: middle !important;
    border-top: 0px;
    color: #757575;
}

.table > tbody :first-child > td {
    font-family: NotoSansCJKkr-M;
    color: #212121 !important;
}

.td-time {
    width: 33%;
    text-align: center;
}

.td-location {
    width: 33%;
    text-align: center;
    text-overflow: ellipsis;
    overflow: hidden;

}

.td-status {
    width: 33%;
    text-align: center;
    text-overflow: ellipsis;
    overflow: hidden;
}
/* bootstrap 테이블 커스터 마이징 end */

.col-xs-15,
.col-sm-15,
.col-md-15,
.col-lg-15 {
    position: relative;
    min-height: 1px;
}

.col-xs-15 {
    width: 20%;
    float: left;
}

@media (min-width: 768px) {
    .col-sm-15 {
        width: 20%;
        float: left;
    }
}

@media (min-width: 992px) {
    .col-md-15 {
        width: 20%;
        float: left;
    }
}

@media (min-width: 1200px) {
    .col-lg-15 {
        width: 20%;
        float: left;
    }
}
  
  
</style>
<meta charset="EUC-KR">
</head>
<body>
	<div id="modal2">
		<div class="modal-bg">
			 <div class="modal-cont" style="overflow-y:scroll;">

			<table class="tracker">
				<tbody id="myPtag">
				
				</tbody>
				<tbody id="myPtag2">
				
				</tbody>
				<tbody id="myPtag3">
				
				</tbody>
			</table>
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
