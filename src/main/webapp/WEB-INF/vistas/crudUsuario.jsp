<jsp:include page="intranetValida.jsp" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Usuario </title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="margin-top: 4%">
<h3>Usuarios</h3>
	
	<div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudUsuario">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudUsuario" class="simple_form" id="defaultForm2"  method="post">

					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" style="width: 150px">REGISTRA</button>
						</div>
						
					</div>
					
					<div class="row" style="margin-top: 4%" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tablePaginacion" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Dni</th>
												<th>Celular</th>
												<th>Operador</th>
												<th>Nombres</th>
												<th>ApellidoPaterno</th>
								                <th>ApellidoMaterno</th>
												<th>FechaNacimiento</th>			
												<th>Password</th>		
												<th>Puntos</th>			
												<th>TipoUsuario</th>	
												<th>Actualizar</th>	
												<th>Registrar</th>			
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.usuarios}" var="x">
													<tr>
														<td>${x.idUsuario}</td>
													   <td>${x.dni}</td>
													   <td>${x.celular}</td>
														<td>${x.operador}</td>
														<td>${x.nombres}</td>	
														<td>${x.apellido_ma}</td>	
														<td>${x.apellido_pa}</td>	
														<td>${x.fechaNacimiento}</td>	
														<td>${x.password}</td> 
														<td>${x.puntos}</td> 
														<td>${x.tipoUsuario.nombre}</td>											
															<td>
													         <button type='button' data-toggle='modal' onclick="editar('${x.idUsuario}','${x.dni}','${x.celular}','${x.operador}','${x.nombres}','${x.apellido_ma}','${x.apellido_pa}','${x.fechaNacimiento}','${x.password}','${x.tipoUsuario.nombre}','${x.puntos}');" class='btn btn-success'><span class="glyphicon glyphicon-pencil"> </span>
															</button>														
															</td>
														<td>
															
                                                            <button type='button' data-toggle='modal' onclick="eliminar('${x.idUsuario}');" class="btn btn-danger"><span class="glyphicon glyphicon-remove"> </span>
															</button>														
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
	
	<div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="insertaActualizaCrudUsuario" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Usuario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese dni" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_celular">Celular</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_celular" name="celular" placeholder="Ingrese el celular" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_operador">Operador</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_operador" name="operador" placeholder="Ingrese el operador" type="text" />
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombres" name="nombres" placeholder="Ingrese nombres" type="text"/>
		                                        </div>
		                                    </div>
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellido_pa">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apellido_pa" name="apellido_pa" placeholder="Ingrese apellido paterno" type="text"/>
		                                        </div>
		                                    </div>   
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellido_ma">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apellido_ma" name="apellido_ma" placeholder="Ingrese apellido materno" type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaNacimiento">Fecha de Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese fecha de nacimiento" type="text"/>
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_password">Contraseña</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_password" name="password" placeholder="Ingrese la contraseña" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipoUsuario">Tipo de Usuario</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_tipoUsuario" name="tipoUsuario.idTipoUsuario" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_puntos">Puntos</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_puntos" name="puntos" placeholder="Ingrese los puntos" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                    
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="insertaActualizaCrudUsuario" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Usuario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID_Usuario">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID_Usuario" readonly="readonly" name="idProducto" type="text" />
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese dni" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_celular">Celular</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_celular" name="celular" placeholder="Ingrese el celular" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_operador">Operador</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_operador" name="operador" placeholder="Ingrese el operador" type="text" />
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombres" name="nombres" placeholder="Ingrese nombres" type="text"/>
		                                        </div>
		                                    </div>
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apellido_pa">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_apellido_pa" name="apellido_pa" placeholder="Ingrese apellido paterno" type="text"/>
		                                        </div>
		                                    </div>   
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apellido_ma">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_apellido_ma" name="apellido_ma" placeholder="Ingrese apellido materno" type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fechaNacimiento">Fecha de Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese fecha de nacimiento" type="text"/>
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_password">Contraseña</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_password" name="password" placeholder="Ingrese la contraseña" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tipoUsuario">Tipo de Usuario</label>
		                                        <div class="col-lg-5">
													<select id="id_act_tipoUsuario" name="tipoUsuario.idTipoUsuario" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_puntos">Puntos</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_puntos" name="puntos" placeholder="Ingrese los puntos" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="idModalElimina" >
					<div class="modal-dialog" style="width: 60%">
				 	
				 	<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span>Eliminar Usuario</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>
		
					</div>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$.getJSON("cargaTipoUsuario", {}, function(data, q,t){
	console.log(data);


	$.each(data, function(index,item){
		$("#id_reg_tipoUsuario").append("<option value="+item.idTipoUsuario+">"+ item.nombre +"</option>");
		$("#id_act_tipoUsuario").append("<option value="+item.idTipoUsuario+">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">

$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});


function eliminar(id){	
	$('#idModalElimina').modal('show');
	$('#id_elimina').val(id);	
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,dni,celular,operador,nombres,apellido_pa,apellido_ma,fechaNacimiento,password,idTipoUsuario,puntos){	
	$('input[id=id_ID_Usuario]').val(id);
	$('input[id=id_act_dni]').val(dni);
	$('input[id=id_act_celular]').val(celular);
	$('input[id=id_act_operador]').val(operador);
	$('input[id=id_act_nombres]').val(nombres);
	$('input[id=id_act_apellido_pa]').val(apellido_pa);
	$('input[id=id_act_apellido_ma]').val(apellido_ma);
	$('input[id=id_act_fechaNacimiento]').val(fechaNacimiento);
	$('input[id=id_act_password]').val(password);
	$('select[id=id_act_tipoUsuario]').val(idTipoUsuario);
	$('input[id=id_act_puntos]').val(puntos);

	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );
</script>

</body>
</html>




