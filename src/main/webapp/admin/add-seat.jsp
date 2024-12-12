<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add Seat</title>
</head>
<body class="bg-light">
<%@ page import="org.example.demo7.repo.SeatRepo" %>
<%@ page import="org.example.demo7.entity.Seat" %>
<%@ page import="java.util.List" %>

<%
    String wagonId = request.getParameter("wagonId");
    if (wagonId == null) {
        response.sendRedirect("/admin/admin.jsp");
        return;
    }
    int id = Integer.parseInt(wagonId);
    List<Seat> seats = SeatRepo.getSeatsByWagonId(id);
%>

<div class="container py-5">
    <div class="row mb-4">
        <div class="col-12 text-center">
            <h1 class="display-6">Add Seat</h1>
            <p class="text-muted">Manage and add seats for Wagon ID: <strong><%=wagonId %></strong></p>
        </div>
    </div>

    <!-- Add Seat Form -->
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body">
                    <form action="/seat/add" method="post">
                        <input type="hidden" value="<%=wagonId%>" name="wagonId">

                        <div class="mb-3">
                            <label for="price" class="form-label">Seat Price</label>
                            <input type="number" id="price" name="price" class="form-control" placeholder="Enter seat price" required>
                        </div>

                        <div class="mb-3">
                            <label for="amount" class="form-label">Amount of Seats</label>
                            <input type="number" id="amount" name="amount" class="form-control" placeholder="Amount Seats" value="1" required>
                        </div>

                        <button class="btn btn-dark w-100">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- List of Existing Seats -->
    <div class="row mt-5">
        <div class="col-12">
            <h2 class="h4">Existing Seats</h2>
            <div class="row g-3">
                <% for (Seat seat : seats) { %>
                <div class="col-md-2">
                    <form action="/admin/seat-change.jsp">
                        <input type="hidden" value="<%=seat.getId()%>" name="seatId">
                        <button class="btn btn-success w-100">Seat <%=seat.getId()%></button>
                    </form>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-dSkmggDIbwoVljvswjzSrfX7MTQVpXDqFnplaw1gFqNqUCtKkBcD5Fp3Fp8Vb8Bx" crossorigin="anonymous"></script>
</body>
</html>
