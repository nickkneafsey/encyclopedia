$( document ).ready(function() {
  var playerImagePhoto = document.getElementById("image_picture");
  if (playerImagePhoto){
   playerImagePhoto.onchange = function () {
      var reader = new FileReader();

      reader.onload = function (e) {
          // get loaded data and render thumbnail.
          document.getElementById("image-preview").src = e.target.result;
      };

      // read the image file as a data URL.
      reader.readAsDataURL(this.files[0]);
    };
  }
});
