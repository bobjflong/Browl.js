
browl_timeout = 1000  

update_browls = () ->
  browls = document.getElementsByClassName 'browl'
  for browl in browls
    original_timeout = browl.getAttribute 'data-originaltimeout'
    if not original_timeout?
      browl.setAttribute 'data-originaltimeout', browl.getAttribute 'data-timeout'
    else
      timeout_attr = browl.getAttribute 'data-timeout'
      timeout = parseInt timeout_attr
      if timeout <= 0
        #Notification is finished
        browl.classList.add 'finished'
        setTimeout () ->
          #Collect garbage
          if browl.parentNode?
            browl.parentNode.removeChild(browl)
        , 5000
      else
        new_timeout = timeout - 1
        browl.setAttribute 'data-timeout', new_timeout
    
  setTimeout update_browls, browl_timeout

create_browl_styles = () ->
  browl_css = """
      .browl {
        position: fixed;
        top:30px;
        right: 0px;
        margin: 40px;
        min-width: 200px;
        height:20px;
        padding: 20px;
        
        border-radius: 10px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        
        background: #ffffff; /* Old browsers */
        background: -moz-linear-gradient(top, #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%, #f6f6f6 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(50%,#f1f1f1), color-stop(51%,#e1e1e1), color-stop(100%,#f6f6f6)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* IE10+ */
        background: linear-gradient(to bottom, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0 ); /* IE6-9 */
        border:1px solid #f0f0f0;
        
        -webkit-box-shadow: 0px 3px 6px rgba(50, 50, 50, 0.3);
        -moz-box-shadow:    0px 3px 6px rgba(50, 50, 50, 0.3);
        box-shadow:         0px 3px 6px rgba(50, 50, 50, 0.3);
        
        font-family:Sans-Serif;
        color:#505050;
        font-size:13px;
        
      }
      
      .browl {
        -moz-animation-duration: 1s;
        -webkit-animation-duration: 1s;
        -moz-animation-name: slidein;
        -webkit-animation-name: slidein;
      }
      
      @-moz-keyframes slidein {
        from {
          opacity:0;
          top:-50;
        }
        
        to {
          opacity:1;
          top:30px;
        }
      }
      
      @-webkit-keyframes slidein {
        from {
          opacity:0;
          top:-50;
        }
        
        to {
          opacity:1;
          top:30px;
        }
      }
      
      .finished {
        -moz-animation-duration: 1s;
        -webkit-animation-duration: 1s;
        -moz-animation-name: slideout;
        -webkit-animation-name: slideout;
        opacity:0;
      }
      
      @-moz-keyframes slideout {
        from {
          opacity:1;
          top:31;
        }
        
        to {
          opacity:0;
          top:70px;
          display:none;
        }
      }
      
      @-webkit-keyframes slideout {
        from {
          opacity:1;
          top:31;
        }
        
        to {
          opacity:0;
          display:none;
          top:70px;
        }
      }
  """
  
  browl_style = document.createElement 'style'
  browl_style.innerHTML = browl_css
  document.body.appendChild browl_style
  
browl = () ->
  create_browl_styles()
  setTimeout update_browls, browl_timeout
  
browl()