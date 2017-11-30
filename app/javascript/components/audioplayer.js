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
  $("#audioPlayer").click(function(e){
    alert("Vous avez perdu un proche, il est temps d'affronter la dure réalité")

  });
}
export { audioPlayer };
