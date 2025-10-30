<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadFile.aspx.cs" Inherits="Extuent.uploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src=
"https://code.jquery.com/jquery-3.6.0.min.js">
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <script>
        function uploadBlob() {
            const blob = new Blob(
                ["This is some important text"],
                { type: "text/plain" }
            );
  
            // Creating a new blob  
            $.ajax({
  
                // Hostname and port of the local server
                url: "http://localhost:60242/uploadFile.aspx/Save",
  
                // HTTP request type
                type: "POST",
  
                // Sending blob with our request
                data: blob,
                processData: false,
                contentType: false,
                success: function (data) {
                    alert('Blob Uploaded')
                },
                error: function (e) {
                    alert(e);
                }
            });
  
        }
        $(document).on('load', uploadBlob());
    </script>
    </form>
</body>
</html>
