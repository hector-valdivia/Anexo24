<!--
  #AIS Business México SA de CV
  #dev@aisbusiness.mx
  #Agregar/Editar Pedimentos
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
			<h3>Pedimento - <span class="semi-bold">Agregar</span></h3>
		</div>
		<ul class="breadcrumb">
			<li><p>Te encuentras en:</p></li>
			<li><a href="#" class="active">Pedimento</a></li>
		</ul>
		<div class="row">
			<div class="col-md-12">
				<div id="mensaje"></div>
				<div class="grid simple ">
					<div class="grid-title">
						<h4><i class="fa fa-building-o"></i> Pedimento <span class="semi-bold"></span></h4>
					</div>
					<div class="grid-body">
						<form name="pedimento" id="pedimento">
							<div class="row">
								<div class="col-md-12">
									<h4>INFORMACION GENERAL DEL PEDIMENTO</h4>
									<div class="color-bands green"></div>
									<div class="color-bands purple"></div>
									<div class="color-bands red"></div>
									<div class="color-bands blue"></div>
								</div>
							</div>
							<div class="row form-row">
								<div class="col-md-3">
									<label for="num_pedimento">Numero Pedimento</label>
									<input type="text" name="num_pedimento" id="num_pedimento" class="form-control validate[required]">
								</div>

								<div class="col-md-2">
									<label class="form-label">Tipo de operacion</label>
									<select name="tipo_operacion" id="tipo_operacion" class="form-control validate[required]">
										<option value="IMP">IMP</option>
										<option value="EXP">EXP</option>
									</select>
								</div>

								<div class="col-md-4">
									<label for="clave_pedimento">Clave de Pedimento</label>
									<select id="clave_pedimento" name="clave_pedimento" class="form-control validate[required]">{cve}</select>
								</div>

								<div class="col-md-3">
									<label for="regimen">Regimen</label>
									<select id="regimen" name="regimen" class="form-control validate[required]">{regimen}</select>
								</div>
							</div>

							<div class="row form-row">
								<div class="col-md-2">
									<label for="tipo_cambio">Tipo de cambio</label>
									<input type="text" name="tipo_cambio" id="tipo_cambio" class="form-control validate[required]">
								</div>

								<div class="col-md-2">
									<label>Peso bruto</label>
									<input type="text" name="peso_bruto" id="peso_bruto" class="form-control validate[required]">
								</div>

								<div class="col-md-4">
									<label for="aduana">Aduana</label>
									<select id="aduana" name="aduana" class="form-control validate[required]">
										{aduanas}
									</select>
								</div>

								<div class="col-md-2">
									<label for="valor_dolares">Valor Dolares</label>
									<input type="text" name="valor_dolares" id="valor_dolares" class="form-control validate[required]">
								</div>

								<div class="col-md-2">
									<label>Fecha pago pedimento</label>
									<input type="date" name="fecha" id="fecha" class="form-control validate[required]">
								</div>
							</div>
						</form>
						<hr />

						<!--------- =============================== DATOS DE PROVEEDOR O COMPRADOR =============================== -------->
						<div class="row form-row">
							<div class="col-md-8">
								<h4>DATOS DE PROVEEDOR O COMPRADOR</h4>
							</div>
							<div class="col-md-4 text-right">
								<button type="button" id="addproveedor" class="btn btn-info"><i class="fa fa-plus"></i> Proveedor</button>
							</div>
						</div>
						<div class="row form-row">
							<div class="col-md-12">
								<div class="color-bands green"></div>
								<div class="color-bands purple"></div>
								<div class="color-bands red"></div>
								<div class="color-bands blue"></div>
							</div>
						</div>
						<div id="proveedores">
							<div class="proveedor">
								<div class="row form-row" style="background: aliceblue; padding: 10px;">
									<div class="col-md-4">
										<label for="idFiscal">ID Fiscal / Proveedor o Comprador</label>
										<select class="form-control idFiscal"></select>
									</div>
									<div class="col-md-8">
										<label for="domicilio">Domocilio</label>
										<input type="text" class="form-control domicilio" />
									</div>
								</div>
								<div class="row form-row">
									<table class="table table-striped table-condensed table-responsive" style="width: 100%">
										<thead style="background-color: #737B8A;color: white;">
											<tr>
												<th style="vertical-align: middle;">Numero Acuse de valor</th>
												<th style="vertical-align: middle;">Fecha Fact.</th>
												<th style="vertical-align: middle;">Incoterm</th>
												<th style="vertical-align: middle;">Moneda</th>
												<th style="vertical-align: middle;">Val.Dolares</th>
												<th style="vertical-align: middle;">Inf. Factura</th>
												<th style="vertical-align: middle;"><button class="btn btn-info btn-mini agregar_factura"><i class="fa fa-plus"></i></button></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="text" name="num_factura" class="form-control input-sm num_factura" /></td>
												<td><input type="date" name="fecha_factura" class="form-control input-sm fecha_factura" /></td>
												<td><input type="text" name="incoterm" class="form-control input-sm incoterm" /></td>
												<td><select name="moneda_factura"  class="form-control input-sm moneda_factura"></select></td>
												<td><input type="number" name="valor_dolares" class="form-control input-sm valor_dolares" /></td>
												<td><button class="btn btn-success btn-small detalles_factura">Detalles</button></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<hr />
						<!--------- =============================== PARTIDAS =============================== -------->
						<div id="partidas">
							<div class="row form-row">
								<div class="col-md-10">
									<h4>PARTIDAS</h4>
								</div>
								<div class="col-md-2">
									<button id="addpartida" class="btn btn-info"><i class="fa fa-plus"></i> Agregar Partida</button>
								</div>
							</div>
							<div class="row form-row">
								<div class="col-md-12">
									<div class="color-bands green"></div>
									<div class="color-bands purple"></div>
									<div class="color-bands red"></div>
									<div class="color-bands blue"></div>
								</div>
							</div>
							<div class="row form-row partida">
								<div class="col-md-1">
									<h1 class="sec">1</h1>
								</div>
								<div class="col-md-11">
									<div class="row form-row">
										<div class="col-md-2">
											<label>Fraccion</label>
											<input type="text" name="fraccion" class="form-control fraccion">
										</div>
										<div class="col-md-2">
											<label>UMC</label>
											<select name="umc" class="form-control optUM umc"></select>
										</div>
										<div class="col-md-2">
											<label>CANT.UMC</label>
											<input type="text" name="cantidad_umc" class="form-control cantidad_umc">
										</div>
										<div class="col-md-2">
											<label>UMT</label>
											<select name="umt" class="form-control optUM umt"></select>
										</div>
										<div class="col-md-2">
											<label>CANT.UMT</label>
											<input type="text" name="cantidad_umt" class="form-control cantidad_umt">
										</div>
										<div class="col-md-1">
											<label>P.V/C</label>
											<input type="text" name="pvc" class="form-control pvc">
										</div>
										<div class="col-md-1">
											<label>P.O/D</label>
											<input type="text" name="pod" class="form-control pod">
										</div>
									</div>
									<div class="row form-row">
										<div class="col-md-12">
											<label>Descripcion Pedimento</label>
											<input type="text" name="descripcion" class="form-control descripcion">
										</div>
									</div>
									<div class="row form-row">
										<div class="col-md-12">
											<label>Numeros de parte que componen la partida</label>
											<table class="table table-condensed table-responsive" style="width: 100%;">
												<thead>
													<tr>
														<th>Num. Parte</th>
														<th>CANT.UMC</th>
														<th>CANT.UMT</th>
														<th><button class="btn btn-info btn-mini add_numero_parte"><i style="font-size: 12px;" class="fa fa-plus"></i></button></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><input type="text" name="num_parte" class="form-control input-sm num_parte" /></td>
														<td><input type="number" name="num_parte_umc" class="form-control input-sm" /></td>
														<td><input type="number" name="num_parte_umt" class="form-control input-sm" /></td>
														<td></td>
													</tr>
												</tbody>
												<tfoot>
													<tr style="background-color: aliceblue;">
														<td>Cantidad Totales</td>
														<td class="num_parte_umc"></td>
														<td class="num_parte_umt"></td>
														<td></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
									<div class="row form-row">
										<div class="col-md-3">
											<label>VAL ADU/USD</label>
											<input type="text" name="val_adu" class="form-control val_adu">
										</div>
										<div class="col-md-3">
											<label>IMP. PRECIO PAG.</label>
											<input type="text" name="imp_precio_pag" class="form-control imp_precio_pag">
										</div>
										<div class="col-md-3">
											<label>PRECIO UNIT</label>
											<input type="text" name="precio_unit" class="form-control precio_unit">
										</div>
										<div class="col-md-3">
											<label>VAL. AGREG.</label>
											<input type="text" name="valor_agregado" class="form-control valor_agregado">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-actions">
							<div class="pull-right">
								<button type="button" class="btn btn-danger btn-cons" id="guardar">Guardar</button>
								<button type="button" class="btn btn-white btn-cons" onclick="goBack()">Cancelar</button>
							</div>
						</div>
					</div>
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
	<script type="text/javascript" src="{PLUGINS}Bootstrap-Confirmation/bootstrap-confirmation.js"></script>

	<!-- Datatable JS -->
	<link rel="stylesheet" href="{PLUGINS}datable_boostrap3/dataTables.bootstrap.css"/>
	<script type="text/javascript" src="{PLUGINS}datable_boostrap3/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="{PLUGINS}datable_boostrap3/dataTables.bootstrap.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$um 	= '';
			$pc 	= '';
			$moneda = '';

			$('#pedimento').validationEngine();

			///Get info for display
			$.enviar({ 'Method':'getDisplay' }).done(function(r){
				if ( r.r == 1 ){
					///Sacar variables
					$um 	= r.um;
					$pc 	= r.cliente;
					$moneda = r.moneda;

					///UM
					$.each( $('.optUM'), function(u,selects){
						$select = $(this)[0];
						$.each($um,function(i,um){
							$select.add( new Option(um.id+'/'+um.unidad,um.id) );
						});
					});

					//Input cliente
					$('.idFiscal')[0].add( new Option('Seleccione Cliente', '') );
					$.each($pc,function(i,c){
						$('.idFiscal')[0].add( new Option(c.rfc+' / '+c.cliente,c.rfc) );
					});

					//Input moneda
					$.each($moneda,function(i,m){
						$('.moneda_factura')[0].add( new Option(m.moneda,m.moneda) );
					});

					///Get from url
					$pedimento = $.getUrlVar('p');
					if ( !$.isEmpty($pedimento) ){
						$.enviar({ 'Method':'getPedimento', 'p':$pedimento }).done(function (r) {
							if ( r.r == 1 ){

								//Agregar informacion del pedimento
								$.each(r.pedimento, function(index,pedimento){
									$('#'+index).val(pedimento);
								});
								$("#num_pedimento").attr('readonly',true);

								///Agregar facturas
								if ( !$.isEmpty(r.facturas) ) {
									$i = 0;
									$.each(r.facturas, function (indice, factura) {
										if ($i != 0) $('#addproveedor').trigger('click');
										$proveedor = $('.proveedor').last();
										$proveedor.find('.idFiscal').val(factura.idFiscal);
										$proveedor.find('.domicilio').val(factura.domicilio);
										$o = 0;
										$.each(factura.factura, function (i, f) {
											if ($o > 0) $proveedor.find('.agregar_factura').trigger('click');
											$tr = $proveedor.find('table tbody tr').last();
											$tr.find('.fecha_factura').val(f.fecha_factura);
											$tr.find('.incoterm').val(f.incoterm);
											$tr.find('.moneda_factura').val(f.moneda_factura);
											$tr.find('.num_factura').val(f.num_factura);
											$tr.find('.valor_dolares').val(f.valor_dolares);
											$o++;
										});

										$i++;
									});
								}

								///Partidas
								$i = 0;
								$.each(r.partidas,function(indice,partidas){
									if ( $i > 0 ) $('#addpartida').trigger('click');
									$partida = $('.partida').last();
									$.each(partidas,function(i,p){
										$partida.find('.'+i).val(p);
									});
									$i++;
								});
							}
						});
					}
				}
			});

			///Comportamiento al seleccionar la id fiscal
			$(document).on('change','.idFiscal', function(){
				$val = $(this).val();
				$d = $pc[$('.idFiscal').val()]['direccion'];
				$(this).parent().next().find('.domicilio').val(
					$d.numero+' '+ $d.calle + ' ' + $d.colonia + ' ' + $d.estado + ' ' + $d.cp
				);
			});

			///Agregar Facturas
			$(document).on('click','.agregar_factura',function(e){
				e.preventDefault();
				///Generamos el select de monedas
				$select_moneda = $('<select />', { 'name':'moneda_factura', 'class': 'form-control input-sm moneda_factura' });
				$.each($moneda,function(i,m){
					$select_moneda[0].add( new Option(m.moneda,m.moneda) );
				});

				$(this).parents('thead').next().append(
					$('<tr />').append(
						$('<td />').append( $('<input />',{ 'type':'text' ,'class':'form-control input-sm num_factura', 'name':'num_factura' }) ),
						$('<td />').append( $('<input />',{ 'type':'date' ,'class':'form-control input-sm fecha_factura', 'name':'fecha_factura' }) ),
						$('<td />').append( $('<input />',{ 'type':'text' ,'class':'form-control input-sm incoterm', 'name':'incoterm' }) ),
						$('<td />').append( $select_moneda ),
						$('<td />').append( $('<input />',{ 'type':'number' ,'class':'form-control input-sm valor_dolares', 'name':'valor_dolares' }) ),
						$('<td />').append( $('<button />',{ 'text':'Detalles' ,'class':'btn btn-success btn-small detalles_factura', 'name':'detalles_factura' }) ),
						$('<td />').append( $('<a />', { 'text':'X', 'href':'#','class':'remove', 'style':'font-size: 16px' }) )
					)
				);
			});

			///Remover fila de tabla
			$(document).on('click','.remove',function(e){
				e.preventDefault();
				$(this).parents('tr').remove();
			});

			///Agregar todo el cliente proveedor
			$(document).on('click','#addproveedor', function (e) {
				e.preventDefault();
				$select_clientes = $('<select />', { 'name':'idFiscal', 'class':'form-control idFiscal' });
				$select_clientes[0].add( new Option('Seleccione Cliente', '') );
				$.each($pc,function(i,c){
					$select_clientes[0].add( new Option(c.rfc+' / '+c.cliente,c.rfc) );
				});

				$select_moneda = $('<select />', { 'name':'moneda_factura','class':'form-control moneda_factura' });
				$.each($moneda,function(i,m){
					$select_moneda[0].add( new Option(m.moneda,m.id_moneda) );
				});

				$('<hr />').appendTo( $('#proveedores') );

				$('<div />',{ 'class':'proveedor' }).append(
					$('<div />',{ 'class':'row form-row' }).append(
							$('<div />', { 'class':'col-md-8' }).append(
									$('<h4 />',{'text':'DATOS DEL PROVEEDOR O COMPRADOR'})
							),
							$('<div />', { 'class':'col-md-4 text-right' }).append(
									$('<button />',{ 'text':'Remover' ,'class':'btn btn-warning removeproveedor popconfirm_full', 'data-toggle':'confirmation' })
							)
					),
					$('<div />',{ 'class':'row form-row', 'style':'background: aliceblue; padding: 10px;' }).append(
						$('<div />', { 'class':'col-md-4' }).append(
							$('<label />',{ 'for':'idFiscal', 'text':'ID Fiscal / Proveedor o Comprador'}),
							$select_clientes
						),
						$('<div />', { 'class':'col-md-8' }).append(
							$('<label />',{ 'for':'domicilio', 'text':'Domocilio'}),
							$('<input />',{ 'type':'text', 'class':'form-control domicilio' })
						)
					),
					$('<div />',{ 'class':'row form-row' }).append(
							$('<table />',{ 'class':'table table-striped', 'style':'width: 100%' }).append(
									$('<thead />', { 'style':'background-color: #737B8A;color: white;' }).append(
											$('<tr />').append(
													$('<th />',{'text':'Numero Acuse de valor','style':'vertical-align: middle;'}),
													$('<th />',{'text':'Fecha Fact.','style':'vertical-align: middle;'}),
													$('<th />',{'text':'Incoterm','style':'vertical-align: middle;'}),
													$('<th />',{'text':'Moneda','style':'vertical-align: middle;'}),
													$('<th />',{'text':'Val.Dolares','style':'vertical-align: middle;'}),
													$('<th />',{'text':'Inf. Factura','style':'vertical-align: middle;'}),
													$('<th />',{'style':'vertical-align: middle;'}).append(
															$('<button />', { 'class':'btn btn-info btn-mini agregar_factura' }).append( $('<i />',{ 'class':'fa fa-plus' }) )
													)
											)
									),
									$('<tbody />').append(
											$('<tr />').append(
												$('<td />').append( $('<input />',{ 'type':'text' ,'class':'form-control num_factura', 'name':'num_factura' }) ),
												$('<td />').append( $('<input />',{ 'type':'date' ,'class':'form-control fecha_factura', 'name':'fecha_factura' }) ),
												$('<td />').append( $('<input />',{ 'type':'text' ,'class':'form-control incoterm', 'name':'incoterm' }) ),
												$('<td />').append( $select_moneda ),
												$('<td />').append( $('<input />',{ 'type':'text' ,'class':'form-control valor_dolares', 'name':'valor_dolares' }) ),
												$('<td />').append( $('<button />',{ 'text':'Detalles' ,'class':'btn btn-success btn-small detalles_factura' }) ),
												$('<td />').append()
											)
									)
							)

					)
				).appendTo( $('#proveedores') );
			});

			///Remover todo el cliente/proveedor
			$(document).on('click','.removeproveedor',function(e){
				e.preventDefault();
				$div = $(this).parents('div.proveedor');
				$div.prev('hr').remove();
				$div.remove();
			});

			///Agregar partida
			$(document).on('click','#addpartida',function(e){
				e.preventDefault();
				$seccion = parseFloat( $('.partida').last().find('h1.sec').html() ) + 1;

				$('<hr />').appendTo( $('#partidas') );

				$('<div />', { 'class':'row form-row partida' }).append(
					$('<div />', { 'class':'col-md-1' }).append(
						$('<h1 />',{ 'class':'sec', 'text':$seccion }),
						$('<button />', { 'id':'remove'+$seccion, 'class':'btn btn-warning removepartida', 'data-toggle':'confirmation', 'text':'Quitar' })
					),
					$('<div />', {  'class':'col-md-11' }).append(
						$('<div />', { 'class':'row form-row' }).append(
							$('<div />', { 'class':'col-md-2' }).append(
								$('<label />',{ 'text':'Fraccion' }),
								$('<input />', { 'type':'text', 'class':'form-control fraccion', 'name':'fraccion' })
							),
							$('<div />', { 'class':'col-md-2' }).append(
								$('<label />',{ 'text':'UMC' }),
								$('<select />', { 'class':'form-control optUM umc' })
							),
							$('<div />', { 'class':'col-md-2' }).append(
								$('<label />',{ 'text':'CANT.UMC' }),
								$('<input />', { 'type':'text', 'class':'form-control cantidad_umc', 'name':'cantidad_umc' })
							),
							$('<div />', { 'class':'col-md-2' }).append(
								$('<label />',{ 'text':'UMT' }),
								$('<select />', { 'class':'form-control optUM umt' })
							),
								$('<div />', { 'class':'col-md-2' }).append(
								$('<label />',{ 'text':'CANT.UMT' }),
								$('<input />', { 'type':'text', 'class':'form-control cantidad_umt', 'name':'cantidad_umt' })
							),
							$('<div />', { 'class':'col-md-1' }).append(
								$('<label />',{ 'text':'P.V/C' }),
								$('<input />', { 'type':'text', 'class':'form-control pvc', 'name':'pvc' })
							),
							$('<div />', { 'class':'col-md-1' }).append(
								$('<label />',{ 'text':'P.O/D' }),
								$('<input />', { 'type':'text', 'class':'form-control pod', 'name':'pod' })
							)
						),

						$('<div />', { 'class':'row form-row' }).append(
							$('<div />', { 'class':'col-md-12' }).append(
								$('<label />',{ 'text':'Descripcion del pedimento' }),
								$('<input />', { 'type':'text', 'class':'form-control descripcion', 'name':'descripcion' })
							)
						),

						$('<div />', { 'class':'row form-row' }).append(
							$('<div />', { 'class':'col-md-12' }).append(
								$('<label />',{ 'text':'Numeros de parte que componen la partida' }),
								$('<table />', { 'class':'table table-condensed table-responsive' }).append(
									$('<thead />').append(
										$('<tr />').append(
											$('<th />', { 'text':'Num. Parte' }),
											$('<th />', { 'text':'CANT.UMC' }),
											$('<th />', { 'text':'CANT.UMT' }),
											$('<th />').append(
												$('<button />',{'class':'btn btn-info btn-mini add_numero_parte'}).append( $('<i />',{'style':'font-size: 12px;', 'class':'fa fa-plus'}) )
											)
										)
									),
									$('<tbody />').append(
										$('<tr />').append(
											$('<td />').append( $('<input />',{ 'type':'text', 'name':'num_parte', 'class':'form-control input-sm num_parte' }) ),
											$('<td />').append( $('<input />',{ 'type':'number', 'name':'num_parte_umc', 'class':'form-control input-sm num_parte' }) ),
											$('<td />').append( $('<input />',{ 'type':'number', 'name':'num_parte_umt', 'class':'form-control input-sm num_parte' }) ),
											$('<td />').append( $('<a />', { 'text':'X', 'href':'#','class':'remove', 'style':'font-size: 16px' }) )
										)
									),
									$('<tfoot />').append(
										$('<tr />', { 'class':'background-color: aliceblue;'}).append(
											$('<td />',{ 'text':'Cantidad Totales'}),
											$('<td />', { 'class':'num_parte_umc' }),
											$('<td />', { 'class':'num_parte_umt' }),
											$('<td />')
										)
									)
								)
							)
						),

						$('<div />', { 'class':'row form-row' }).append(
							$('<div />', { 'class':'col-md-3' }).append(
								$('<label />',{ 'text':'VAL ADU/USD' }),
								$('<input />', { 'type':'text', 'class':'form-control val_adu', 'name':'val_adu' })
							),
							$('<div />', { 'class':'col-md-3' }).append(
								$('<label />',{ 'text':'IMP. PRECIO PAG.' }),
								$('<input />', { 'type':'text', 'class':'form-control imp_precio_pag', 'name':'imp_precio_pag' })
							),
							$('<div />', { 'class':'col-md-3' }).append(
								$('<label />',{ 'text':'PRECIO UNIT' }),
								$('<input />', { 'type':'text', 'class':'form-control precio_unit', 'name':'precio_unit' })
							),
							$('<div />', { 'class':'col-md-3' }).append(
								$('<label />',{ 'text':'VAL. AGREG.' }),
								$('<input />', { 'type':'text', 'class':'form-control valor_agregado', 'name':'valor_agregado' })
							)
						)
					)
				).appendTo( $('#partidas') );

				$.each( $('.partida').last().find( 'select.optUM' ), function(u,selects){
					$select = $(this)[0];
					$.each($um,function(i,um){
						$select.add( new Option(um.id+'/'+um.unidad,um.id) );
					});
				});
			});

			///Agregar numero de parte a la partida
			$(document).on('click', '.add_numero_parte',function(e){
				e.preventDefault();
				///Generamos el select de monedas
				$select_moneda = $('<select />', { 'name':'moneda_factura', 'class': 'form-control moneda_factura' });
				$.each($moneda,function(i,m){
					$select_moneda[0].add( new Option(m.moneda,m.moneda) );
				});

				$(this).parents('thead').next().append(
						$('<tr />').append(
								$('<td />').append( $('<input />',{ 'type':'text' ,'class':'form-control input-sm num_parte', 'name':'num_parte' }) ),
								$('<td />').append( $('<input />',{ 'type':'number' ,'class':'form-control input-sm num_parte_umc', 'name':'num_parte_umc' }) ),
								$('<td />').append( $('<input />',{ 'type':'number' ,'class':'form-control input-sm num_parte_umt', 'name':'num_parte_umt' }) ),
								$('<td />').append( $('<a />', { 'text':'X', 'href':'#','class':'remove', 'style':'font-size: 16px' }) )
						)
				);
			});

			///Quitar partida
			$('#partidas').on('click','.removepartida', function(e){
				e.preventDefault();
				$element = $(this);
				$div = $element.parents('div.partida');
				$element.confirmation('destroy');
				$element.confirmation({
					title:'¿Seguro que quiere eliminar la partida?',
					onConfirm: function() {
						$div.prev('hr').remove();
						$div.remove();
						$.each( $('.partida').find('h1.sec'), function (i,p) {
							$(this).html(i+1);
						});
					},
					onCancel: function() { $element.confirmation('destroy') }
				});
				$element.confirmation('show');
			});

			///Guardar el pedimento
			$('#guardar').click(function ($e) {
				$e.preventDefault();
				if ( $('#pedimento').validationEngine('validate') ){
					///Crear objeto data
					$data = { };
					///Obtener informacion general del pedimento
					$data.pedimento = $('#pedimento').serializeObject();

					//Crear array de objetos facturas
					$data.facturas = [];
					///Get div proveedor
					$proveedores = $('#proveedores').find('div.proveedor');
					$.each($proveedores, function(i,val){
						//Get info proveedor;
						$idFiscal = $(this).find('.idFiscal').val();
						$domicilio = $(this).find('.domicilio').val();

						//Generar objeto provisional facturas
						$facturas = { };
						if ( !$.isEmpty($idFiscal) ) {
							$facturas = ({
								'idFiscal': $idFiscal,
								'domicilio': $domicilio
							});
							$facturas.factura = [];
							$.each( $(this).find('table tbody tr'), function (o,v) {
								$input = $(this).find('input,select');
								$factura = { };
								$.each($input,function(i,campo){
									$factura[ $(this).attr('name') ] = $(this).val();
								});
								$facturas.factura.push($factura);
							});
							$data.facturas.push($facturas);
						}
					});

					///Crear array de objetos partidas
					$data.partidas = [];
					///Get div partidas
					$pp = $('#partidas').find('div.partida');
					$.each($pp,function(par,val){
						$input = $(this).find('input,select');
						$partida = { };
						$.each($input,function(i,campo){
							$partida[ $(this).attr('name') ] = $(this).val();
						});
						if ( !$.isEmpty( $partida.fraccion )  ) $data.partidas.push($partida);
					});

					if ( $.isEmpty( $.getUrlVar('p') ) ) $data.hacer = 'Agregar';
					else $data.hacer = 'Editar';

					$data.Method = 'Pedimento';

					$.enviar($data).done(function(r){
						if ( r.r == 1 ) console.log('Bien');
					});
				}
			});

			//Limpiar modal y dejarlo listo
			$('#modalAdd').on('hidden.bs.modal', function (e) {
				$form = $('#FormAdd');
				$form.trigger('reset').find('#hacer').val('Agregar');
				$form.find('#numPedimento').attr('readonly',false);
				$form.validationEngine('hide');
			});

			/*$(".num_parte-ajax").select2({
				ajax: {
					url: "https://api.github.com/search/repositories",
					dataType: 'json',
					delay: 250,
					data: function (params) {
						return {
							q: params.term, // search term
							page: params.page
						};
					},
					processResults: function (data, page) {
						// parse the results into the format expected by Select2.
						// since we are using custom formatting functions we do not need to
						// alter the remote JSON data
						return {
							results: data.items
						};
					},
					cache: true
				},
				minimumInputLength: 1,
				templateResult: formatRepo, // omitted for brevity, see the source of this page
				templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
			});*/
		});
	</script>
</body>
</html>