<%@ page import="org.example.demo7.enums.Destinations" %>
<%@ page import="org.example.demo7.enums.WagonType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Add Train</title>
</head>
<body>

<%
    Destinations[] destinations = Destinations.values();
    WagonType[] wagonTypes = WagonType.values();
%>

<div class="container mt-5">
    <div class="card">
        <div class="card-header text-center">
            <h3>Add Train</h3>
        </div>
        <div class="card-body">
            <form action="/train/add" method="post">
                <div class="mb-3">
                    <label for="from" class="form-label">From</label>
                    <select id="from" name="from" class="form-select" required>
                        <option value="" disabled selected>Select departure</option>
                        <% for (Destinations destination : destinations) { %>
                        <option value="<%= destination.name() %>"><%= destination.name() %></option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="to" class="form-label">To</label>
                    <select id="to" name="to" class="form-select" required>
                        <option value="" disabled selected>Select destination</option>
                        <% for (Destinations destination : destinations) { %>
                        <option value="<%= destination.name() %>"><%= destination.name() %></option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="departureDate" class="form-label">Departure Date</label>
                    <input type="date" id="departureDate" name="departureDate" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="wagonType" class="form-label">Wagon Type</label>
                    <select id="wagonType" name="wagonType" class="form-select" required>
                        <option value="" disabled selected>Select wagon type</option>
                        <% for (WagonType type : wagonTypes) { %>
                        <option value="<%= type.name() %>"><%= type.name() %></option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="wagonNumbers" class="form-label">Number of Wagons</label>
                    <input type="number" id="wagonNumbers" name="wagonNumbers" class="form-control" placeholder="Enter number of wagons" required>
                </div>

                <div class="mb-3">
                    <label for="seatsPerWagon" class="form-label">Seats per Wagon</label>
                    <input type="number" id="seatsPerWagon" name="seatsPerWagon" class="form-control" placeholder="Enter number of seats per wagon" required>
                </div>
                <div class="mb-3">
                    <label>
                        <input type="number"  name="price" class="form-control" placeholder="Enter seat price" required>
                    </label>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
