function audioPlayer(){
  var currentSong = 0;
  $("#audioPlayer")[0].src = $("#playlist li a")[0];
  $("#audioPlayer")[0].play();
  $("#playlist li a").click(function(e){
    e.preventDefault();
    $("#audioPlayer")[0].src = this;
    $("#audioPlayer")[0].play();
    $("#playlist li").removeClass("current-song");
    var currentSong = $(this).parent().index();
    $(this).parent().addClass("current-song");

  });
  $("#audioPlayer").on("ended", function(){
    currentSong++;
    if (currentSong == $("#playlist li a").length){
      currentSong = 0;
    };
    $("#playlist li").removeClass("current-song");
    $("#playlist li:eq("+currentSong+")").addClass("current-song");
    $("#audioPlayer")[0].src = $(".current-song a").attr("href");
    $("#audioPlayer")[0].play();
  });
}
export { audioPlayer };
