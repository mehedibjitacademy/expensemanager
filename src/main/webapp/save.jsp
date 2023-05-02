<%@ page import="java.text.SimpleDateFormat,com.emanager.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&family=Open+Sans&display=swap" rel="stylesheet">
    <title>Expense Manager</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            color: #333333;
            font-family: 'Nunito Sans', sans-serif;
            font-family: 'Open Sans', sans-serif;
        }
        .main{
            display: flex;
            width: 100%;
            min-height: 100%;
            justify-content: center;
            align-items: center;
        }
        .containner{
            display: flex;
            flex-direction: column;
            background-color: #ebebeb;
            width: 50%;
            height: 90%;
            border-radius: 10px;
            margin-top: 2%;
            padding: 20px;
            box-shadow: rgba(255, 255, 255, 0.1) 0px 1px 1px 0px inset, rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
        }
        .containner .head p{
            font-size: 24px;
            padding-bottom: 3px;
            border-bottom: 1px solid gainsboro;
            color: black;
        }
        p span{
             color: #ff1f5a;
        }
        .containner .content .success{
            margin: 100px 0;
            text-align: center;
            font-size: 18px;
            padding-bottom: 3px;
            color: #2cb978;

        }
        .containner .content .failed{
            color: #e41749;
        }

        .action{
            margin-top: 10px;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: end;
        }
        .action a{
            display: block;
            padding: 8px 10px;
            text-decoration: none;
            color: white;
            font-size: 14px;
            width: 10%;
            text-align: center;
            border-radius: 5px;
            background-color: black;
            white-space: nowrap;
            cursor: pointer;

        }
        .action .addbtn{
            background-color: #2cb978;
            margin-right: 10px;
        }
        .message{
            color: #3d3d3d;
        }
        .message span{
            color: #ff304f;
        }
    </style>
</head>
<body>
    <section class="main">
        <div class="containner">
            <div class="head">
                 <p><span>$Expense</span>Manager</p>
            </div>
            <div class="content">
            <%
             DataBaseHandler dbHandler=new DataBaseHandler();
             String name = request.getParameter("name");
             String category = request.getParameter("category");
             String description = request.getParameter("description");
             double amount= Double.parseDouble(request.getParameter("amount"));
             SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
             java.util.Date date = format.parse(request.getParameter("date"));
             java.sql.Date sqlDate = new java.sql.Date(date.getTime());
             Expense expense=new com.emanager.Expense(name,category,description,amount,sqlDate);
             if(dbHandler.addExpense(expense)){
                out.println("<p class=\"success\">Expense "+name+" successfully added!</p>");
             }else{
                out.println("<p class=\"success failed\">Expense "+name+" not saved!</p>");
             }
            %>
            </div>
            <div class="action">
                <a href="add.jsp" class="addbtn">Add</a>
                <a href="index.jsp">View all</a>
            </div>
        </div>
    </section>
</body>
</html>