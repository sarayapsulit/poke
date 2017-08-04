$(document).ready(function() {

  // JavaScript code goes here
  // var canvas = document.getElementById("myCanvas");
  // var ctx = canvas.getContext("2d");
  //
  // var yourPokemon = {
  //   hp: 100,
  // 	speed: 256,
  // 	x: 0,
  // 	y: 0,
  // };
  // var enemyPokemon = {
  // 	x: 500,
  // 	y: 50,
  // };
  // yourPic = document.getElementById("poke");
  // enemyPic = document.getElementById("enemy");
  // ctx.drawImage(yourPic, yourPokemon.x, yourPokemon.y);
  // ctx.drawImage(enemyPic, enemyPokemon.x, enemyPokemon.y);
  // ctx.fillStyle = 'rgb(200,0,0)'
  // var bgReady = false;
  // var bgImage = new Image();
  // bgImage.onload = function () {
  // 	bgReady = true;
  // };
  // bgImage.scr = '/js/download.png';



	// ctx.font = "16px Helvetica";
	// ctx.textAlign = "left";
	// ctx.textBaseline = "top";
	// ctx.fillText("Your attack ", 150 , 350);
//
// listner
// ajax
//
// data
//
// response= 85
// update dom
// listner


  $(".attack").on("submit", function(event){
    event.preventDefault();
    var $this = $(this);
    var $enemy_stats =$(".enemy");

    // $("#yourPokemon").animate({left: '250px'});


      $( "#yourPokemon img" ).animate({
        marginLeft: '+=78px'
      }, 10, function() {
      });

      $( "#yourPokemon img" ).animate({
        marginLeft: '-=78px'
      }, 30, function() {
      });
      if ($enemy_stats.text() <= "0"){
         $(".enemyPokemon").slideUp();
         $(".gameover").append("<a href='/users/"+ currentUserId+ "'> Enemy Pokemon Fainted </a>")
       }

    $.ajax({
      url: $this.attr("action"),
      type: $this.attr("method"),
      data: $this.serialize()
    })
    .done(function(response){
    var stats = (parseInt($enemy_stats.text()) - parseInt(response));
    $enemy_stats.text(stats)
    });
  });
});
