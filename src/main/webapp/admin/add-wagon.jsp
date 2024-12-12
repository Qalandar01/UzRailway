<%@ page import="org.example.demo7.enums.WagonType" %>
<%@ page import="org.example.demo7.repo.WagonRepo" %>
<%@ page import="org.example.demo7.entity.Wagon" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add Wagon</title>
</head>
<body>
<%
    Integer trainId = Integer.parseInt(request.getParameter("trainId"));
    WagonType[] wagonTypes = WagonType.values();

    List<Wagon> wagons = WagonRepo.getAllWagonsByTrainId(trainId);

%>
<div class="container mt-5">
    <div class="card">
        <div class="card-header text-center">
            <h3>Add Wagon</h3>
        </div>
        <div class="card-body">
            <form action="/wagon/add" method="post">
                <input type="hidden" value="<%=trainId%>" name="trainId">

                <div class="mb-3">
                    <label for="wagonType" class="form-label">Wagon Type</label>
                    <select id="wagonType" name="wagonType" class="form-select" required>
                        <option value="" disabled selected>Select wagon type</option>
                        <% for (WagonType type : wagonTypes) { %>
                        <option value="<%= type.name() %>"><%= type.name() %>
                        </option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="numberOfSeats" class="form-label">Number of Seats</label>
                    <input type="number" class="form-control" id="numberOfSeats" name="numberOfSeats" min="1"
                           placeholder="Enter number of seats" required>
                </div>

                <div class="mb-3">
                    <label for="pricePerSeat" class="form-label">Price per Seat</label>
                    <input type="number" class="form-control" id="pricePerSeat" name="pricePerSeat" step="0.01" min="0"
                           placeholder="Enter price per seat" required>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Save Wagon</button>
                </div>

            </form>
            <table class="table">
                <thead>
                <tr>
                    <th>Wagon Id</th>
                    <th>Wagon type</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Wagon wagon : wagons) {
                %>
                <tr>
                    <td><%=wagon.getId()%></td>
                    <td><%=wagon.getWagonType()%></td>
                    <td>
                        <form action="/admin/add-seat.jsp">
                            <input type="hidden" value="<%=wagon.getId()%>" name="wagonId">
                            <button class="btn btn-primary">Go</button>
                        </form>
                        <form action="/wagon/remove" method="post">
                            <input type="hidden" value="<%=trainId%>" name="trainId">
                            <input type="hidden" value="<%=wagon.getId()%>" name="wagonId">
                            <button class="btn btn-danger">Remove</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>

