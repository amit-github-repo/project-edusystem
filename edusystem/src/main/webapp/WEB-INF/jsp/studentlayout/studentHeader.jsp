<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  </head>
  <body>
    <header class="p-3 text-bg-dark">
      <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
          <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
          </a>
          <h4>Student Dashboard</h4>
          <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/studentDashboard" class="nav-link px-2 text-secondary">Home</a></li>
            <li><a href="#" class="nav-link px-2 text-white">Faculty</a></li>
            <li><a href="#" class="nav-link px-2 text-white">Student</a></li>
            <li><a href="/studentDoubt" class="nav-link px-2 text-white">Doubt</a></li>
            <li><a href="/examPage" class="nav-link px-2 text-white">Exam</a></li>
            <li><a href="/teacherUpload" class="nav-link px-2 text-white">Videos</a></li>
            <li><a href="/profile" class="nav-link px-2 text-white">Profile</a></li>
          </ul>
          
          <div class="text-end">
            <button type="button" class="btn btn-warning"><a style="text-decoration:none"  href="/updateProfile?page=studentDashboard">Update</a></button>
            <button type="button" class="btn btn-outline-light me-2" ><a style="text-decoration:none" href="/logout">Logout</a></button>
          </div>
        </div>
      </div>
    </header>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
  </body>
</html>