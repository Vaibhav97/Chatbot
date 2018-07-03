<!DOCTYPE html><html lang="en">
<head>
   <title>FAQ Chatbot</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700">
  <link rel="stylesheet" href="csspage.css" type="text/css">
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script>
     $(document).ready(function() {
         $("#form1").on('submit',function(event) {
          event.preventDefault();
             servletCall();
         });

     });
    
     function servletCall() {
	var bla = $('#sometext').val();
	$.ajax({
			url : 'GetUserServlet',
			data : {name :bla},
			success : function(responseText) {
				$('#somediv').append("<div class='chat-message clearfix'><img src='user.png' alt='' width='32' height='32'><div class='chat-message-content clearfix'><h5>You</h5><p> " + bla+ "<br> </p></div> <!-- end chat-message-content --></div><hr><div class='chat-message clearfix'><img src='chat.jpg' alt='' width='32' height='32'><div class='chat-message-content clearfix'><h5>CASB Chatbot</h5><p> "  +responseText+ "<br> </p></div> <!-- end chat-message-content --></div><hr>"); 


          // bla+"<br>"+responseText+"<br>");
				$('#sometext').val('');
        $('.chat-history').animate({scrollTop: $('.chat-history').get(0).scrollHeight}, 2000);      
        // setInterval(function(){$("html, .chat-history").animate({ scrollTop: $(document).height() }, 1000);},2000);
			}
		});

     };
   </script>
    <script>

        $(document).ready(function() {
        //   $('.chat-close').on('click', function(e) {
        //   //alert("Bakchod...");
        //   e.preventDefault();
        //   $('#live-chat').fadeOut(300);

        // });
        
          $('#live-chat header').on('click', function() {

          $('.chat').slideToggle(300, 'swing');
          $('.chat-message-counter').fadeToggle(300, 'swing');

        });
    });
</script>
</head>
<body>
  <div id="live-chat">
    
    <header class="clearfix">
      
      <!-- <a href="#" class="chat-close">x</a> -->

      <h4>CASB Chatbot</h4>

      

    </header>

    <div class="chat">
      
      <div class="chat-history" id="somediv">
        <div class="chat-message clearfix">
            
            <img src="chat.jpg" alt="" width="32" height="32">

            <div class="chat-message-content clearfix">
              
              <h5>CASB Chatbot</h5>

              <p>hi</p>

            </div> <!-- end chat-message-content -->

          </div> 
<hr>
      </div> <!-- end chat-history -->

      <!--  <p class="chat-feedback">Your partner is typing…</p>  -->

<form id="form1">

          <input type="text" id="sometext" name="chatbox" placeholder="Type your message…" autofocus>
          <input type="hidden">
     </form>

          


    </div> <!-- end chat -->

  </div> 


</body>






</html>
