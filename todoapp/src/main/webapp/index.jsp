<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Todo App</title>
    <link rel="stylesheet" href="style.css">
<body>
    <h1>Todo App</h1>

    <%
        // Initialize the list of todo items if it hasn't been already
        if (session.getAttribute("items") == null) {
            session.setAttribute("items", new ArrayList<String>());
        }
        List<String> items = (List<String>) session.getAttribute("items");
    %>
    <br><br><br>    <br><br><br>     <br><br><br>


    <form action="index.jsp"  class="search-wrapper cf" method="POST">
        <!--<label for="new-item">Add a new item:</label><br>-->
        <input type="text" id="new-item" name="new-item">
        <button >Add to List</button>
    </form>

    <%
        // Get the new item from the form submission and add it to the list
        String newItem = request.getParameter("new-item");
        if (newItem != null && !newItem.trim().isEmpty()) {
            items.add(newItem);
        }
    %>

    <h2>Todo List</h2>
    <ul  style="margin-top:10%">
        <%
            // Iterate over the list of items and display them
            for (String item : items) {
        %>
            
               
                <form class="search-wrapper cf" action="index.jsp" method="POST">
                    <input type="text" name="remove" style="display: inline;" value="<%= item %>" readonly>
                    <button style="background-color: green">Done</button>
                </form><br>
            
        <%
            }
        %>
    </ul>

    <%
        // Remove the specified item from the list
        String removeItem = request.getParameter("remove");
        if (removeItem != null) {
            items.remove(removeItem);
        }
    %>

</body>
</html>
