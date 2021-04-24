// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
window.addEventListener('load', function () {
	viewSlide('.top_image');
});
function viewSlide(className, slideNo = -1)
{
	let imgArray = document.querySelectorAll(className);
	if (slideNo >= 0) {
		//初回以外は現在のスライドを消す
		imgArray[slideNo].style.opacity = 0;
	}
	slideNo++;
	if (slideNo >= imgArray.length) {
		slideNo = 0; //次のスライドがなければ最初のスライドへ戻る
	}
	imgArray[slideNo].style.opacity = 1;
	let msec = document.getElementById('slide_speed').value;
	setTimeout(function(){viewSlide(className, slideNo);}, msec);
}