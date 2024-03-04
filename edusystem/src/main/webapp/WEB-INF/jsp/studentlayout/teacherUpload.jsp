<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <jsp:include page="studentHeader.jsp" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <title>Uploads Videos</title>
  </head>
  <body>
    <c:forEach var="video" items="${video_data}">
      <div class="row" style="text-align: center;">
        <div class="col-md-4">
          <video width="320" height="240" controls muted>
            <source src="videos/${video.video_name}" type="video/mp4">
          </video>
        </div>

        <div class="col-md-8">
            <br />
            Uploaded By : <label> ${video.teacher_id}</label><br /><br />
            Likes : <label status="false" video_name="${video.video_name}" onclick="show(this)">${video.likes}</label><br />
            Comments : <label>${video.comments}</label><br />
        </div>
      </div>
    </c:forEach>

    <script type="text/javascript" src="js/jqcdnlink.js"></script>
    <script type="text/javascript">
      function show(obj){
        var current_like = parseInt(obj.textContent);
        var like_status = obj.getAttribute("status");
        var video_name = obj.getAttribute("video_name");
        //alert(typeof like_status);

        $(document).ready(function(){
          $.ajax({
            url: '/updateLike',
            type: 'POST',
            dataType: 'JSON',
            data: {
              current_like: current_like,
              like_status: like_status,
              video_name: video_name
            },
            success: function(res){
              if ("false" == like_status){
                obj.setAttribute("status","true");
                obj.innerHTML = current_like+1+"";
              }else{
                obj.setAttribute("status","false");
                obj.innerHTML = current_like-1+"";
              }
            }
          });   
        })
      }
    </script>
  </body>
</html>
