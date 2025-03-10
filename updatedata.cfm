 <cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>API TASK LIST</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<!---     <link rel="stylesheet" href="css/styles.css"> --->
</head>
<body> 

    <div class="row justify-content-center">
        <h2 class="text-primary text-center mt-3">UPDATE DATA USING API</h2>
     <form action="" method="POST" id="editform" class="border rounded shadow-sm bg-light form-inline">
        <div class="form-group mb-2">    
        <label for="title" id="label-title" class="form-label fw-bold"> TITLE</label>
            <input type="text"  name="title" id="title" value="$('##title').val()">
      
        <label for="description" id="label-description" class="form-label fw-bold"> DESCRIPTION</label>
            <input type="text" name="description" id="description" value=" $('##description').val()">
        <button type="submit" id="savebtn" class="btn btn-warning btn-sm">save</button>
        </div>

    </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        var baseurl="http://127.0.0.1:8500/rest/hello/getitemdetails";
         function getitemdetails(id) {
        $.ajax({
            url: baseurl,
            type: "GET",
            headers: { id: id },
            dataType: "json",
            success: function(response) {
                
            if(response.DATA && response.DATA.length > 0){
                 var item = response.DATA[0];
                    $('##title').val(item[0]);
                    $('##description').val(item[1]);
            }
            },
            
             error: function(xhr, status, error) {
                console.error("Error fetching details:", error);
         }
            
    });    
    }

 $(document).ready(function(){
    var urlParams = new URLSearchParams(window.location.search);
        var id= urlParams.get('id');
       getitemdetails(id)
        // updateDetails(id)
       $("##editform").submit(function(event) {
            event.preventDefault(); 
        // Prevent form submission
            var urlParams = new URLSearchParams(window.location.search);
            var id= urlParams.get('id');
            updateDetails(id); // Pass ID to update function
            
        })

        //  $('##deletebtn').click(function() {
        //         var id = $(this).data('id');
        //         DeleteDetails(id);
        //     });


       
    });


//    $('##savebtn').click(function(event) {
//             event.preventDefault();
//             var title = $('##title').val();
//             var description = $('##description').val();

//             alert("Editing:\nTitle: " + title + "\nDescription: " + description);
//         });
    

        
        
         function updateDetails(_id) {
            var updatedData={ "testid":_id,
                title:$("##title").val(),
                description:$("##description").val()
            }
           
            var url="http://127.0.0.1:8500/rest/hello/updateDetails/" ;
        $.ajax({
             url: url,
            type: "PUT", 
            data:updatedData,
            contentType: "application/x-www-form-urlencoded",
            success: function(response) {
                // console.log(response.DATA)
                alert("details updated successfully")

               

            },
            error: function(xhr, status, error) {
                console.error("Error fetching details:", error);
            }
        });
    }

       
    </script>
    </body>
</html>
</cfoutput> 