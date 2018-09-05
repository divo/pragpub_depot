# Replace the elemnt if id "cart" with html from the cart template
cart = document.getElementById("cart")
cart.innerHTML = "<% j render(@cart) %>"
