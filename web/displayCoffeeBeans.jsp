<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coffee Beans List</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Coffee Beans List</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Bean Type</th>
                <th>Roasting</th>
                <th>Price (BTH)</th>
                <th>Menu Appropriateness</th>
            </tr>
            <%
                ResultSet coffeeBeans = (ResultSet) request.getAttribute("coffeeBeans");
                try {
                    while (coffeeBeans.next()) {
            %>
            <tr>
                <td><%= coffeeBeans.getInt("id") %></td>
                <td><%= coffeeBeans.getString("name") %></td>
                <td><%= coffeeBeans.getString("type") %></td>
                <td><%= coffeeBeans.getString("bean_type") %></td>
                <td><%= coffeeBeans.getString("roasting") %></td>
                <td><%= coffeeBeans.getDouble("price") %></td>
                <td><%= coffeeBeans.getString("menu_appropriateness") %></td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</body>
</html>
