<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/default.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/index2.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FCS</title>
<style type="text/css">
/*  
 .qwer:before{content: ""; display: inline-block; width:23px; height:23px; background: url(https://ifh.cc/g/qlkXBu.jpg) no-repeat; vertical-align: middle;
 }*/
</style>

</head>
<body>
<!-- 헤더영역 -->
	<header id="header" class="index">
		<h1><a href="index"><img src="resources/images/logo.png" alt="FCS"></a></h1>
		<h2 class="hide">대메뉴</h2>
		<div id="lnb">
			<nav style="margin-top: 40px;">
				<ul>
		            <li><a href="">남성 브랜드</a>
		               <ul>
		               <li><a href="selectProductList?value=ROUGE&var=pCompany&pGender=1">ROUGE</a></li>
		               <li><a href="selectProductList?value=NOIR&var=pCompany&pGender=1">NOIR</a></li>
		                    <li><a href="selectProductList?value=BLANC&var=pCompany&pGender=1">BLANC</a></li>
		                    <li><a href="selectProductList?value=VERT&var=pCompany&pGender=1">VERT</a></li>
		                    <li><a href="selectProductList?value=ARGENT&var=pCompany&pGender=1">ARGENT</a></li>
		               </ul>
		            </li>
		            <li><a href=""> 여성 브랜드</a>
		               <ul>
			               <li><a href="selectProductList?value=ROUGE&var=pCompany&pGender=2">ROUGE</a></li>
			               <li><a href="selectProductList?value=NOIR&var=pCompany&pGender=2">NOIR</a></li>
		                   <li><a href="selectProductList?value=BLANC&var=pCompany&pGender=2">BLANC</a></li>
		                   <li><a href="selectProductList?value=VERT&var=pCompany&pGender=2">VERT</a></li>
		                   <li><a href="selectProductList?value=ARGENT&var=pCompany&pGender=2">ARGENT</a></li>
		               </ul>
		            </li>
		            <li><a href="">남성</a>
		               <ul>
			               <li><a href="selectProductList?value=12&var=pCategory&pGender=1&cName=CARDIGAN">CARDIGAN</a></li>
			               <li><a href="selectProductList?value=13&var=pCategory&pGender=1&cName=KNIT">KNIT</a></li>
			               <li><a href="selectProductList?value=14&var=pCategory&pGender=1&cName=SHIRTS">SHIRTS</a></li>
		                   <li><a href="selectProductList?value=15&var=pCategory&pGender=1&cName=JUMPER">JUMPER</a></li>
		                   <li><a href="selectProductList?value=16&var=pCategory&pGender=1&cName=PANTS">PANTS</a></li>
		               </ul>
		            </li>
		            <li><a href="">여성</a>
		               <ul>
		                    <li><a href="selectProductList?value=21&var=pCategory&pGender=2&cName=KNIT">KNIT</a></li>
		               <li><a href="selectProductList?value=22&var=pCategory&pGender=2&cName=PANTS">PANTS</a></li>
		               <li><a href="selectProductList?value=23&var=pCategory&pGender=2&cName=BLOUSE">BLOUSE</a></li>
		                    <li><a href="selectProductList?value=24&var=pCategory&pGender=2&cName=DRESS">DRESS</a></li>
		                    <li><a href="selectProductList?value=26&var=pCategory&pGender=2&cName=PANTS">SKIRTS</a></li>
		               </ul>
		            </li>
		            <li><a href="">etc</a>
		               <ul>
			               <li><a href="selectProductList?value=31&var=pCategory&pGender=3&cName=BELT">BELT</a></li>
			               <li><a href="selectProductList?value=32&var=pCategory&pGender=3&cName=BAG">BAG</a></li>
			               <li><a href="selectProductList?value=33&var=pCategory&pGender=3&cName=Shoes">SHOES</a></li>
		               </ul>
		            </li>
		         </ul>
			</nav>
			<div></div>
		</div>
		<h2 class="hide">회원</h2>
		<c:if test="${empty loginDTO }">
			<ul style="height: 0px; margin:0px; padding-top: 10px; padding-left: 10px;">
				<li style="color: white;">FCS</li>
				<li ><a href="loginPage" style="color: white;">LOGIN</a></li>
				<li><a href="insertPage" style="color: white;">JOIN</a></li>
			</ul>
		</c:if>
	<c:if test="${not empty loginDTO }">
		<c:if test="${loginDTO.mId ne 'admin' }">
			<ul style="height: 0px; margin:0px; padding-top: 10px; padding-left: 10px;">
				<li style="text-align: center; color: white;" >${loginDTO.mName } 님</li>
				<li style="color: white;"><a class="qwer1" href="logout" style="color: white;">로그아웃</a></li>
				<li style="color: white;"><a class="qwer2" href="myPage" style="color: white;">마이페이지</a></li>
				<li style="color: white;"><a class="qwer3" href="cartListPage?mId=${loginDTO.mId }" style="color: white;">장바구니</a></li>
			</ul>
		</c:if>
		<c:if test="${loginDTO.mId eq 'admin' }">
			<ul style="height: 0px; margin:0px; padding-top: 10px; padding-left: 10px;">
				<li style="color: white;">${loginDTO.mName } 님</li>
				<li style="color: white;"><a href="logout" style="color: white;">로그아웃</a></li>
				<li style="color: white;"><a href="adminPage" style="color: white;">관리 페이지</a></li>
			</ul>
		</c:if>
	</c:if>