<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기 페이지</title>
     <script src="https://cdn.jsdelivr.net/npm/dropzone@6.0.0-beta.2/dist/dropzone-min.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/dropzone@6.0.0-beta.2/dist/dropzone.min.css">

    <script defer src="/resources/boardWrite.js"></script>
    
</head>
<body>

    <h2>파일 업로드</h2>

    <!-- 드롭존 영역 -->
    <div id="myDropzone" class="dropzone">
        <div class="fallback">
            <input type="file" name="file" multiple />
        </div>
    </div>

    <!-- 선택된 파일 정보 출력 -->
    <div id="selectedFiles"></div>

    <!-- 스크립트 -->
    <script>
        Dropzone.autoDiscover = false;
        var myDropzone = new Dropzone("#myDropzone", {
            url: "/upload",
            paramName: "file",
            maxFilesize: 4,
            maxFiles: 4,
            acceptedFiles: ".jpg, .jpeg, .png, .gif",
            dictDefaultMessage: "여기에 파일을 끌어 놓거나 클릭하세요.",
            addRemoveLinks: true
        });

        myDropzone.on("addedfile", function (file) {
            // 파일이 추가될 때 호출되는 콜백
            console.log("파일 추가:", file);
        });

        myDropzone.on("removedfile", function (file) {
            // 파일이 제거될 때 호출되는 콜백
            console.log("파일 제거:", file);
        });

        myDropzone.on("success", function (file, response) {
            // 파일 업로드 성공 시 호출되는 콜백
            console.log("파일 업로드 성공:", response);
        });
    </script>

</body>
</html>

   