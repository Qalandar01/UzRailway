<%@ page import="org.example.demo7.repo.TrainRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.demo7.entity.Train" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Trains</title>
</head>
<body>
<%
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String departureDate = request.getParameter("departureDate");
    if (from.equals(to) || to == null) {
        response.sendRedirect("/home.jsp");
        return;
    }
    List<Train> trains = TrainRepo.getAllTrains(from, to, departureDate);
%>

<table class="table">
    <thead>
    <tr>
        <th>From</th>
        <th>To</th>
        <th>Departure Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>

    <%
        if (trains.isEmpty()) {
    %>
        <h1>There is no train </h1>
    <%
        }
        for (Train train : trains) {
    %>
    <tr>
        <td><%=train.getFromm()%>
        </td>
        <td><%=train.getToo()%>
        </td>
        <td><%=train.getDate()%>
        </td>
        <td>
            <form action="/wagon.jsp" method="post">
                <input type="hidden" value="<%=train.getId()%>" name="trainId">
                <button class="btn btn-primary">Choose train</button>
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
