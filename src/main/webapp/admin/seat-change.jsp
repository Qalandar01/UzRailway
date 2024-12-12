<%@ page import="org.example.demo7.repo.SeatRepo" %>
<%@ page import="org.example.demo7.entity.Seat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Update Seat</title>
</head>
<body>
<%
    int seatId = Integer.parseInt(request.getParameter("seatId"));
    Seat seat = SeatRepo.getSeatById(seatId);
%>
<form action="/seat/update" method="post">
<div class="card">
    <div class="card-header">
        <h2>Update Seat</h2>
    </div>
    <div class="card-body">
        <input type="hidden" value="<%=seatId%>" name="seatId">
        <input type="number" value="<%=seat.getPrice()%>" name="price">
        <button class="btn btn-dark">
            Update
        </button>
    </div>
</div>
</form>

</body>
</html>
