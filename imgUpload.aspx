<%@ Page Language="C#" AutoEventWireup="true" CodeFile="imgUpload.aspx.cs" Inherits="imgUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="js/imageuploadpreview.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="file" id="upload" runat="server" style="width:400px; padding:3px;"/>

  <div id="file-info"></div>
    </div>
    </form>
    <script type="text/javascript">
  (function() {
    var demo = new ImageUploadPreview(
        
        // Upload Input Element
        document.getElementById('upload'),

        // onPreviewSuccess handler.
        function(imgInfo) {
          var info = [];
          for (var i in imgInfo) {
            info.push('<li>', i, ' = ', imgInfo[i], '</li>');
          }

          if (info.length) {
            info.unshift('<ul>');
            info.push('</ul>');
          }
          alert(this.getImageElement());
          this.getImageElement().className = 'preview-image';
        //  document.getElementById('file-info').innerHTML = info.join('');
        },

        // onPreviewFail handler.
        function() {
          this.getImageElement().className = '';
        });

    demo.setMaxImageSize(demo.getInputElement().offsetWidth, 300);


    // If the value already exists, try display image.
    demo.preview();
  })();
</script>
</body>
</html>
