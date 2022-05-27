// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require('jquery')
  var balls = document.getElementsByClassName("ball")
    document.onmousemove = () => {
      var x = event.clientX * 100 / window.innerWidth + '%'
      var y = event.clientY * 100 / window.innerHeight + '%'

      for(var i = 0; i < 2; i++){
        balls[i].style.left = x
        balls[i].style.top = y
        balls[i].style.transform = 'translate(-'+x+', -'+y+')'
    }
  }
Rails.start()
Turbolinks.start()
ActiveStorage.start()
