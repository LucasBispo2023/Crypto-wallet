// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./src/jquery"
import * as bootstrap from "bootstrap"

$(function(){
    console.log("jQuery is working!!!!!")
})