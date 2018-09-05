# Replace the elemnt if id "cart" with html from the cart template
cart = document.getElementById("cart")
cart.innerHTML = "<%= j render(@cart) %>"

# Hide the notice if it's there
notice = document.getElementById("notice")
if notice
  notice.style.display = "none"
