<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
  <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <html>

        <head>
            <title>Jugueteria</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        </head>

        <body>

            <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                    <div>
                        <a href="https://www.javaguides.net" class="navbar-brand"> Jugueteria App </a>
                    </div>

                    <ul class="navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Juguetes</a></li>
                    </ul>
                </nav>
            </header>
            <br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        <c:if test="${juguete != null}">
                            <form action="update" method="post">
                        </c:if>
                        <c:if test="${juguete == null}">
                            <form action="insert" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${juguete != null}">
                                    Edit Juguete
                                </c:if>
                                <c:if test="${juguete == null}">
                                    Add New Juguete
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${juguete != null}">
                            <input type="hidden" name="id" value="<c:out value='${juguete.id}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>Nombre</label> <input type="text" value="<c:out value='${juguete.nombre}' />" class="form-control" name="nombre" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Descripcion</label> <input type="text" value="<c:out value='${juguete.descripcion}' />" class="form-control" name="descripcion">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Piezas</label> <input type="number" value="<c:out value='${juguete.piezas}' />" class="form-control" name="piezas">
                        </fieldset>
 						<fieldset class="form-group">
                            <label>Precio</label> <input type="number" value="<c:out value='${juguete.precio}' />" class="form-control" name="precio">
                        </fieldset>
                        <button type="submit" class="btn btn-success">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>