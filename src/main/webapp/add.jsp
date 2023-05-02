<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Manager</title>
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
            width: 35%;
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
        .containner .content p{
            margin:20px 0 0 5px;
            font-size: 16px;
        }
        .content form{
            box-sizing:content-box;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .content form select option{
            background-color: white;
        }
        .content form input,.content form select{
            box-sizing: border-box;
            margin-bottom: 10px;
            width: 100%;
            outline: none;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            padding: 15px 10px;

        }
        .content form input:focus{
            outline: none;
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
        .addbtn{
            box-sizing: border-box;
            background-color: #2cb978;color: white;
            cursor: pointer;
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
                <p>New Expense</p>
                <form action="save.jsp" method="post">
                    <input type="text" name="name" id="" placeholder="Expense name" maxlength="25" required>
                    <select id="cars" name="category" required>
                        <option value="" selected disabled hidden>Choose Category</option>
                        <option value="Transportation">Transportation</option>
                        <option value="Food">Food</option>
                        <option value="Fees">Fees</option>
                        <option value="Bills">Bills</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Other">Other</option>
                    </select>
                    <input type="text" name="description" id="" placeholder="Description" maxlength="200" required>
                    <input type="number" name="amount" id="" min="0" step="0.01" placeholder="amount" required>
                    <input type="date" name="date" id="" value="2023-04-26" required>
                    <input type="submit" value="Save" class="addbtn">
                </form>
            </div>
            <div class="action">
                <a href="index.jsp">View all</a>
            </div>
        </div>
    </section>
</body>
</html>