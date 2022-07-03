//= require loading_screen
//= require nprogress
//= require nprogress-turbolinks
//= require nprogress-ajax
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require('jquery')
Rails.start()
Turbolinks.start()
ActiveStorage.start()
