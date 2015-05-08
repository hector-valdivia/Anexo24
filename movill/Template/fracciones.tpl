<!--
  #AIS Business México SA de CV
  #dev@aisbusiness.mx
  #Facturas
  #
  #
-->

<!DOCTYPE html>
<html>
<head>
	<link href="{PLUGINS}pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen"/>
	<!-- BEGIN CORE CSS FRAMEWORK -->
	<link href="{PLUGINS}boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="{PLUGINS}boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
	<link href="{PLUGINS}font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
	<link href="{STYLESHEET}animate.min.css" rel="stylesheet" type="text/css"/>
	<!-- END CORE CSS FRAMEWORK -->

	<!-- BEGIN CSS TEMPLATE -->
	<link href="{STYLESHEET}style.css" rel="stylesheet" type="text/css"/>
	<link href="{STYLESHEET}responsive.css" rel="stylesheet" type="text/css"/>
	<link href="{STYLESHEET}custom-icon-set.css" rel="stylesheet" type="text/css"/>
	<!-- END CSS TEMPLATE -->
	<!-- BEGIN PLUGIN CSS -->
	<link href="{PLUGINS}bootstrap-select2/select2.css" rel="stylesheet" type="text/css"/>
	<link href="{PLUGINS}jquery-slider/css/jquery.sidr.light.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="{PLUGINS}jquery-datatable/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
	<link href="{PLUGINS}boostrap-checkbox/css/bootstrap-checkbox.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="{PLUGINS}datatables-responsive/css/datatables.responsive.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="{PLUGINS}validationEngine/validationEngine.jquery.css" rel="stylesheet" type="text/css" media="screen"/>

	<!-- END PLUGIN CSS -->
	<style type="text/css">
		body{ background: transparent; }
	</style>
	<!-- END CSS TEMPLATE -->
<body class="error-body no-top lazy"> 
	<div class="content" style="margin:2.5% 0 0 0;">
		<div class="page-title"> 
			<a href="javascript:goBack()">
				<i class="icon-custom-left"></i>
			</a>
			<h3>Fracciones - <span class="semi-bold">KeyA</span></h3>
		</div>
		<ul class="breadcrumb">
			<li><p>Te encuentras en:</p></li>
			<li><a href="#" class="active">Fracciones Asignadas</a></li>
		</ul>
		<div class="row">
			<!--======================================= FACTURAS X PAGAR =======================================-->
			<div class="col-md-6">
				<div class="grid simple ">
					<div class="grid-title">
						<h4><i class="fa fa-building-o"></i> Productos <span class="semi-bold">Asignados</span></h4>
						<div class="pull-right">
							<div class="btn-group">
								<button class="btn btn-small btn-white btn-demo-space dropdown-toggle" data-toggle="dropdown">Aciones</button>
								<button class="btn btn-small btn-white dropdown-toggle btn-demo-space" data-toggle="dropdown" style="height: -2.1%;"> 
									<span class="caret"></span> 
								</button>
								<ul class="dropdown-menu" style="margin:0 0 0 -76%;">
									<li><a href="javascript:tipo(1);" >Asignar</a></li>
									<li class="divider"></li>
									<li><a href="#">Ayuda</a></li>
								</ul>
							</div>
						</div>
						<div class="row"><div class="col-md-12"><div id="mensaje2"></div></div></div>
					</div>
					<div class="grid-body ">
						<table class="table table-hover table-condensed" id="tabla_materiales" width="100%">
							<thead>
								<tr>
									<th>Clave</th>
									<th>Material-Nombre </th>
									<th>UMC</th>
									<th>UMT</th>
									<th>Fracción</th>
									<th>Status</th>
									<th>Opciones</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>

			<!--======================================= FACTURAS EXP =======================================-->
			<div class="col-md-6">
				<div class="grid simple ">
					<div class="grid-title">
						<h4><i class="fa fa-building-o"></i> Materiales <span class="semi-bold">Asignados</span></h4>
						<div class="pull-right">
							<div class="btn-group">
								<button class="btn btn-small btn-white btn-demo-space dropdown-toggle" data-toggle="dropdown">Aciones</button>
								<button class="btn btn-small btn-white dropdown-toggle btn-demo-space" data-toggle="dropdown" style="height: -2.1%;"> 
									<span class="caret"></span> 
								</button>
								<ul class="dropdown-menu" style="margin:0 0 0 -76%;">
									<li><a href="javascript:tipo(2);" >Asignar</a></li>
									<li class="divider"></li>
									<li><a href="#">Ayuda</a></li>
								</ul>
							</div>
						</div>
						<div class="row"><div class="col-md-12"><div id="mensaje3"></div></div></div>
					</div>
					<div class="grid-body ">
						<table class="table table-hover table-condensed" id="tabla_productos" width="100%">
							<thead>
								<tr>
									<th>Clave</th>
									<th>Partes-Nombre</th>
									<th>UMC</th>
									<th>UMT</th>
									<th>Fracción</th>
									<th>Status</th>
									<th>Opciones</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>

				<div id="detalle_expedidas" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="detalle_expedidas" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><br>
								<i class="fa fa-users fa-7x"></i>
								<h4 id="myModalLabel" class="semi-bold">Cree su nuevo perfil para keya</h4>
								<p class="no-margin">Se requiere definir los permisos del perfil</p><br>
							</div>
							<div class="modal-body">
								<div class="row form-row">
									<div class="col-md-12">
										<label>Nombre del Perfil</label>
										<input type="text" name="nombre_perfil" id="nombre_perfil" class="form-control validate[required]" placeholder="Nombre del perfil">
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<input type="hidden" name="id" id="id" value="crear">
								<input type="hidden" name="Method" id="Method" value="Crear">
								<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
								<button type="button" class="btn btn-primary enviar">Guardar</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="myModal1"  class="modal fade"  tabindex="-1"role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 9999; background: no-repeat !important; position: fixed;">
		<form name="N31" id="N31" class="principal" >
			<div class="modal-dialog"  style="width: 50%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 id="myModalLabel" class="semi-bold">Añadir</h4>
					</div>
					<div class="modal-body">
						<div class="row">
						    <input type="hidden" name="tip" id="tip">
							<div id="datos2" name="datos2" class="col-md-12"></div>							
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-4">	
								<div id="mat">
									<label for="caso" class="control-label"> Materiales</label>
									<select name="material" id="material"  class="validate[required]" style="padding:0 !important; width:100%;" placeholder="Seleccione Material" multiple>
										{MATERIALES}
									</select>
								</div>
								<div id="part">
									<label for="caso" class="control-label">Partes</label>
									<select name="partes" id="partes" class="validate[required]" style="padding:0 !important; width:100%;" placeholder="Seleccione Partes" multiple>
										{PARTES}
									</select>
								</div>
							</div>
							<div class="col-md-7">	
								<div class="col-md-6 ">
									<label for="ago" class="control-label"> UMC</label>
									<select name="umc1" id="umc1" class="validate[required]" style="padding:0 !important; width:100%;">
										{UMC}
									</select>
								</div>
								<div class="col-md-6 ">	
									<label for="tipo" class="control-label"> UMT</label>
									<select id="umt1" name="umt1" class="validate[required]" style="padding:0 !important; width:100%;">
										{UMT}
									</select>
								</div>
							</div>
						</div><br>
						<div class="row">
							<div class="col-md-5"></div>
							<div class="col-md-6">
								<div class="col-md-12">
									<label for="cuenta" class="control-label"> Fraccion</label>
									<input type="text" id="fraccion" name="fraccion" class="form-control validate[required]">	
								</div>
							</div>
						</div>
					</div> <br>
					<div class="modal-footer">
						<div id="msjbox2"></div>
						<div id="nota1"><p style="color:#FFA500"><b>Al menos tiene que haber un material o parte</b></p></div>
						<div id="nota2"><p style="color:#FFA500"><b>Al menos tiene que seleccionar una UMC</b></p></div>
						<div id="nota3"><p style="color:#FFA500"><b>Al menos tiene que seleccionar una UMT</b></p></div>
						<div id="nota4"><p style="color:#FFA500"><b>Tiene que agruegar una Fraccion</b></p></div>
						<div id="nota5"><p style="color:#FFA500"><b>Nadamas tiene que haber UNO cargo o abono</b></p></div>
						<div class="row">
							<div class="col-md-12"><div id="mensaje"></div></div>
						</div>
						<button type="button" id="6" class="btn btn-danger enviar" style="height:33px; margin-top:11px;"onclick="javascript:validacionAjuste();"><i class="fa fa-check"></i> Guardar</button>
					   	<button class="btn btn-white btn-cons next" data-dismiss="modal"  style="height:33px; margin-top:8px;" aria-hidden="true" onclick="javascript:location.reload();">Cerrar</button>
					</div> 
			    </div>			
		    </div>
	    </form>
    </div>

   	<div id="myModal2"  class="modal fade"  tabindex="-1"role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog"  style="width: 50%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 id="myModalLabel" class="semi-bold">Editar</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					    <input type="hidden" name="id2" id="id2">
					    <input type="hidden" name="tipo2" id="tipo2">						
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-4">	
							<div id="mat2">
								<label for="caso" class="control-label"> Materiales</label>
								<input type="text" id="material2" name="material2" class="form-control validate[required]" disabled>
							</div>
							<div id="part2">
								<label for="caso" class="control-label">Partes</label>
								<input type="text" id="parte2" name="parte2" class="form-control validate[required]">
							</div>
						</div>
						<div class="col-md-7">	
							<div class="col-md-6 ">
								<label for="ago" class="control-label"> UMC</label>
								<select name="umc2" id="umc2" class="validate[required]" style="padding:0 !important; width:100%;">
									{UMC}
								</select>
							</div>
							<div class="col-md-6 ">	
								<label for="tipo" class="control-label"> UMT</label>
								<select id="umt2" name="umt2" class="validate[required]" style="padding:0 !important; width:100%;">
									{UMT}
								</select>
							</div>
						</div>
					</div><br>
					<div class="row">
						<div class="col-md-5"></div>
						<div class="col-md-6">
							<div class="col-md-12">
								<label for="cuenta" class="control-label"> Fraccion</label>
								<input type="text" id="fraccion2" name="fraccion2" class="form-control validate[required]">	
							</div>
						</div>
					</div><br>
					<div class="modal-footer">
						<div id="msjbox2"></div>
						<div id="nota22"><p style="color:#FFA500"><b>Al menos tiene que seleccionar una UMC</b></p></div>
						<div id="nota33"><p style="color:#FFA500"><b>Al menos tiene que seleccionar una UMT</b></p></div>
						<div id="nota44"><p style="color:#FFA500"><b>Tiene que agruegar una Fraccion</b></p></div>
						<div class="row">
							<div class="col-md-12"><div id="mensaje"></div></div>
						</div>
						<button type="button" id="8" class="btn btn-danger enviar" style="height:33px; margin-top:11px;"onclick="javascript:validacionAjuste2();"><i class="fa fa-check"></i> Guardar</button>
					   	<button class="btn btn-white btn-cons next" data-dismiss="modal"  style="height:33px; margin-top:8px;" aria-hidden="true" onclick="javascript:location.reload();">Cerrar</button>
					</div> 
			    </div>			
		    </div>
	 	</div>
   	</div>

   	<div id="myModal4" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<i class="fa fa-exclamation-triangle fa-3x"></i>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 id="myModalLabel" class="semi-bold">Cuidado</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						   <h4></h4>
							 <h4>ESTA   SEGURO  DE <code>SUSPENDER</code> </h4>
					</div>
				</div>
				<div class="modal-footer">
				   <button id="55" class="btn btn-danger btn-success btn-cons"  data-dismiss="modal" type="button" style="height:33px; margin-top:8px;" ><i class="fa fa-check"></i> Guardar</button>
				   <button class="btn btn-white btn-cons next" data-dismiss="modal" style="height:33px;" aria-hidden="true" >Cerrar</button>
				</div>
		    </div>		
	    </div>
	</div>
	
   	<div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 id="myModalLabel" class="semi-bold">Cuidado</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						   <h4></h4>
							 <h4>ESTA   SEGURO  DE <code>ELIMINAR</code> </h4>
					</div>
				</div>
				<div class="modal-footer">
				   <button id="58" class="btn btn-danger btn-success btn-cons next enviar" data-dismiss="modal" type="button" style="height:33px; margin-top:8px;" ><i class="fa fa-check"></i>Guardar</button>
				   <button class="btn btn-white btn-cons next" data-dismiss="modal" style="height:33px;" aria-hidden="true" >Cerrar</button>
				</div>
	    	</div>		
    	</div>
	</div>

	<!-- BEGIN CORE JS FRAMEWORK--> 
	<script type="text/javascript" src="{PLUGINS}jquery-1.11.1.min.js"></script> 
	<script type="text/javascript" src="{PLUGINS}jquery-ui/jquery-ui-1.10.1.custom.min.js"></script>
	<script type="text/javascript" src="{PLUGINS}boostrapv3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="{JAVASCRIPT}messages_notifications.js"></script>
	<script type="text/javascript" src="{JAVASCRIPT}frameBase.js"></script>

	<script type="text/javascript" src="{PLUGINS}bootstrap-select2/select2.min.js"></script>
	<script type="text/javascript" src="{PLUGINS}validationEngine/jquery.validationEngine.js"></script>
	<script type="text/javascript" src="{PLUGINS}validationEngine/jquery.validationEngine-es.js"></script>
	<script type="text/javascript" src="{PLUGINS}jquery.confirm.min.js"></script>

	<!-- Datatable JS -->
	<link rel="stylesheet" href="{PLUGINS}datable_boostrap3/dataTables.bootstrap.css">
	<script type="text/javascript" src="{PLUGINS}datable_boostrap3/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="{PLUGINS}datable_boostrap3/dataTables.bootstrap.js"></script>

	<script type="text/javascript">
		tabla_materiales = table('tabla_materiales', 'ajax_fracciones/ajax_table_fracciones_materiales.php');
		tabla_productos = table('tabla_productos', 'ajax_fracciones/ajax_table_fracciones_partes.php');
		$('#mat').hide();
		$('#part').hide();
		$('#mat2').hide();
		$('#part2').hide();
		$('#nota1').hide();
		$('#nota2').hide();
		$('#nota3').hide();
		$('#nota4').hide();
		$('#nota5').hide();		
		$('#nota22').hide();
		$('#nota33').hide();
		$('#nota44').hide();

		$(document).ready(function($){
			{JS}
			/// Ejecutar funcion permisos
			$.permisos();
			//Bind validation engine
			$('.principal').validationEngine('attach', { promptPosition : "topRight", scroll: false});

		});

	 	function tipo(tipo)
	 	{	
	 		switch(tipo)
	 		{
	 			case 1: 
	 					//$('#material').val(null);
	 					$('#material').val();
	 					$('#umc1').val('');
	 					$('#umc2').val('');
	 					$('#fraccion').val('');
	 					$('#myModal1').modal('show');
	 					$('#mat').show();
						$('#part').hide();
						$('#tip').val(tipo);
						$('#material').select2();
						
	 			break;
	 			case 2: 
	 					$('#partes').val();
	 					$('#umc1').val('');
	 					$('#umt1').val('');
	 					$('#fraccion').val(''); 
		 				$('#myModal1').modal('show');
		 				$('#mat').hide();
						$('#part').show();
						$('#tip').val(tipo);
						$('#partes').select2();
	 			break;
	 		}	
	 	}

 		function validacionAjuste()
		{	
			var tipo= $('#tip').val();
 			var material= $('#material').val();
 			var parte = $('#partes').val();
 			var umc = $('#umc1').val();
 			var umt = $('#umt1').val();
 			var fraccion = $('#fraccion').val();
			
			if(tipo=='1')
			{	
				if (material==null || material=='')
				{
					$('#nota1').show();
					$('#nota2').hide();
					$('#nota3').hide();
					$('#nota4').hide();
					$('#nota5').hide();			
				}
				else if (umc=='')
				{	
					$('#nota1').hide();
					$('#nota2').show();
					$('#nota3').hide();
					$('#nota4').hide();
					$('#nota5').hide();
				} 
				 else if (umt=='')
				{	
					$('#nota1').hide();
					$('#nota2').hide();
					$('#nota3').show();
					$('#nota4').hide();
					$('#nota5').hide();
				} 
				else if(fraccion=='')
				{	
					$('#nota1').hide();
					$('#nota2').hide();
					$('#nota3').hide();
					$('#nota4').show();
					$('#nota5').hide();
				} 
				else
				{	
					Guardar();  
				}
			}
			else if(tipo=='2')
			{
				if (parte==null || parte=='')
				{
					$('#nota1').show();
					$('#nota2').hide();
					$('#nota3').hide();
					$('#nota4').hide();
					$('#nota5').hide();			
				}
				else if (umc=='')
				{	
					$('#nota1').hide();
					$('#nota2').show();
					$('#nota3').hide();
					$('#nota4').hide();
					$('#nota5').hide();
				} 
				 else if (umt=='')
				{	
					$('#nota1').hide();
					$('#nota2').hide();
					$('#nota3').show();
					$('#nota4').hide();
					$('#nota5').hide();
				} 
				else if(fraccion=='')
				{	
					$('#nota1').hide();
					$('#nota2').hide();
					$('#nota3').hide();
					$('#nota4').show();
					$('#nota5').hide();
				} 
				else
				{	
					Guardar();  
				}
			}

		}

		function validacionAjuste2()
		{	

			if ($('#umc2').val()=='')
			{	
				$('#nota22').show();
				$('#nota33').hide();
				$('#nota44').hide();

			} 
			else if ($('#umt2').val()=='')
			{	
				$('#nota22').hide();
				$('#nota33').show();
				$('#nota44').hide();
			} 
			else if($('#fraccion2').val()=='')
			{	
				$('#nota22').hide();
				$('#nota33').hide();
				$('#nota44').show();
			} 
			else
			{	
				Editar();  
			}

		}

	 	function Guardar()
	 	{	
	 		var tipo= $('#tip').val();
	 		var material= $('#material').val();
	 		var parte = $('#partes').val();
	 		var umc = $('#umc1').val();
	 		var umt = $('#umt1').val();
	 		var fraccion = $('#fraccion').val();
	 		
	 		switch(tipo)
	 		{
	 			case '1':
	 					var data = 'Method='+encode64('Guardar')+'&partmat='+material+'&umc='+umc+'&umt='+umt+'&fraccion='+fraccion+'&tipo='+'material';
	 			break;
	 			case '2':
	 					var data = 'Method='+encode64('Guardar')+'&partmat='+parte+'&umc='+umc+'&umt='+umt+'&fraccion='+fraccion+'&tipo='+'parte';
	 			break;
	 		}	
	 		var por = send(data);
	 		por.success(function(r)
	 		{		
	 			var str = r.split('|');
	 			$('#mensaje').html(str[0]);
	 			if (str[1]==1)
	 			{	
	 				location.reload();
	 			}
	 		});
	 	}

	 	function editar(id,tipo)
	 	{
	 		$('#myModal2').modal('show');
	 		var data = 'Method='+encode64('DisplayDatos')+'&id='+id+'&tipo='+tipo;
	 		var por = send(data);
	 		por.done(function(r)
			{	
				var myArray = JSON.parse(r);
				$('#id2').val(myArray['clave']);
				$('#umc2').val(myArray['umc']);
				$('#umt2').val(myArray['umt']);
				$('#fraccion2').val(myArray['fraccion']);
				var tip= myArray['tipo'];
				$('#tipo2').val(tip);
				if(tip=='material')
				{
					$('#material2').val(myArray['nombre']);
					$('#mat2').show();
				}
				else if(tip=='parte')
				{
					$('#parte2').val(myArray['nombre']);
					$('#part2').show();
				}
				
			});

	 	}

	 	function Editar()
	 	{
	 		var id= $('#id2').val();
	 		var umc = $('#umc2').val();
	 		var umt = $('#umt2').val();
	 		var fraccion = $('#fraccion2').val();
	 		var tipo = $('#tipo2').val();
	 		
	 		switch(tipo)
	 		{
	 			case 'material':
	 					var data = 'Method='+encode64('Editar')+'&partmat='+id+'&umc='+umc+'&umt='+umt+'&fraccion='+fraccion+'&tipo='+'material';
	 			break;
	 			case 'parte':
	 					var data = 'Method='+encode64('Editar')+'&partmat='+id+'&umc='+umc+'&umt='+umt+'&fraccion='+fraccion+'&tipo='+'parte';
	 			break;
	 		}	
	 		var por = send(data);
	 		por.success(function(r)
	 		{		
	 			var str = r.split('|');
	 			$('#mensaje').html(str[0]);
	 			if (str[1]==1)
	 			{	
	 				location.reload();
	 			}
	 		});
	 	}

	 	function suspender(id,tipo)
	 	{	
	 		$('#myModal4').modal('show');
	 		$('#55').attr('onclick',"javascript:Suspender('"+id+"','"+tipo+"')");
	 		
	 	}

	 	function Suspender(id,tipo)
	 	{	
	 		var mensaje = '';
	 		var data = 'Method='+encode64('Suspender')+'&id='+id;
	 		var por = send(data);
	 		por.done(function(r)
			{		

				var str= JSON.parse(r);
				if (str.Resultado==1)
				{	mensaje = '<div class="alert alert-success"><button class="close" data-dismiss="alert"></button>Suspendido <strong>Exitosamente</strong></div>';
					if(tipo =='material')
					{	
						$('#mensaje2').html(mensaje);
						$.reload(tabla_materiales);
					}
					else{
						$('#mensaje3').html(mensaje);
						$.reload(tabla_productos);
					}
					
				}
				else if (str.Resultado==2)
				{
					mensaje = '<div class="alert alert-success"><button class="close" data-dismiss="alert"></button> Reactivado <strong>Exitosamente</strong></div>';
					if(tipo =='material')
					{	
						
						$('#mensaje2').html(mensaje);
						$.reload(tabla_materiales);
					}
					else{
						$('#mensaje3').html(mensaje);
						$.reload(tabla_productos);
					}
				}
				else
				{
					mensaje= '<div class="alert"><button class="close" data-dismiss="alert"></button> Error <strong>"'+str.mensaje+'"</strong></div>';
				}

			});
				
	 	}

	 	function eliminar(id,tipo)
	 	{	
	 		$('#myModal3').modal('show');
	 		$('#58').attr('onclick',"javascript:Eliminar('"+id+"','"+tipo+"')");
	 		
	 	}

	 	function Eliminar(id,tipo)
	 	{	var menaje2 = ''
	 		var data = 'Method='+encode64('Eliminar')+'&id='+id;
		 		var por = send(data);
		 		por.done(function(r)
				{
					var str= JSON.parse(r);
					if (str.Resultado==1)
					{	
						mensaje2 = '<div class="alert alert-success"><button class="close" data-dismiss="alert"></button>Eliminado <strong>Exitosamente</strong></div>';
						if(tipo =='material')
						{	
							$('#mensaje2').html(mensaje2);
							$.reload(tabla_materiales);
						}
						else
						{
							$('#mensaje3').html(mensaje2);
							$.reload(tabla_productos);
						}
					}
					else
					{
						mensaje2= '<div class="alert"><button class="close" data-dismiss="alert"></button> Error <strong>"'+str.mensaje+'"</strong></div>';
					}

				});

	 	}


	</script>
</body>
</html>