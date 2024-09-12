<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Coffee Bean</title>
</head>
<body>
    <h1>Edit Coffee Bean</h1>
    <%
        ResultSet coffeeBean = (ResultSet) request.getAttribute("coffeeBean");
        if (coffeeBean.next()) {
    %>
    <form action="UpdateCoffeeBeanServlet" method="POST">
        <input type="hidden" name="id" value="<%= coffeeBean.getInt("id") %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= coffeeBean.getString("name") %>" required>

        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="arabica" <%= "arabica".equals(coffeeBean.getString("type")) ? "selected" : "" %>>Arabica</option>
            <option value="robusta" <%= "robusta".equals(coffeeBean.getString("type")) ? "selected" : "" %>>Robusta</option>
            <option value="liberica" <%= "liberica".equals(coffeeBean.getString("type")) ? "selected" : "" %>>Liberica</option>
            <option value="excelsa" <%= "excelsa".equals(coffeeBean.getString("type")) ? "selected" : "" %>>Excelsa</option>
        </select>

        <label for="bean-type">Type of Beans:</label>
        <select id="bean-type" name="bean-type" required>
            <option value="roasted" <%= "roasted".equals(coffeeBean.getString("bean_type")) ? "selected" : "" %>>Roasted</option>
            <option value="ground" <%= "ground".equals(coffeeBean.getString("bean_type")) ? "selected" : "" %>>Ground</option>
        </select>

        <div id="roasting-options" style="<%= "roasted".equals(coffeeBean.getString("bean_type")) ? "" : "display:none;" %>">
            <label for="roasting">Roasting Level:</label>
            <select id="roasting" name="roasting">
                <option value="mild" <%= "mild".equals(coffeeBean.getString("roasting")) ? "selected" : "" %>>Mild Roasting</option>
                <option value="medium" <%= "medium".equals(coffeeBean.getString("roasting")) ? "selected" : "" %>>Medium Roasting</option>
                <option value="dark" <%= "dark".equals(coffeeBean.getString("roasting")) ? "selected" : "" %>>Dark Roasting</option>
            </select>
        </div>

        <label for="price">Price (BTH):</label>
        <input type="number" id="price" name="price" value="<%= coffeeBean.getDouble("price") %>" required>

        <button type="submit">Update Coffee Bean</button>
    </form>
    <%
        } else {
            out.println("No coffee bean data available to edit.");
        }
    %>

    <script>
        const beanTypeSelect = document.getElementById('bean-type');
        const roastingOptions = document.getElementById('roasting-options');

        beanTypeSelect.addEventListener('change', function() {
            if (this.value === 'roasted') {
                roastingOptions.style.display = 'block';
            } else {
                roastingOptions.style.display = 'none';
            }
        });
    </script>
</body>
</html>
