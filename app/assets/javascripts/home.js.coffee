$ ->
  $("#wheel").click ->
    $(this).toggleClass 'paused'
    if $(this).hasClass('paused')
      matrix = $(this).css("transform")
      degrees = null
      arrMatrix = matrix.match(/[\-0-9.]+/g)
      if (parseFloat(arrMatrix[1]) is (-1 * parseFloat(arrMatrix[2]))) or (parseFloat(arrMatrix[3]) is parseFloat(arrMatrix[0])) or ((parseFloat(arrMatrix[0]) * parseFloat(arrMatrix[3]) - parseFloat(arrMatrix[2]) * parseFloat(arrMatrix[1])) is 1)
        degrees = Math.round(Math.acos(parseFloat(arrMatrix[0])) * 180 / Math.PI)
      else
        degrees = 0
      alert degrees

  $(".letter.available").click ->
    letter = $(this).text()
    $(this).removeClass("available").addClass("selected")
    n = 0
    $(".tile").each ->
      if $(this).data("letter") == letter
        n += 1
        $(this).text($(this).data("letter"))
    if n == 0
      $("#pat-sajak").text("Sorry, there are no " + letter + "'s").show()
      $("#pat-sajak").removeClass("success").addClass("failure")
    else if n == 1
      $("#pat-sajak").text("Yay! There is " + n + " " + letter).show()
      $("#pat-sajak").removeClass("failure").addClass("success")
    else
      $("#pat-sajak").text("Yay! There are " + n + " " + letter + "'s").show()
      $("#pat-sajak").removeClass("failure").addClass("success")

  $("#solve-form").submit ->
    event.preventDefault()
    guess = $("#solve-guess").val().toUpperCase()
    if guess == "DINNER AT ALINEA"
      alert "YES! CONGRATULATIONS, YOU FIGURED OUT YOUR GIFT!!!!"
    else
      alert "Sorry, not quite.  Keep trying!"