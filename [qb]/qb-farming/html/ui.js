var counter = 1;
var selectedPrice = 0;
var selectedLabel = "";
var selectedItem = "";

$(document).ready(function(){
    window.addEventListener('message', function( event ) {      
      if (event.data.action == 'open') {
        $('.container').css('display', 'block');  
        $('.selected').removeClass('selected')  
      } else {
        $('.container').css('display', 'none');
      }
    });

    $( ".x-row" ).on( "click", function() {
      $('.selected').removeClass('selected')
      $(this).addClass('selected')
      $('.container2').css('display', 'block')
      $('.head2 p').text($(this).attr('data-title'))
      selectedPrice = $(this).attr('data-price')
      selectedLabel = $(this).attr('data-title')
      selectedItem = $(this).attr('id')
      $('.container2-x-p-a').html("<p>Giá của hạt " + selectedLabel + ": <span class='bold'>" + selectedPrice + "</span>€</p>")
    
      $('.container2-btns2 p').html('<p>' + counter + 'x ' + selectedLabel + '</p>')
      $('.container2-btns4 p').html('<p>Giá: ' + (selectedPrice * counter) + '€</p>')
    });

    $( "#cUP" ).on( "click", function() {
      if ((counter + 1) <= 25) {
        counter++;
      }
      
      $('.container2-btns2 p').html('<p>' + counter + 'x ' + selectedLabel + '</p>')
      $('.container2-btns4 p').html('<p>Giá: ' + (selectedPrice * counter) + '€</p>')
    });

    $( "#cDOWN" ).on( "click", function() {
      if ((counter - 1) > 0) {
        counter--;
      }

      $('.container2-btns2 p').html('<p>' + counter + 'x ' + selectedLabel + '</p>')
      $('.container2-btns4 p').html('<p>Giá: ' + (selectedPrice * counter) + '€</p>')
    });

    $( "#cBUY" ).on( "click", function() {
      $('.container').css('display', 'none');
      $('.container2').css('display', 'none');
      $.post('https://qb-farming/buy', JSON.stringify({item: selectedItem, count: counter, price: selectedPrice}));
      $.post('https://qb-farming/escape', JSON.stringify({}));
    });

    $(document).keyup(function(e) {
      if (e.key === "Escape") {
        $('.container').css('display', 'none');
        $('.container2').css('display', 'none');
        $.post('https://qb-farming/escape', JSON.stringify({}));
      }
    });
});