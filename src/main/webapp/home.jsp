<%@ page import="org.example.demo7.enums.Destinations" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buy Ticket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%
    Object user = session.getAttribute("user");
    if (user == null) {
%>
<form action="/login.jsp" method="post" class="text-end mt-3 me-3">
    <button class="btn btn-primary">
        Login
    </button>
</form>
<%
    }
    Destinations[] destinations = Destinations.values();
%>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card shadow-sm p-4" style="width: 100%; max-width: 500px;">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h5">Buy Ticket</h1>
            <a href="/mytickets.jsp" class="btn btn-secondary btn-sm">My Tickets</a>
        </div>
        <p class="text-muted">Select route and date to buy a train ticket</p>
        <form action="/train.jsp" method="post">
            <div class="mb-3">
                <label for="from" class="form-label">From</label>
                <select id="from" name="from" class="form-select" required>
                    <option value="" disabled selected>Choose departure</option>
                    <%
                        for (Destinations destination : destinations) {
                    %>
                    <option value="<%=destination.name()%>"><%=destination.name()%></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="mb-3">
                <label for="to" class="form-label">To</label>
                <select id="to" name="to" class="form-select" required>
                    <option value="" disabled selected>Choose destination</option>
                    <%
                        for (Destinations destination : destinations) {
                    %>
                    <option value="<%=destination.name()%>"><%=destination.name()%></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="mb-3">
                <label for="departureDate" class="form-label">Departure Date</label>
                <input type="date" id="departureDate" name="departureDate" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-success w-100">Search</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
