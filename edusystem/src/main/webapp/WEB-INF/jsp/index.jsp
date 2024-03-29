<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Education System</title>
    <jsp:include page="anolayout/header.jsp" />
    <link rel="stylesheet" type="text/css" href="css/indexstyle.css">
  </head>
  <body>
    <%-- carousel code --%>
    <header>

      <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active" style="background-image: url('https://source.unsplash.com/RCAhiGJsUUE/1920x1080')">
            <div class="carousel-caption">
              <h5>First slide label</h5>
              <p>Some representative placeholder content for the first slide.</p>
            </div>
          </div>
          <div class="carousel-item" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1920x1080')">
            <div class="carousel-caption">
              <h5>Second slide label</h5>
              <p>Some representative placeholder content for the second slide.</p>
            </div>
          </div>
          <div class="carousel-item" style="background-image: url('https://source.unsplash.com/lHGeqh3XhRY/1920x1080')">
            <div class="carousel-caption">
              <h5>Third slide label</h5>
              <p>Some representative placeholder content for the third slide.</p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </header>

    <!-- Page Content -->
    <section class="py-5">
      <div class="container">
        <h1 class="fw-light">Half Page Image Slider</h1>
        <p class="lead">The background images for the slider are set directly in the HTML using inline CSS. The images
          in this snippet are from <a href="https://unsplash.com">Unsplash</a>!</p>
      </div>
    </section>
    <%--  Testing the Session data is null or not
    <h1>Welcome Faculty: <% out.println(session.getAttribute("name")); %></h2>
    <h2>Your Id: <% out.println(session.getAttribute("email")); %></h2> 
    --%>

    <%-- footer code --%>
    <jsp:include page="anolayout/footer.jsp" />
  </body>
</html>
