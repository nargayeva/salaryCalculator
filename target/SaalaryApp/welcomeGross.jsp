<!DOCTYPE html>
<html>
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <meta charset="utf-8">
    <title>Salary Calculator</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function(){
            $('#buttonSubmit').click(
            function(event){

                var year = $('#year').val();
                var net = $('#net').val();
                var sector = $("input[name='sector']:checked").val();


                $.ajax({
                    type: 'POST',
                    url: 'servlet1',
                    data: {net:net, year:year, sector:sector},
                    success: function(result){
                        $('#result').html(result);
                    }
                });
            });
        });


    </script>


    <style>

        h3 {
            padding-top: 10px;
            color: white;
        }

        span {
            color: red;
        }

        #result {
            color: white;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: #17a2b8;
            height: 100vh;
        }

        label {
            color: black;
        }


        #calc .container #calc-row #calc-column #calc-box {
            margin-top: 30px;
            max-width: 600px;
            height: 300px;
            border: 1px solid #9C9C9C;
            border-radius: 10px;
            background-color: #EAEAEA;
        }

        #calc .container #calc-row #calc-column #calc-box #calc-form {
            padding: 20px;
        }

        </style>

</head>

<body>

<div id="calc">
    <h3 class="text-center text-white">Net to Gross Calculator</h3>
    <div class="container">
        <div id="calc-row" class="row justify-content-center align-items-center">
            <div id="calc-column" class="col-md-6">
                <div id="calc-box" class="col-md-12">

                    <form id = "calc-form" class = "form" action="servlet1" method="POST">
                        <div class="form-group">
                            <label for="year">Select a year: <span> * </span> </label>
                            <select id = "year" name = "year">
                                <option value="2018">2018</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="net">Net Salary:  <span> * </span> </label>
                            <input type="text" name="net" id = "net">
                        </div>

                        <div class="form-group">
                            <label>Please, choose your sector: <span> * </span></label> <br>
                            <label for="privateSec">Private Sector</label>
                            <input type="radio" name="sector" id="privateSec"  value = "privateSec">
                            <br>
                            <label for="stateSec">State Sector </label>
                            <input type="radio" name="sector" id="stateSec" value = "stateSec">
                        </div>

                        <div class="form-group">
                            <input type="button" value="Submit" id="buttonSubmit">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="result"><h5> Result will appear here... </h5></div>
</div>

</body>
</html>
