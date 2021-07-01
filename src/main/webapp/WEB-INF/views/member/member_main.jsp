<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Travel Stroy</title>
<meta charset="utf-8">
<script src="../../resources/js/jquery.js"></script>
<script src="../../resources/js/popper.min.js"></script>
<script src="../../resources//js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
<link rel="stylesheet" href="../../resources/css/home.css">
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lexend+Mega&display=swap" rel="stylesheet">
</head>
<body>

<div class="container">
<header>
 <div class="c_header">
 <a class="title" href="member_main">Travel Story</a>
 </div>
  <div class="header_menu" >
    <a href="member_story" class="menu-item">Story</a>
    <a href="community_list" class="menu-item">Community</a>
    <a href="member_mystory" class="menu-item">MyStory</a>
    <a href="member_logout" class="menu-item">Logout</a>
  </div>
</header> 
<main>
<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="row">
             <a href="../resources/img/img1.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img1.JPG" class="img-fluid rounded">
            </a>
            <a href="../resources/img/img17.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img17.JPG" class="img-fluid rounded">
            </a>
            <a href="../resources/img/img4.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img4.JPG" class="img-fluid rounded">
            </a>
             <a href="../resources/img/img6.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img6.JPG" class="img-fluid rounded">
            </a>
            <a href="../resources/img/img10.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img10.JPG" class="img-fluid rounded">
            </a>
            <a href="../resources/img/img12.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img12.JPG" class="img-fluid rounded">
            </a>
             <a href="../resources/img/img14.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img14.JPG" class="img-fluid rounded">
            </a>
            <a href="../resources/img/img15.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img15.JPG" class="img-fluid rounded">
            </a>
            <a href="../resources/img/img16.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img16.JPG" class="img-fluid rounded">
            </a>
             <a href="../resources/img/img25.JPG" data-toggle="lightbox" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용" >
                <img src="../resources/img/img25.JPG" class="img-fluid rounded">
            </a>
            <a href="../resources/img/img22.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용">
                <img src="../resources/img/img22.JPG" class="img-fluid rounded">
            </a>
            <a href="../resources/img/img21.JPG" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" data-title="모달 제목" data-footer="모달 푸터내용" >
                <img src="../resources/img/img21.JPG" class="img-fluid rounded">
            </a>
        </div>
    </div>
</div>

<script>
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});
</script>
</main>
<footer class="footer">
 <div class="f_cont">
  <p>CopyRight seob__b</p>
 	<a href="https://blog.naver.com/seob_b" target="_blank"  class="f_footer_item">
   <img alt="naver" src="../resources/img/blog.png" class ="f_footer_img" style="width: 19px; height: 19px; object-fit: cover;"></a>
  	<a href="https://www.instagram.com/seob__b/" target="_blank"  class="f_footer_item">
   <img alt="insta" src="../resources/img/insta.png" class="f_footer_img" style="width: 19px; height: 19px; object-fit: cover;"></a>
   </div>
</footer>
</div>
</body>
</html>


 
