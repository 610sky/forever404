<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/album.css" />
  </head>
  <body>
  	<div class="container">
  	<button class="delete-button">🗑️</button> <!-- 삭제 버튼 추가 -->
    <div class="example">
      <h1 class="title">여행이름<span class="arrow">👇</span></h1>
      <img
        src="https://picsum.photos/600/400/?random?0"
        alt="random image"
        class="image-default"
        data-src="https://picsum.photos/600/400/?random?0"
      />
      <img
        data-src="https://picsum.photos/600/400/?random?1"
        alt="random image"
        class="image"
        data-src="https://picsum.photos/600/400/?random?1"
      />
      <img
        data-src="https://picsum.photos/600/400/?random?2"
        alt="random image"
        class="image"
        data-src="https://picsum.photos/600/400/?random?2"
      />
      <img
        data-src="https://picsum.photos/600/400/?random?3"
        alt="random image"
        class="image"
        data-src="https://picsum.photos/600/400/?random?3"
      />
      <img
        data-src="https://picsum.photos/600/400/?random?4"
        alt="random image"
        class="image"
        data-src="https://picsum.photos/600/400/?random?4"
      />
      <img
        data-src="https://picsum.photos/600/400/?random?5"
        alt="random image"
        class="image"
        data-src="https://picsum.photos/600/400/?random?5"
      />
      <img
        data-src="https://picsum.photos/600/400/?random?6"
        alt="random image"
        class="image"
        data-src="https://picsum.photos/600/400/?random?6"
      />
      <img
        data-src="https://picsum.photos/600/400/?random?7"
        alt="random image"
        class="image"
        data-src="https://picsum.photos/600/400/?random?7"
      />
       <img
        data-src="https://picsum.photos/600/400/?random?8"
        alt="random image"
        class="image"
        data-src="https://picsum.photos/600/400/?random?8"
      />
       <img
        data-src="https://picsum.photos/600/400/?random?9"
        alt="random image"
        class="image"
        data-src="https://picsum.photos/600/400/?random?9"
      />
    </div>
    </div>
     <!-- 모달 HTML 구조 -->
    <div id="modal" class="modal">
        <span class="close">&times;</span>
        <img class="modal-content" id="modal-image" />
        <div id="caption"></div>
    </div>
    <script src="${pageContext.request.contextPath}/js/album.js"></script>
  </body>
</html>
