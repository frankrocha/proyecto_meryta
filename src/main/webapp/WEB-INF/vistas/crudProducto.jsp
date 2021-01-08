<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<jsp:include page="intranetValida.jsp" />
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
<title>Productos</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="margin-top: 8%">
<h3>Productos</h3>
	
	<div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudProducto">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudProducto" class="simple_form" id="defaultForm2"  method="post">

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
												<th>Nombre</th>
												<th>Precio</th>
												<th>Stock</th>
												<th>Estado</th>
												<th>Categoria</th>							
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.productos}" var="x">
													<tr>
														<td>${x.idProducto}</td>
													   <td>${x.descripcion}</td>
													   <td>${x.precio}</td>
														<td>${x.stock}</td>
														<td>${x.estado}</td>	
														<td>${x.tipoProducto.descripcion}</td>											
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idProducto}','${x.precio}','${x.descripcion}','${x.stock}','${x.estado}','${x.tipoProducto.descripcion}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idProducto}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
																<img src='images/delete.gif' width='auto' height='auto' />
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Producto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="insertaActualizaCrudProducto" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_codigo">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_codigo" name="precio" placeholder="Ingrese el Codigo" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Descripcion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_titulo" name="descripcion" placeholder="Ingrese el Titulo" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_estado" name="stock" placeholder="Ingrese el Estado" type="text" />
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipo">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_tipo" name="estado" placeholder="Ingrese el tipo de Libro" type="text"/>
		                                        </div>
		                                    </div>      
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipoLibro">Tipo de Producto</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_tipoProducto" name="tipoProducto.idTipoProducto" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Producto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="insertaActualizaCrudProducto" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID_Producto">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID_Producto" readonly="readonly" name="idProducto" type="text" />
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_precio" name="precio" placeholder="Ingrese el precio" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_descripcion">Descripcion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_descripcion" name="descripcion" placeholder="Ingrese la descripcion" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_stock">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_stock" name="stock" placeholder="Ingrese el stock" type="text" />
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_estado" name="estado" placeholder="Ingrese el estado" type="text"/>
		                                        </div>
		                                    </div>      
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tipoProducto">Tipo de Producto</label>
		                                        <div class="col-lg-5">
													<select id="id_act_tipoProducto" name="tipoProducto.idTipoProducto" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span>Eliminar Producto</h4>
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
$.getJSON("cargaTipoProducto", {}, function(data, q,t){
	console.log(data);

	$.each(data, function(index,item){
		$("#id_reg_tipoProducto").append("<option value="+item.idTipoProducto+">"+ item.descripcion +"</option>");
		$("#id_act_tipoProducto").append("<option value="+item.idTipoProducto +">"+ item.descripcion +"</option>");
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

function editar(id,precio,descripcion,stock,estado,idTipoProducto){	
	$('input[id=id_ID_Producto]').val(id);
	$('input[id=id_act_precio]').val(precio);
	$('input[id=id_act_descripcion]').val(descripcion);
	$('input[id=id_act_stock]').val(stock);
	$('input[id=id_act_estado]').val(estado);
	$('select[id=id_act_tipoProducto]').val(idTipoProducto);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );
</script>


</body>
</html>




