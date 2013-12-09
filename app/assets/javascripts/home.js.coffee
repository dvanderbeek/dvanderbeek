$ ->
  $("body").on "click", ".letter.available", ->
    letter = $(this).text()
    $(this).removeClass("available").addClass("selected")
    n = 0
    $('*[data-letter='+letter+']').each (k, v) ->
      el = this
      n += 1
      setTimeout (->
        $(el).text(letter).removeClass("blank")
      ), k * 500
    if n == 0
      $("#pat-sajak").hide().clearQueue() 
      $("#pat-sajak").removeClass("success").addClass("failure").text("Sorry, there are no " + letter + "'s").fadeIn(100).delay(3000).fadeOut(100)
    else if n == 1
      $("#pat-sajak").hide().clearQueue()
      $("#pat-sajak").removeClass("failure").addClass("success").text("Yay! There is " + n + " " + letter).fadeIn(100).delay(3000).fadeOut(100)
    else
      $("#pat-sajak").hide().clearQueue() 
      $("#pat-sajak").removeClass("failure").addClass("success").text("Yay! There are " + n + " " + letter + "'s").fadeIn(100).delay(3000).fadeOut(100)

  $("#solve-form").submit ->
    event.preventDefault()
    guess = $("#solve-guess").val().toUpperCase()
    if guess == "DINNER AT ALINEA"
      $("#solve").modal('hide')
      $("#pat-sajak").hide().clearQueue() 
      $("#pat-sajak").removeClass("failure").addClass("success").text("CONGRATULATIONS, YOU FIGURED OUT YOUR GIFT!!!!").fadeIn(100)
      $("#solve-trigger").hide()
      $("#letters").hide()
      $('body').find(".tile.active.blank").each (k, v) ->
        el = this
        letter = $(el).data("letter")
        setTimeout (->
          $(el).text(letter).removeClass("blank")
        ), k * 500
    else
      $("#solve").modal('hide')
      $("#pat-sajak").hide().clearQueue() 
      $("#pat-sajak").removeClass("success").addClass("failure").text("Sorry, not quite.  Keep trying!").fadeIn(100).delay(3000).fadeOut(100)

  $("#solve").on "shown.bs.modal", (e) ->
    $("#solve-guess").trigger("focus")