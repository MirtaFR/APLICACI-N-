<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head style="Background-color: white">
    <title>Jugueteria</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<style>
.rounded-input {
	border-radius: 50px;
	padding: 10px;
	width: 500px;
}
</style>
<body style="background: #5ee40c">
 
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #5ee40c">
            <div>
               
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Juguetes</a></li>
            </ul>
        </nav>
    </header>
    
    <div style="float: left; padding: 10px;">
        <img src="https://img.freepik.com/vector-premium/logotipo-juguetes-coloridos-ninos_560109-91.jpg" alt="Imagen Izquierda" >
    </div>

    <header>

  

    <br>

    <div class="container col-md-8 mt-5">
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
                            Editar Juguete
                        </c:if>
                        <c:if test="${juguete == null}">
                            Agregar Nuevo Juguete
                        </c:if>
                    </h2>
                </caption>

                <c:if test="${juguete != null}">
                    <input type="hidden" name="id" value="<c:out value='${juguete.id}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>Nombre</label> <input type="text" value="<c:out value='${juguete.nombre}' />"
                        class="form-control" name="nombre" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Descripcion</label> <input type="text" value="<c:out value='${juguete.descripcion}' />"
                        class="form-control" name="descripcion">
                </fieldset>

                <fieldset class="form-group">
                    <label>Piezas</label> <input type="number" class="input" value="<c:out value='${juguete.piezas}' />"
                        class="form-control" name="piezas">
                </fieldset>

                <fieldset class="form-group">
                    <label>Precio</label> <input type="number" value="<c:out value='${juguete.precio}' />"
                        class="form-control" name="precio">
                </fieldset>

                <button type="submit" class="btn btn-success">Guardar</button>
                </form>
            </div>
        </div>
    </div>
</body>

</html>
