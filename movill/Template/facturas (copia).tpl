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
</head>
<body class="error-body no-top lazy">
	<!-- BEGIN page content -->
	<div class="content" style="margin:2.5% 0 0 0;">

		<div class="page-title"> 
			<a href="javascript:goBack()"> <i class="icon-custom-left"></i></a> <h3>Pedimentos - <span class="semi-bold">KeyA</span></h3>
		</div>

		<ul class="breadcrumb">
			<li><p>Te encuentras en:</p></li>
			<li><a href="#" class="active">Gestor Facturas</a></li>
		</ul>

		<div class="row"><div class="col-md-12"><div id="mensaje"></div></div></div>

		<div class="row">
			<div class="col-md12">
				<div class="grid simple">
					<div class="grid-title">
						<h4><i class="fa fa-building-o"></i> Asignacion de <span class="semi-bold">Facturas</span></h4>
					</div>
					<div class="grid-body">
						<div class="grid simple">
							<div class="row">
								<div class="col-md-4">
									<h4>Informacion del proveedor/cliente</h4>
									<div class="form-group">
										<label class="form-label">Cliente / Proveedor</label>
										<div class="controls">
											<select name="proveedor" id="proveedor"></select>
										</div>
									</div>
									<div class="form-group">
										<label class="form-label">ID Fiscal / RFC</label>
										<div class="cotrols">
											<input type="text" name="idfiscal" id="idFiscal" readonly>
											<input type="hidden" value="{PEDIMENTO}" id="pedimento">
										</div>
									</div>
									<div class="form-group">
										<label class="form-label">Domicilio Proveedor</label>
										<div class="control">
											<textarea rows="6" cols="50" value="" id="domicilio" style="resize:none;overflow:hidden" readonly></textarea>
										</div>
									</div>
								</div>
								<div class="col-md-8">
									<div class="row">
										<h4>Informacion general de la factura</h4>
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-label">Numero de factura</label>
												<div class="controls">
													<input type="text" class="form-control" id="numFactura" />
												</div>
											</div>

											<div class="form-group">
												<label class="form-label">Numero Embarque</label>
												<div class="controls">
													<input type="text" class="form-control" id="numembarqueFactura" />
												</div>
											</div>

											<div class="form-group">
												<label class="form-label">Incoterm</strong></label>
												<div class="controls">
													<input type="text" class="form-control" id="incotermFactura" />
												</div>
											</div>

											<div class="form-group">
												<label class="form-label">Moneda Factura / Divisa</label>
												<div class="controls">
													<select class="form-control" id="monedaFactura">{OPTMONEDA}</select>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-label">Fecha Factura</label>
												<div class="controls">
													<input type="date" class="form-control" id="fechaFactura" />
												</div>
											</div>
											<div class="form-group">
												<label class="form-label">Fecha de Embarque</label>
												<div class="controls">
													<input type="date" class="form-control" id="fechaembarqueFactura" />
												</div>
											</div>
											<div class="form-group">
												<label class="form-label">Factor Mon. Factura</label>
												<div class="controls">
													<input type="text" class="form-control" id="factormonFactura" />
												</div>
											</div>
											<div class="form-group">
												<label class="form-label">Pais Destino</label>
												<div class="controls">
													<input type="text" class="form-control" id="podFactura" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- ********** TABLA ********** -->
							<div class="row">
								<div class="col-md-8">
									<h4>Numeros de parte de la factura</h4>
								</div>
								<div class="col-md-4 text-right">
									<button type="button" id="add_numeroparte" class="btn btn-success"><i class="fa fa-plus"></i> Numero de parte</button>
								</div>

								<div class="col-md-12">
									<table class="table" id="detalleFact" style="width:100%;">
										<thead style=" background-color: #737B8A; color: white;">
											<tr>
												<th style="width:15%;">Num. Parte</th>
												<th style="width:30%;">Desc.</th>
												<th style="width:10%;">Cantidad</th>
												<th style="width:10%;">UoM</th>
												<th style="width:10%;">P.Unitario</th>
												<th style="width:10%;">Impuesto</th>
												<th style="width:10%;">Subtotal</th>
												<th style="width:5%;"></th>
											</tr>
										</thead>
										<tbody>
											<tr class="partes">
												<td><input type="text" class="form-control numeroParte"></td>
												<td><input type="text" class="form-control descParte"></td>
												<td><input type="text" class="form-control cantParte"></td>
												<td><select class="form-control umParte">{OPTUM}</select></td>
												<td><input type="text" class="form-control punitarioParte"></td>
												<td><input type="text" class="form-control impuestoParte"></td>
												<td class="subtotal"></td>
												<td></td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td style="font-size: 18px;" class="text-right" colspan="6">Total</td>
												<td style="font-size: 18px;" id="total"></td>
												<td></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
						<div class="form-actions text-right">
							<button class="btn btn-danger btn-cons" type="button" style="height:33px;" onclick="guardar()">Guardar</button>
							<button class="btn btn-white btn-cons" type="button" onclick="goBack()" style="height:33px;">Cancelar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END page content -->

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

	<script type="text/javascript">
		$(document).ready(function ($) {
			$um 	= '';
			$pc 	= '';
			$.enviar({ 'Method':'getDisplay' }).done(function(r){
				if ( r.r == 1 ){
					///Sacar variables
					$um = r.um;
					$pc = r.cliente;

					///UM de las partidas
					$('.umParte')[0].add( new Option('UM', '') );
					$.each($um,function(i,um){
						$('.umParte')[0].add( new Option(um.med_abre,um.med_keyide) );
					});

					//Input cliente
					$('#proveedor')[0].add( new Option('Seleccione Cliente', '') );
					$.each($pc,function(i,c){
						$('#proveedor')[0].add( new Option(c.cliente,c.rfc) );
					});

					//Input moneda
					$.each(r.moneda,function(i,m){
						$('#monedaFactura')[0].add( new Option(m.abbr_mon,m.id_mon) );
					});
				}
			});

			$('#proveedor').change(function(){
				$ya = $(this).val();
				if ( !$.isEmpty($ya) ) {
					$('#idFiscal').val($(this).val());
					$proveedor = $pc[$(this).val()]['direccion'];
					domistr = 'Direccion: ' + $proveedor['calle'] + '\n';
					domistr += 'Colonia: ' + $proveedor['colonia'] + '\n';
					domistr += 'Num. Ext.: ' + $proveedor['numero'] + '\n';
					domistr += 'C.P.: ' + $proveedor['cp'] + '\n';
					domistr += 'Estado: ' + $proveedor['estado'] + '\n';
					domistr += 'Pais: ' + $proveedor['pais'] + '\n';
					$('#domicilio').text(domistr);
				}else{
					$('#idFiscal').val('');
					$('#domicilio').text('');
				}
			});

			$(document).on('click','#add_numeroparte', function(){
				$selectum = $('<select />', { 'type':'text', 'class':'form-control umParte' });
				$selectum[0].add( new Option('UM', '') );
				$.each($um,function(i,um){
					$selectum[0].add( new Option(um.med_abre,um.med_keyide) )
				});

				$('<tr />').append(
					$('<td />').append( $('<input />', { 'type':'text', 'class':'form-control numeroparte' }) ),
					$('<td />').append( $('<input />', { 'type':'text', 'class':'form-control descri' }) ),
					$('<td />').append( $('<input />', { 'type':'text', 'class':'form-control cantParte' }) ),
					$('<td />').append( $selectum ),
					$('<td />').append( $('<input />', { 'type':'text', 'class':'form-control punitarioParte' }) ),
					$('<td />').append( $('<input />', { 'type':'text', 'class':'form-control impuestoParte' }) ),
					$('<td />', {class:'subtotalParte'}),
					$('<td />').append( $('<a />', { href:'#', class:'remover_parte', style:'font-size: 25px;', text:'x' }) )
				).appendTo( $('#detalleFact tbody') );
			});

			$(document).on('click','.remover_parte',function(e){
				e.preventDefault();
				$(this).parents('tr').remove();
			});

		});
		var objFactura = { };
		function agregarFacturas(){
			html  = '<tr class="partes">';
			html += '	<td><input type="text" id="numeroParte"></td>';
			html += '	<td><input type="text" id="descParte"></td>';
			html += '	<td><input type="text" id="cantParte"></td>';
			html += '	<td><input type="text" id="umParte"></td>';
			html += '	<td><input type="text" id="punitarioParte"></td>';
			html += '	<td><input type="text" id="impuestoParte"></td>';
			html += '	<td><input type="text" id="subtotalParte"></td>';
			html += "	<td><button id=\"elimRow\" onclick=\"javascript:$(this).parents('tr').remove();\">Borrar</button></td>";
			html += '</tr>';
			$('#detalleFact tbody').append(html);
		}
		function guardar()
		{			
			$('.partes').each(function(){
				objFactura = {"pedimento":$('#pedimento').val(),"idFiscal":$('#idFiscal').val(),"numFactura":$('#numFactura').val(),"fechaFactura":$('#fechaFactura').val(),"numembarqueFactura":$('#numembarqueFactura').val(),"fechaembarqueFactura":$('#fechaembarqueFactura').val(),"incotermFactura":$('#incotermFactura').val(),"factormonFactura":$('#factormonFactura').val(),"monedaFactura":$('#monedaFactura').val(),"podFactura":$('#podFactura').val(),"parte":$(this).find('#numeroParte').val(),"desc":$(this).find('#descParte').val(),"cant":$(this).find('#cantParte').val(),"um":$(this).find('#umParte').val(),"punit":$(this).find('#punitarioParte').val(),"imp":$(this).find('#impuestoParte').val(),"subtot":$(this).find('#subtotalParte').val(),"total":$('#totalParte').val()};
				dataGuardar = 'Method='+encode64('guardarFactura')+'&objfact='+JSON.stringify(objFactura);
				var guardar = send(dataGuardar);
				guardar.done(function(resultGuardar){
					alert(resultGuardar);
				});				
			});		
		}

		/*$(document).ready(function(){
			str = $('#proveedor').val().split('|');			
			$('#idFiscal').val(str[0]);
			domi = str[1].split('-');
			domistr  = 'Direccion   : '+domi[0]+'\n';
			domistr += 'Colonia      : '+domi[1]+'\n';
			domistr += 'Num. Ext.  : '+domi[2]+'\n';
			domistr += 'C.P.          : '+domi[3]+'\n';
			domistr += 'Estado      : '+domi[4]+'\n';
			domistr += 'Pais          : '+domi[5]+'\n';
			$('#domicilio').text(domistr)+'\n';
		});*/

	</script>
</body>
</html>