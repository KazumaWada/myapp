// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require rails-ujs

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// require("trix")
// require("@rails/actiontext")
require("jquery")
import "bootstrap"
import '../src/bootstrap.scss'

document.addEventListener('DOMContentLoaded', () => {
    console.log(document.getElementById('hello'));
  });
  
  console.log('ja')

  document.addEventListener('DOMContentLoaded', () => {
    console.log(document.getElementById('hey'));
  });
  
  console.log('javascri2')


window.onload=function(){

//weatherサイドバーのタイトル色
let weathertitle = document.getElementById("weathertitle");

weathertitle.addEventListener("mouseover", function( event ) {
  // hoverしたら、
  event.target.style.color = '#ffc107';
  // 色を時間差で戻す
  setTimeout(function() {
    event.target.style.color = "red";
  }, 600);
  setTimeout(function() {
    event.target.style.color = "";
  }, 1200);
}, false);



//newsサイドバーのタイトル色
  let newstitle = document.getElementById("newstitle");
  
  newstitle.addEventListener("mouseover", function( event ) {
    // hoverしたら、
    event.target.style.color = '#ffc107';
    // 色を時間差で戻す
    setTimeout(function() {
      event.target.style.color = "red";
    }, 600);
    setTimeout(function() {
      event.target.style.color = "";
    }, 1200);
  }, false);


}
