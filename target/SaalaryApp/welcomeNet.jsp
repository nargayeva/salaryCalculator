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
                var gross = $('#gross').val();
                var sector = $("input[name='sector']:checked").val();
                var discount = $('.discount:checked').val();
                var discounts = $("input[name='discounts']:checked").val();
                var quantity = $('#quantity').val();

                $.ajax({
                    type: 'POST',
                    url: 'servlet',
                    data: {year:year, gross:gross, sector:sector, discount:discount, discounts:discounts, quantity:quantity},
                    success: function(result){
                        $('#result').html(result);

                    }
                });
            });
        });
    </script>


    <script>
        function myFunction() {
            var checkBox = document.getElementById("myCheck");
            var checked = document.getElementById("checkBox");
            if (checkBox.checked == true){
                checked.style.display = "block";
            } else {
                checked.style.display = "none";
            }
        }
    </script>


    <style>

        #result{
            color: white;
        }

        h3 {
            padding-top: 30px;
            color: white;
        }

        h5 {
            color: white;
        }

        span {
            color: red;
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
            height: 560px;
            border: 1px solid #9C9C9C;
            border-radius: 10px;
            background-color: #EAEAEA;
        }
        #calc .container #calc-row #calc-column #calc-box #calc-form {
            padding: 30px;
        }

    </style>
</head>

<body>
<div id="calc">
    <h3 class="text-center text-white">Gross to Net Salary Calculator</h3>
    <div class="container">
        <div id="calc-row" class="row justify-content-center">
            <div id="calc-column" class="col-md-9 col-xs-9 col-lg-6 col-sm-12">
                <div id="calc-box" class="col-md-12">
                    <form id = "calc-form" class = "form"  action="servlet" method="POST">
                        <div class="form-group">
                            <label for="year">Select a year: <span> * </span> </label>
                            <select name = "year" id = "year">
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="gross">Gross Salary: <span> * </span> </label>
                            <input type="text" name="gross" id = "gross">
                        </div>

                        <div class="form-group">
                            <label>Please, choose your sector: <span> * </span></label> <br>
                            <label for="private">Private Sector: </label>
                            <input type="radio" name="sector" id="private"  value = "private">
                            <br>
                            <label for="state">State Sector: </label>
                            <input type="radio" name="sector" id="state" value = "state">
                        </div>

                        <div class="form-group">
                            <label for="myCheck">Discounts: </label>
                            <input type="checkbox" class="discount" name="discount" id="myCheck" onclick="myFunction()">
                        </div>

                        <div class="form-group" id="checkBox" style="display:none">

                            <label for="discount1">Income tax is decreased by 400 AZN </label>
                            <input type="radio" name="discounts" id="discount1" value="400">
                            <br>
                            <label for="discount2">Income tax is decreased by 200 AZN </label>
                            <input type="radio" name="discounts" id="discount2" value="200">
                            <br>
                            <label for="discount3">Income tax is decreased by 100 AZN </label>
                            <input type="radio" name="discounts" id="discount3" value="100">
                            <br>
                            <label for="discount4">Income tax is decreased by 50 AZN </label>
                            <input type="radio" name="discounts" id="discount4" value="50">
                            <br>
                        </div>
                        <div class="form-group">
                            <label> Labor Union: <span> * </span></label>
                            <input type="number" id="quantity" name="quantity" min="1" max="100">
                            <label for="quantity"> % </label>
                            <label> of Monthly Gross Salary </label>
                        </div>

                        <div class="form-group">
                            <input type="button" value="Submit" id="buttonSubmit" class="button">
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
