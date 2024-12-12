<%@ page import="org.example.demo7.repo.SeatRepo" %>
<%@ page import="org.example.demo7.entity.Seat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Seat</title>
</head>
<body>
<%
    String trainId = request.getParameter("trainId");
    String wagonNum = request.getParameter("wagon_num");
    String seatId = request.getParameter("seatId");
    if (seatId == null || trainId == null || wagonNum == null){
        response.sendRedirect("/home.jsp");
        return;
    }
    int id = Integer.parseInt(seatId);
    Seat seat  = SeatRepo.getSeatById(id);
%>

<table class="table">
    <thead>
    <tr>
        <th>Seat price</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>  <%=seat.getPrice()%></td>
        <td>
            <form action="/buy-ticket" method="post">
                <input type="hidden" value="<%=trainId%>" name="trainId">
                <input type="hidden" value="<%=wagonNum%>" name="wagon_num">
                <input type="hidden" value="<%=seat.getId()%>" name="seatId">
                <button class="btn btn-primary">
                    Purchase ticket
                </button>
            </form>
        </td>
    </tr>

    </tbody>
</table>

</body>
</html>
