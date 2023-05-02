<%@ page import="java.sql.*,com.emanager.DataBaseHandler" %>
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

                .main {
                    display: flex;
                    width: 100%;
                    min-height: 100%;
                    justify-content: center;
                    align-items: center;
                }

                .containner {
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

                .containner .content p {
                    margin: 20px 0 0 5px;
                    font-size: 16px;
                }

                table {
                    width: 100%;
                    border-radius: 5px;
                    overflow: hidden;
                }

                table,
                tr,
                td,
                th {
                    border-collapse: collapse;
                }

                td,
                th {
                    padding: 5px;
                    text-align: center;
                }

                tr:nth-child(even) {
                    background-color: #c5e3f6;
                }

                tr:nth-child(odd) {
                    background-color: white;
                }

                .action {
                    margin-top: 10px;
                    display: flex;
                    flex-direction: row;
                    align-items: center;
                    justify-content: end;
                }

                .action a {
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

                .action .addbtn {
                    background-color: #2cb978;
                    margin-right: 10px;
                }
                .message p{
                    font-size: 10px;
                    color: #3d3d3d;
                }
                .message p span{
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
                        <p>All Expenses</p>
                        <%
                            DataBaseHandler dbHandler=new DataBaseHandler();
                            ResultSet rs=dbHandler.getExpenses();
                            StringBuilder table=new StringBuilder();
                            
                                table.append("<table><tr>"+
                                "<th>Expense Name</th>"+
                                "<th>Category</th>"+
                                "<th>Description</th>"+
                                "<th>Amount</th>"+
                                "<th>Date</th></tr>");
                                int count=0;
                                double cost=0.0d;
                                try {
                                    while(rs.next()){
                                      table.append("<tr><td>"+rs.getString("name")+"</td>"+
                                        "<td>"+rs.getString("category")+"</td>"+
                                        "<td>"+rs.getString("description")+"</td>"+
                                        "<td>"+rs.getDouble("amount")+"</td>"+
                                        "<td>"+rs.getDate("date")+"</td></tr>");
                                        cost+=rs.getDouble("amount");
                                        count++;
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }finally{
                                    table.append("</table>");
                                }
                            if(count>0){
                                out.println(table.toString());
                                out.println("<div class=\"message\">"+
                                    "<p>Total <span>"+count+"</span> Expenses | Total cost: <span>"+cost+"</span></p>"+
                                "</div>");
                            }else{
                                out.println("<div class=\"message\">"+
                                    "<p>Total <span>"+0+"</span> Expenses | Total cost: <span>"+0+"</span></p>"+
                                "</div>");
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