function don(val){
    var element = val.nextElementSibling;

    if(element.className == 'hide'){
      element.setAttribute('class','show');
    }
    else {
      element.setAttribute('class','hide');
    }
}