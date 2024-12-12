<%@ page import="org.example.demo7.repo.TrainRepo" %>
<%@ page import="org.example.demo7.entity.Train" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Admin</title>
</head>
<body>
<form action="/admin/addTrain.jsp">
    <button class="btn btn-dark">
        Add Train
    </button>
</form>
<%
    List<Train> allTrains = TrainRepo.getAllTrains();

%>
<table class="table">
    <thead>
    <tr>
        <th>Train Id</th>
        <th>From</th>
        <th>To</th>
        <th>Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>

    <%
        if (allTrains.isEmpty()) {
    %>
    <h3>There is no trains yet</h3>
    <%
        }
        for (Train train : allTrains) {
    %>
    <tr>
        <td><%=train.getId()%>
        </td>
        <td><%=train.getFromm()%>
        </td>
        <td><%=train.getToo()%>
        </td>
        <td><%=train.getDate()%>
        </td>
        <td>
            <form action="/admin/add-wagon.jsp">
                <input type="hidden" value="<%=train.getId()%>" name="trainId">
                <button class="btn btn-dark"> Go</button>
            </form>
            <form action="/train/remove" method="post">
                <input type="hidden" value="<%=train.getId()%>" name="trainId">
                <button class="btn btn-danger">
                    Remove
                </button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
