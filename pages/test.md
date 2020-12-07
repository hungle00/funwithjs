## Javascrit note

    $("#right").bind("contextmenu",function(e){  
        //Trong này có thể viết hàm xử lý gì đó tùy bạn  
        alert('Right mouse click forbidden!')  
        // Return false để loại bỏ thao tác với chuột phải  
        return false;  
    });  