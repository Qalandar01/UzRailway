<%@ page import="org.example.demo7.entity.User" %>
<%@ page import="org.example.demo7.repo.UserRepo" %>
<%@ page import="org.example.demo7.entity.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.demo7.repo.TicketRepo" %>
<%@ page import="org.example.demo7.repo.WagonRepo" %>
<%@ page import="org.example.demo7.repo.TrainRepo" %>
<%@ page import="org.example.demo7.entity.Train" %>
<%@ page import="org.example.demo7.entity.Wagon" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>My Tickets</title>
</head>
<body>
<%
    Object obj = session.getAttribute("user");
    if (obj == null) {
        response.sendRedirect("/login.jsp");
        return;
    }
    User user = (User) obj;
    List<Ticket> tickets = UserRepo.getUserTickets(user.getId());
    if (tickets.isEmpty()) {
%>
<h2>You have no active tickets</h2>
<%
} else {
%>

<table class="table">
    <thead>
    <tr>
        <th>Date</th>
        <th>Wagon number</th>
        <th>From</th>
        <th>To</th>
        <th>Wagon type</th>
        <th>Seat number</th>
        <th>Seat price</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Ticket ticket : tickets) {
            Train train = TrainRepo.getTrainBySeatId(ticket.getSeat().getId());
            Wagon wagon = WagonRepo.getWagonBySeatId(ticket.getSeat().getId());
    %>
    <tr>
        <td><%=train.getDate()%>
        </td>
        <td><%=wagon.getId()%>
        </td>
        <td><%=train.getFromm()%>
        </td>
        <td><%=train.getToo()%>
        </td>
        <td><%=wagon.getWagonType()%>
        </td>
        <td><%=ticket.getSeat().getId()%>
        </td>
        <td><%=ticket.getSeat().getPrice()%>
        </td>

    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>

</body>
</html>
