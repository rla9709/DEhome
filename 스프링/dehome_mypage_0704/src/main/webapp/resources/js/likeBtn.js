   
function like_on() {
  var re_no = document.getElementById("re_no").value;

  $.ajax({
      url : "review_show",
      type: 'POST',
      data: { re_no : re_no, type : "likeon"  },
      //dataType: "json",

      success: function() {

			alert("해당 게시글을 관심 등록하였습니다.");

      },
      error:function (request,status,errorData) {
          alert('error code: ' + request.status + "\n"
                  + 'message: ' + request.responseText + "\n"
                  + 'error: ' + errorData);
      }
     });
  }
	
function like_off() {
	var likeoff = confirm("관심 등록을 취소하시겠습니까?");
	if (likeoff) {
		var re_no = document.getElementById("re_no").value;

		  $.ajax({
		      url : "review_show",
		      type: 'POST',
		      data: { re_no : re_no, type : "likeoff"  },
		      //dataType: "json",
		
		      success: function() {
		      
		      alert("해당 게시글의 관심 등록을 취소하였습니다.");
		          
		      },
		      error:function (request,status,errorData) {
		          alert('error code: ' + request.status + "\n"
		                  + 'message: ' + request.responseText + "\n"
		                  + 'error: ' + errorData);
		      }
		     });
	}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	