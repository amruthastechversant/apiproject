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
    <table border="1" id="apitable" class="w-50 text-center table-bordered mt-5">
        <thead>
            <tr>
            <th>TITLE</th>
            <th>DESCRIPTION</th>
            </tr>
        </thead>
       <tbody>
       </tbody>
    </table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


  <script>  
        var baseurl="http://127.0.0.1:8500/rest/hello/addDetails";
        function addDetails(){
            $.ajax({
                url:baseurl,
                type:"POST",
                dataType:"json",
                contentType: "application/x-www-form-urlencoded",
                data: {          
                name: "title",
                description: "description"
            },
                success:function(response) {
                    console.log(response.DATA)
                    var htmlcontent="";
                    $(response.DATA).each(function(index,item){
                        htmlcontent+='<tr><td>' +item[1] + '</td><td>' +item[2] + '</td></tr>';
                    })

                     $('##apitable tbody').html(htmlcontent);
                    // console.log(htmlcontent)

            },
            error: function(xhr, status, error) {
                console.error("Error fetching details:", error);
            }
                });
            }

    $(document).ready(function(){
        addDetails() 
    });
        
    </script>
<!---     <script> 
        var baseurl="http://127.0.0.1:8500/rest/hello/getDetails";
         function fetchDetails() {
        $.ajax({
            url:baseurl ,
            type: "GET",
            dataType: "json",
            success: function(response) {

                // console.log(response.DATA)
                // console.log(response['DATA'])
                 var htmlcontent='';

                $(response.DATA).each(function(index,item){
                   
                    // item[1]=abc1;
                    // item[2]=abctask2;
                    // console.log('i am ' +item[0] + ' and '  + item[1] + ' and ' + item[2])
                    // console.log( '<tr><td>' +item[1] +'</td><td>' +item[2] +'</td></tr>')
                    htmlcontent+= '<tr><td>' +item[1] +'</td><td>' +item[2] +'</td></tr>';
                    
                })

             $('##apitable tbody').html(htmlcontent);
                    // console.log(htmlcontent)

            },
            error: function(xhr, status, error) {
                console.error("Error fetching details:", error);
            }
        });
    }
    $(document).ready(function(){
        fetchDetails() 
    })
    </script>--->
</body>
</html>
</cfoutput>