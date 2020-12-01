<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	 $(document).ready(function(){
		 $(".nav-toggle").click(function(){
			 $("#sidebar-wrapper").toggleClass("active")
		 })
	 })
	
</script>
  <!-- Navbar - OPEN -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="navbar">

        <!-- Navbar content - OPEN -->
        <div class="container-lg">
            <!-- Logo - OPEN -->
            <a class="navbar-brand logo" href="home.do">
                <img src="${pageContext.request.contextPath}/resources/media/images/logo.png" width="80" alt="">
            </a>
            <!-- Logo - CLOSE -->

            <!-- Toogle responsive - OPEN -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Toogle responsive - CLOSE -->

            <!-- Content collapse - OPEN -->
            <div class="collapse navbar-collapse" id="navbarToggler">

                <!-- Left - OPEN -->
                <ul class="navbar-nav mr-auto my-2 my-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link navbar-nav-item" href="#">
                            홈<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#">
                            TV프로그램
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-nav-item" href="#">
                            영화
                        </a>
                    </li>
                </ul>
                <!-- Left - CLOSE -->

                <!-- Right - OPEN -->
                <ul class="navbar-nav my-2 my-lg-0 navbar-right">
                    <li class="nav-item">
                        <a class="nav-link float-center" href="#">
                            <img src="${pageContext.request.contextPath}/resources/media/icons/search.png" width="20" alt="">
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link float-center" href="#">
                            <img src="${pageContext.request.contextPath}/resources/media/icons/bell.png" width="20" alt="">
                        </a>
                    </li>
                     <li class="nav-item nav-toggle">
                        <a class="nav-link float-center " href="#">
                        <span class="navbar-toggler-icon"></span>
                        </a>
                    </li>			
                </ul>
                <!-- Right - OPEN -->
           
	
            </div>
            <!-- Content collapse - CLOSE -->
            <!-- Home Menu - OPEN -->
			 <nav id="sidebar-wrapper">
			    <ul class="sidebar-nav">
			      <li class="sidebar-brand" style="background-color:black;">
			        메뉴
			      </li>
			      <!--로그인 여부 판단  -->
			      <c:choose>
			      	<c:when test="${sessionScope.mvo==null }">
						<li class="sidebar-nav-item">
						  <a class="js-scroll-trigger" href="${pageContext.request.contextPath}/loginForm.do">로그인/회원가입</a>
						</li>
			      	</c:when>
					<c:otherwise>
						<li class="sidebar-nav-item">
						   <a class="js-scroll-trigger" href="#page-top">로그아웃</a>
						 </li>
						 <li class="sidebar-nav-item">
						  <a class="js-scroll-trigger" href="#about">마이페이지</a>
						</li>
					</c:otherwise>						      
			      </c:choose>
			      <li class="sidebar-nav-item">
			        <a class="js-scroll-trigger" href="#services">파티게시판</a>
			      </li>
			      <li class="sidebar-nav-item">
			        <a class="js-scroll-trigger" href="#portfolio">공지사항</a>
			      </li>
			      <li class="sidebar-nav-item">
			        <a class="js-scroll-trigger" href="#contact">고객센터</a>
			      </li>
			      <li class="sidebar-nav-item">
			        <a class="js-scroll-trigger" href="#contact">포인트마켓</a>
			      </li>
			    </ul>
 			 </nav>
		   <!-- Home Menu - CLOSE -->
        </div>
        <!-- Navbar content - CLOSE -->
                    
    </nav>
    <!-- Navbar - CLOSE -->
     
    