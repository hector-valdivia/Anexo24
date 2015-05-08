<!--
  #AIS Business México SA de CV
  #dev@aisbusiness.mx
  #Gestor de Pedimentos
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
</head>
<body class="error-body no-top lazy">
	<div class="content" style="margin:2.5% 0 0 0;">
		<div class="page-title"> 
			<a href="javascript:goBack()">
				<i class="icon-custom-left"></i>
			</a>
			<h3>Pedimentos - <span class="semi-bold">KeyA</span></h3>
		</div>
		<ul class="breadcrumb">
			<li><p>Te encuentras en:</p></li>
			<li><a href="#" class="active">Gestor Pedimentos</a></li>
		</ul>
		<div class="row">
			<div class="col-md12">
				<div class="grid simple">
					<div class="grid-title">
						<h4><i class="fa fa-building-o"></i> Pedimentos <span class="semi-bold">Asignados</span></h4>
						<div class="pull-right">
							<div class="btn-group">
								<button class="btn btn-small btn-white btn-demo-space dropdown-toggle" data-toggle="dropdown">Aciones</button>
								<button class="btn btn-small btn-white dropdown-toggle btn-demo-space" data-toggle="dropdown" style="height: -2.1%;"> 
									<span class="caret"></span> 
								</button>
								<ul class="dropdown-menu" style="margin:0 0 0 -76%;">
									<li><a href="pedimentos" >Agregar Pedimento</a></li>
									<li class="divider"></li>
									<li><a href="#">Ayuda</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="grid-body ">
						<table class="table table-hover table-condensed" id="tabla_pedimentos" width="100%">
							<thead>
								<tr>
									<th>Clave</th>
									<th>Numero Pedimento</th>
									<th>Regimen</th>
									<th>Clave Pedimento</th>
									<th>Fecha</th>
									<th>Opciones</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<div id="modalAdd"  class="modal fade"  tabindex="-1"role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<form id="FormAdd" method="POST">
			<div class="modal-dialog"  style="width: 50%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel"><div id="tituloModal"><strong>Añadir Pedimento</strong></div></h3>
					</div>
					<div class="modal-body">
						{HTMLADD}
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">Guardar</button>
						<input type="hidden" name="hacer" id="hacer" value="agregar" />
						<button class="btn" style="height:33px;" data-dismiss="modal" aria-hidden="true">Cancelar</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="modalFact"  class="modal fade"  tabindex="-1"role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<form id="formFact" method="POST">
			<div class="modal-dialog"  style="width: 50%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel"><div id="tituloModal"><strong>Datos de la factura</strong></div></h3>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-12">
								<div id="izq" class="col-md-6">
									<div class="form-group">
										<label class="form-label"><strong>Numero de acuse de valor</strong></label>
										<div class="controls">
											<input type="text" name="acuseFact" id="acuseFact" value="" class="form-control validate[required]" readonly>
										</div>
									</div>
									<div class="form-group">
										<label class="form-label"><strong>Fecha</strong></label>
										<div class="controls">
											<input type="date" name="fechaFact" id="fechaFact" value="" class="form-control validate[required]">
										</div>
									</div>
									<div class="form-group">
										<label class="form-label"><strong>Incoterm</strong></label>
										<div class="controls">
											<input type="text" name="incoterm" id="incoterm" value="" class="form-control validate[required]">
										</div>
									</div>
									<div class="form-group">
										<label class="form-label"><strong>Moneda Factura</strong></label>
										<div class="controls">
											<!--<input type="text" name="monedaFact" id="monedaFact" value="{OPTMONEDA}" class="form-control validate[required]">-->
											<select id="monedaFact" name="monedaFact" class="form-control validate[required]">
												{OPTMONEDA}
											</select>
										</div>
									</div>
								</div>
								<div id="der" class="col-md-6">
									<div class="form-group">
										<label class="form-label"><strong>Valor Moneda Factura</strong></label>
										<div class="controls">
											<input type="text" name="valormonedaFact" id="valormonedaFact" value="" class="form-control validate[required]">
										</div>
									</div>
									<div class="form-group">
										<label class="form-label"><strong>Factor Moneda Factura</strong></label>
										<div class="controls">
											<input type="text" name="factormonedaFact" id="factormonedaFact" value="" class="form-control validate[required]">
										</div>
									</div>
									<div class="form-group">
										<label class="form-label"><strong>Valor Dolares</strong></label>
										<div class="controls">
											<input type="text" name="valorDolares" id="valorDolares" value="" class="form-control validate[required]">
										</div>
									</div>
									<div id="inputs">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">Guardar</button>
						<input type="hidden" name="hacer" id="hacer" value="agregar" />
						<button class="btn" style="height:33px;" data-dismiss="modal" aria-hidden="true">Cancelar</button>
					</div>
				</div>
			</div>
		</form>
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
	<link rel="stylesheet" href="{PLUGINS}datable_boostrap3/dataTables.bootstrap.css"/>
	<script type="text/javascript" src="{PLUGINS}datable_boostrap3/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="{PLUGINS}datable_boostrap3/dataTables.bootstrap.js"></script>
	<script>
		var tabPedimentos = table('tabla_pedimentos', 'ajax_pedimentos/ajax_table_pedimentos.php');
		var header = '';
		var html   = '';
		var footer = '';
		$(document).ready(function(){
			$('#formFact').validationEngine();
			$('#FormAdd').validationEngine('attach', { promptPosition : "topRight", scroll: false})
			.submit(function(e){
				e.preventDefault();
				if ( $(this).validationEngine('validate') ) {
					$data = $(this).serializeObject();
					$.extend($data, { 'Method':'Pedimento' } );
					$.enviar($data, $(this)).done(function (r) {
						if (r.r == 1) $.reload(tabPedimentos);
						else $.mensaje( r.mensaje, 0, $('#modalAdd .modal-body') );
					});
				}
			});

			//Abrir agregar pedimento
			/*$('#pedimento').click(function(e){
				e.preventDefault();
				$('#FormAdd #hacer').val('Agregar');
				$('#modalAdd').modal('show');
			});*/

			/// Pedimento editar
			$.pedimento_editar = function( $pedimento ){
				$('#FormAdd #hacer').val('Editar');
				$.enviar({ 'Method':'getPedimento', 'num_pedimento':$pedimento }).done(function(r){
					if ( r.r == 1 ){
						$p = r.pedimento;
						$form = $("#FormAdd");
						$form.find("#numPedimento").attr('readonly',true).val($p.num_pedimento);
						$form.find("#tipoOperacion").val($p.tipo_operacion);
						$form.find("#clavePedimento").val($p.clave_pedimento);
						$form.find("#regimen").val($p.regimen);
						$form.find("#tipoCambio").val($p.tipo_cambio);
						$form.find("#pesoBruto").val($p.peso_bruto);
						$form.find("#aduana").val($p.aduana);
						$form.find("#valorDolares").val($p.valor_dolares);
						$form.find("#fecha").val($p.fecha);
						$('#modalAdd').modal('show');
					}
				});
			};

			$.pedimento_eliminar = function( $pedimento ){
				$.confirm({
					text: "<p>¿Esta seguro que quiere eliminar el pedimento <b>"+$pedimento+"</b>?</p>",
					title: "Confirmar eliminar pedimento",
					confirm: function(button) {
						$.enviar({
							'Method':'deletePedimento',
							'num_pedimento':$pedimento
						}).done(function(r){
							if ( r.r == 1 ) $.reload(tabPedimentos);
						});
					},
					confirmButton: "Si, eliminar pedimento",
					cancelButton: "Cancelar",
					post: true,
					confirmButtonClass: "btn-danger",
					cancelButtonClass: "btn-default"
				});
			};

			//Limpiar modal y dejarlo listo
			$('#modalAdd').on('hidden.bs.modal', function (e) {
				$form = $('#FormAdd');
				$form.trigger('reset').find('#hacer').val('Agregar');
				$form.find('#numPedimento').attr('readonly',false);
				$form.validationEngine('hide');
			});
		});

		function addPedimento(){
			header  = '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>';
			header += '<h3 id="myModalLabel"><div id="tituloModal"><strong>Añadir Pedimento</strong></div></h3>';
			footer = "<button type=\"button\" class=\"btn btn-danger\" onclick=\"guardar('','pedimento')\">Guardar</button>";
			footer += '<button class="btn" style="height:33px;" data-dismiss="modal" aria-hidden="true" onclick="javascript:location.reload();">Cancelar</button>';
			$('#modalAdd .modal-header').html(header);
			$('#modalAdd .modal-footer').html(footer);
			$('#modalAdd').modal('show');
		}
		/*function guardar(valor,tipo){
			if (tipo == 'pedimento') {
				formulario  = $('#FormAdd').serialize();
				var dataGuardar  = 'Method='+encode64('AgregarPedimento')+'&numPedimento='+$('#numPedimento').val()+'&datos='+formulario;
				var guardar      = send(dataGuardar);
				guardar.done(function(ResultGuardar){
					$('#modalAdd #Result2').html(ResultGuardar);
				});
			}
			else if (tipo == 'factura')
			{
				if (($('#idFiscal').val() != '') && ($('#razonSocial').val() != '') && ($('#domicilio').val() != ''))
					$('#modalAdd .modal-body #der').show();
			}
			else if (tipo == 'partida')			
			{
				formulario  = $('#FormAdd').serialize();
				var dataGuardar = 'Method='+encode64('AgregarPartida')+'&numPedimento='+valor+'&'+formulario;
				var guardar     = send(dataGuardar);
				guardar.done(function(ResultGuardar){
					if (ResultGuardar == '1')
					{
						html  ='<div id="result2">';
						html +="	<button type=\"button\" class=\"alert alert-success\" data-dismiss=\"modal\" aria-hidden=\"true\" style=\"width:100%\" onclick=\"\">Partida guardada <strong>Exitosamente!!</strong> x </button>";
						html +='</div>';
						$('#modalAdd .modal-body #Result2').html(html);
						html = '';
					}
				});
			}
		}
		function guardarFactura(){
			formulario = $('#formFact').serialize();			
			var dataFactura  = 'Method='+encode64('guardarFactura')+'&'+formulario;
			var Factura      = send(dataFactura);
			Factura.done(function(resultFactura){						
				if (resultFactura == '1')
				{
					html  ='<div id="result2">';
					html +="	<button type=\"button\" class=\"alert alert-success\" data-dismiss=\"modal\" aria-hidden=\"true\" style=\"width:100%\" onclick=\"javascript:$('#modalAdd').modal('show');\">Factura guardada <strong>Exitosamente!!</strong> x </button>";
					html +='</div>';
					$('#modalFact .modal-body').append(html);
					html = '';
				}
			});
		}
		function asignarFacturas(pedimento){
			header  = '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>';
			header  = '<h3 id="myModalLabel"><div id="tituloModal"><strong>Datos del proveedor o comprador</strong></div></h3>';
			html   += '<div class="row">';
			html   += '	<div class="col-md-12">';
			html   += '		<div class="col-md-6" id="izq">';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Datos del Proveedor o Comprador</strong></label>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>ID Fiscal</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="idFiscal" id="idFiscal" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Nombre, denominacion o razon social</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="razonSocial" id="razonSocial" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Domicilio</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="domicilio" id="domicilio" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '		</div>';
			html   += '		<div class="col-md-6" id="der">';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Datos de las facturas</strong></label>';
			html   += "				<button type=\"button\" id=\"facturas\" onclick=\"agregarDetFactura('"+pedimento+"')\">Add</button>";
			html   += '			</div>';
			html   += '			<div id="datosFact">';
			html   += '			</div>';
			html   += '		</div>';
			html   += '	</div>';
			html   += '</div>';
			html   += '<div id="Result2">';
			html   += '</div>';
			footer  = "<button type=\"button\" class=\"btn btn-primary\" onclick=\"guardar('"+pedimento+"','factura')\">Agregar Facturas</button>";
			footer += '<button class="btn" style="height:33px;" data-dismiss="modal" aria-hidden="true" onclick="javascript:location.reload();">Cancelar</button>';
			$('#modalAdd .modal-header').html(header);
			$('#modalAdd .modal-body').html(html);
			$('#modalAdd .modal-footer').html(footer);
			$('#modalAdd').modal('show');
			agregarDetFactura(pedimento);
			$('#modalAdd .modal-body #der').hide();			
		}
		function agregarDetFactura(pedimento){
			html     = '<div>';
			html    += '<label class="form-label"><strong>Numero de Factura</strong></label>';
			html    += '<input type="text" id="numfact" value="" class="numfactClass"></input>';
			html    += "<button style=\"height:36px\" type=\"button\" id=\"btndatosFact\" onclick=\"javascript:$('#modalAdd').modal('hide');$('#modalFact').modal('show');$('#modalFact #acuseFact').val($(this).parent().find('#numfact').val());\" disabled>Datos</button>";
			html    += '<button style=\"height:36px\" type="button" id="elimFact" onclick="$(this).parent().remove();">Eliminar</button>';
			html    += '</div>';
			inputs   = "<input type=\"hidden\" id=\"pedimento\" name=\"pedimento\" value=\""+pedimento+"\"></input>";
			inputs  += "<input type=\"hidden\" id=\"idfiscal\" name=\"idfiscal\" value=\""+$('#idFiscal').val()+"\"></input>";
			inputs  += "<input type=\"hidden\" id=\"nombre\" name=\"nombre\" value=\""+$('#razonSocial').val()+"\"></input>";
			inputs  += "<input type=\"hidden\" id=\"domicilio\" name=\"domicilio\" value=\""+$('#domicilio').val()+"\"></input>";
			$('#modalFact #inputs').html(inputs);			
			$('#datosFact').append(html);
			$('.numfactClass').keyup(function(event){							
				$('.numfactClass').each(function(){					
					$(this).parent().find('#btndatosFact').removeAttr('disabled');
				});
			});
		}		
		function asignarPartidas(pedimento){
			header  = '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>';
			header += '<h3 id="myModalLabel"><div id="tituloModal"><strong>Datos de la partida</strong></div></h3>';
			header += '<h4 id="myModalLabel"><div id="tituloModal2">Pedimento# <strong>'+pedimento+'</strong></div></h4>';
			html   += '<div class="row">';
			html   += '	<div class="col-md-12">';
			html   += '		<div class="col-md-6" id="izq">';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Seccion</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="seccion" id="seccion" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Fraccion</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="fraccion" id="fraccion" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>UMC</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="umc" id="umc" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Cantidad UMC</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="cantidadumc" id="cantidadumc" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>UMT</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="umt" id="umt" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Cantidad UMT</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="cantidadumt" id="cantidadumt" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';			
			html   += '		</div>';
			html   += '		<div class="col-md-6" id="der">';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>P.V/C</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="pvc" id="pvc" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>P.O/D</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="pod" id="pod" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Descripcion</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="descripcion" id="descripcion" value="" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Val ADU/USD</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="valaduUSD" id="valaduUSD" value="0.0" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Imp. Precio Pagado</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="impprecioPagado" id="impprecioPagado" value="0.0" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Precio Unitario</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="precioUnitario" id="precioUnitario" value="0.0" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div class="form-group">';
			html   += '				<label class="form-label"><strong>Valor Agregado</strong></label>';
			html   += '				<div class="controls">';
			html   += '					<input type="text" name="valAgregado" id="valAgregado" value="0.0" class="form-control validate[required]">';
			html   += '				</div>';
			html   += '			</div>';
			html   += '			<div id="datosFact">';
			html   += '			</div>';
			html   += '		</div>';
			html   += '	</div>';
			html   += '</div>';
			html   += '<div id="Result2">';
			html   += '</div>';
			footer  = "<button type=\"button\" class=\"btn btn-danger\" onclick=\"guardar('"+pedimento+"','partida')\">Guardar</button>";
			footer += '<button class="btn" style="height:33px;" data-dismiss="modal" aria-hidden="true" onclick="javascript:location.reload();">Cancelar</button>';
			$('#modalAdd .modal-header').html(header);
			$('#modalAdd .modal-body').html(html);
			$('#modalAdd .modal-footer').html(footer);
			$('#modalAdd').modal('show');
		}*/
		$('#modalFact').on('show', function(){
			$(this).find('#result2').remove();
		});	
	</script>
</body>
</html>