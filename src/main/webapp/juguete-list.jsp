<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>



<head>
    <title>Jugueteria</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #5ee40c;
        }
    </style>
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #5ee40c">
            <div>
                <a {{--!href="https://www.javaguides.net"--}} class="navbar-brand"> Jugueteria </a>
            </div>

            <ul class="navbar-nav">
              
            </ul>
        </nav>
    </header>
    <br>

    <div class="row">
        <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

        <div class="container">
            <h3 class="text-center">Lista de Juguetes</h3>
            <img style="width: 200px" class="rectangle" src="https://previews.123rf.com/images/nikifiva/nikifiva1201/nikifiva120100059/11930316-juguetes-palabra-compuesta-a-partir-de-cubos-de-letras-ilustraci%C3%B3n-de-fondo-aislado-onwhite.jpg" />
					
            <hr>
            <div class="container text-left">

                <a href="<%=request.getContextPath()%>/new" class="btn btn-success" style="background:linear-gradient(180deg, rgb(148.73, 114.3, 151.73) 0%, rgba(100.46, 81.83, 109.23, 0) 100%)">Agregar Juguete</a>
            </div>
            <br>
            <table class="table table-bordered" style="background-color: white;">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Piezas</th>
            <th>Descripción</th>
            <th>Precio</th>
        </tr>
    </thead>
    <tbody>
        <!--   for (Todo todo: todos) {  -->
        <c:forEach var="juguete" items="${listJuguete}">
            <tr>
                <td>
                    <c:out value="${juguete.id}" />
                </td>
                <td>
                    <c:out value="${juguete.nombre}" />
                </td>
                <td>
                    <c:out value="${juguete.piezas}" />
                </td>
                <td>
                    <c:out value="${juguete.descripcion}" />
                </td>
                <td>
                    <c:out value="${juguete.precio}" />
                </td>
                <td><a href="edit?id=<c:out value='${juguete.id}' />">Editar</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
                    href="delete?id=<c:out value='${juguete.id}' />">Eliminar</a></td>
            </tr>
        </c:forEach>
        <!-- } -->
    </tbody>
</table>

        </div>
    </div>
</body>

</html>
