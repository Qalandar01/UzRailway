<%@ page import="org.example.demo7.repo.WagonRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.demo7.entity.Wagon" %>
<%@ page import="java.util.Objects" %>
<%@ page import="org.example.demo7.repo.SeatRepo" %>
<%@ page import="org.example.demo7.entity.Seat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Wagon</title>
    <style>
        .seat-status {
            display: flex;
            justify-content: start;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
        }
        .seat-status .label {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .label-circle {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: inline-block;
        }
        .label-circle.yellow {
            background-color: #ffc107; /* Yellow */
        }
        .label-circle.green {
            background-color: #28a745; /* Green */
        }
    </style>
</head>
<body>
<div class="container mt-5">

    <%
        String trainId = request.getParameter("trainId");
        if (trainId == null) {
            response.sendRedirect("home.jsp");
            return;
        }

        String successMessage = request.getParameter("successMessage");
        if (successMessage != null && !successMessage.isEmpty()) {
    %>
    <div class="alert alert-success text-center" role="alert">
        <%= successMessage %>
    </div>
    <% } %>

    <%
        Integer wagon_num = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("wagon_num"), "1"));
        int id = Integer.parseInt(trainId);
        Wagon wagon = WagonRepo.getAllWagonsByTrainId(id, wagon_num);
        List<Seat> seats = SeatRepo.getSeatsByWagonId(wagon.getId());
        int count = WagonRepo.countWagons(id);
    %>
    <h1 class="text-center mb-4"><%=wagon.getWagonType()%></h1>

    <div class="mb-4">
        <a href="mytickets.jsp" class="btn btn-primary">My Tickets</a>
        <a href="home.jsp" class="btn btn-secondary">Home Page</a>
    </div>

    <div class="seat-status">
        <div class="label">
            <span class="label-circle yellow"></span>
            <span>Purchased seats</span>
        </div>
        <div class="label">
            <span class="label-circle green"></span>
            <span>Available seats</span>
        </div>
    </div>

    <div class="d-flex flex-wrap gap-2">
        <% for (Seat seat : seats) { %>
        <% if (seat.getStatus()) { %>
        <button class="btn btn-warning">
            <%= seat.getId() %>
        </button>
        <% } else { %>
        <form action="/seat.jsp" method="post">
            <input type="hidden" value="<%=trainId%>" name="trainId">
            <input type="hidden" value="<%=wagon_num%>" name="wagon_num">
            <input type="hidden" name="seatId" value="<%= seat.getId() %>">
            <input type="hidden" name="successMessage" value="Ticket purchased successfully!">
            <button class="btn btn-success">
                <%= seat.getId() %>
            </button>
        </form>
        <% } %>
        <% } %>
    </div>

    <div class="mt-4">
        <% for (int i = 1; i <= count; i++) { %>
        <form action="" method="get" class="d-inline">
            <input type="hidden" name="wagon_num" value="<%= i %>">
            <input type="hidden" name="trainId" value="<%= trainId %>">
            <button class="btn btn-dark">
                Wagon <%= i %>
            </button>
        </form>
        <% } %>
    </div>
</div>
</body>
</html>
