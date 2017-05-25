function changeBorder(event){
   if (event.shiftKey){
     event.target.style.border = "2px gray dashed";
   } else {
     event.target.style.border = "5px pink dashed";
   }
}

function changeSize(event){
   var x_pos = event.x;
   var doc_width_third = document.body.clientWidth / 3;

   switch(true){
      case (event.x <= doc_width_third):
         event.target.style.fontSize = "smaller";
         break;
      case (event.x > doc_width_third * 2):
         event.target.style.fontSize = "larger";
         break;
      default:
         event.target.style.fontSize = "medium";
         break;
   }
}

var el = document.getElementsByTagName("p");

for(var i = 0; i < el.length; i++){
   el[i].addEventListener("click", changeSize, false);
}

