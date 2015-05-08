<?php 
	class Pedimentos extends DB {
		private static $DB;

		function __construct(){
			try {
				Pedimentos::$DB = new DB;
			} catch (Exception $e) {
				header('Location: '.HOME);
			}
		}

		/// Crear pedimento
		public function Pedimento($Data){
			try{
				if ( !defined('hacer') ) throw new Exception("No hay que hacer",1);

				Pedimentos::comprobarPedimento(pedimento);

				Pedimentos::$DB->begin();
				switch ( hacer ){
					case 'Agregar':
						$num_pedimento = Pedimentos::insertFactura(pedimento);
						Pedimentos::insertFactura(facturas, $num_pedimento);
						Pedimentos::insertPartidas(partidas, $num_pedimento);
						$mensaje = 'Se agrego el pedimento '.$num_pedimento;
					break;

					case 'Editar':
						$num_pedimento = Pedimentos::updatePedimento(pedimento);
						Pedimentos::deleteFactura($num_pedimento);
						Pedimentos::insertFactura( facturas, $num_pedimento );
						//Pedimentos::deletePartidas($num_pedimento);
						//Pedimentos::insertPartidas( partidas, $num_pedimento );
						$mensaje = 'Se actualizo el pedimento '.$num_pedimento;
					break;

					default:
						throw new Exception("Error de instacia hacer",1);
					break;
				}
				Pedimentos::$DB->end();

				$data = array(
					'r'			=> 1,
					'mensaje'	=> $mensaje,
					'class'		=> 'alert alert-success'
				);
			}catch (Exception $e){
				Pedimentos::$DB->cancel();
				$data = array(
					'r' 	  	=> 0,
					'mensaje' 	=> $e->getMessage(),
					'class'   	=> 'alert alert-warning'
				);
			}

			echo json_encode($data);
		}
		/// Insertar pedimento
		public function insertPedimento($pedimento){
			$pedimento = unserialize($pedimento);
			if ( Pedimentos::countPedimento( $pedimento['num_pedimento'] ) != 0 ) throw new Exception("Los numeros de los pedimentos son unicos");

			Pedimentos::$DB->query("INSERT INTO cat_anexo24_pedimento
				(num_pedimento, tipo_operacion, clave_pedimento, regimen, tipo_cambio, peso_bruto, aduana, valor_dolares, fecha, create_it)
				VALUES
				(:num_pedimento, :tipo_operacion, :clave_pedimento, :regimen, :tipo_cambio, :peso_bruto, :aduana, :valor_dolares, :fecha, NOW() )
			");
			Pedimentos::$DB->bind(':num_pedimento', $pedimento['num_pedimento']);
			Pedimentos::$DB->bind(':tipo_operacion', $pedimento['tipo_operacion']);
			Pedimentos::$DB->bind(':clave_pedimento', $pedimento['clave_pedimento']);
			Pedimentos::$DB->bind(':regimen', $pedimento['regimen']);
			Pedimentos::$DB->bind(':tipo_cambio', $pedimento['tipo_cambio']);
			Pedimentos::$DB->bind(':peso_bruto', $pedimento['peso_bruto']);
			Pedimentos::$DB->bind(':aduana', $pedimento['aduana']);
			Pedimentos::$DB->bind(':valor_dolares', $pedimento['valor_dolares']);
			Pedimentos::$DB->bind(':fecha', $pedimento['fecha']);
			Pedimentos::$DB->execute();

			return $pedimento['num_pedimento'];
		}
		/// Actualizar Pedimento
		public function updatePedimento($pedimento){
			$pedimento = unserialize($pedimento);

			if ( Pedimentos::countPedimento($pedimento['num_pedimento']) != 1 ) throw new Exception("Los numeros de los pedimentos son unicos");

			Pedimentos::$DB->query("UPDATE cat_anexo24_pedimento SET
					tipo_operacion = :tipo_operacion,
					clave_pedimento = :clave_pedimento,
					regimen = :regimen,
					tipo_cambio = :tipo_cambio,
					peso_bruto = :peso_bruto,
					aduana = :aduana,
					valor_dolares = :valor_dolares,
					fecha = :fecha
				WHERE num_pedimento = :num_pedimento
			");
			Pedimentos::$DB->bind(':num_pedimento', $pedimento['num_pedimento']);
			Pedimentos::$DB->bind(':tipo_operacion', $pedimento['tipo_operacion']);
			Pedimentos::$DB->bind(':clave_pedimento', $pedimento['clave_pedimento']);
			Pedimentos::$DB->bind(':regimen', $pedimento['regimen']);
			Pedimentos::$DB->bind(':tipo_cambio', $pedimento['tipo_cambio']);
			Pedimentos::$DB->bind(':peso_bruto', $pedimento['peso_bruto']);
			Pedimentos::$DB->bind(':aduana', $pedimento['aduana']);
			Pedimentos::$DB->bind(':valor_dolares', $pedimento['valor_dolares']);
			Pedimentos::$DB->bind(':fecha', $pedimento['fecha']);
			Pedimentos::$DB->execute();
			Pedimentos::$DB->closecursor();

			return $pedimento['num_pedimento'];
		}
		/// Get toda la informacion del pedimento
		public function getPedimento($Data){
			try{
				if ( !defined('p') ) throw new Exception("Falta informacion para obtener el pedimento",1);
				/// Desencriptar la informacion del pedimento
				$num_pedimento = General::CrypTing(p,Key, IVKEY, 'Decrypt');

				if ( Pedimentos::countPedimento($num_pedimento) != 1 ) throw new Exception("No existe el pedimento",1);
				Pedimentos::$DB->query("SELECT * FROM cat_anexo24_pedimento WHERE num_pedimento=:num_pedimento LIMIT 1");
				Pedimentos::$DB->bind(':num_pedimento',$num_pedimento);
				$data['pedimento'] = Pedimentos::$DB->single();

				Pedimentos::$DB->query("SELECT DISTINCT idFiscal, domicilio FROM cat_anexo24_pedimento_facturas WHERE num_pedimento=:num_pedimento");
				Pedimentos::$DB->bind(':num_pedimento',$num_pedimento);
				$i=0;
				foreach ( Pedimentos::$DB->resultset() as $cpv ){
					$data['facturas'][$i] =  array(
						'idFiscal' 	=> $cpv['idFiscal'],
						'domicilio' => $cpv['domicilio']
					);
					/// Get facturas
					Pedimentos::$DB->query("SELECT num_factura, fecha_factura, incoterm, moneda_factura, valor_dolares FROM cat_anexo24_pedimento_facturas WHERE num_pedimento=:num_pedimento AND idFiscal=:idFiscal");
					Pedimentos::$DB->bind(':num_pedimento',$num_pedimento);
					Pedimentos::$DB->bind(':idFiscal', $cpv['idFiscal']);
					foreach( Pedimentos::$DB->resultset() as $f){
						$data['facturas'][$i]['factura'][] = array(
							'num_factura'		=> $f['num_factura'],
							'fecha_factura'		=> $f['fecha_factura'],
							'incoterm'			=> $f['incoterm'],
							'moneda_factura'	=> $f['moneda_factura'],
							'valor_dolares'		=> $f['valor_dolares']
						);
					}
					$i++;
				}
				Pedimentos::$DB->closecursor();

				/// Get Partidas
				Pedimentos::$DB->query("SELECT * FROM cat_anexo24_pedimento_partidas WHERE num_pedimento=:num_pedimento");
				Pedimentos::$DB->bind(':num_pedimento',$num_pedimento);
				$data['partidas'] = Pedimentos::$DB->resultset();
				Pedimentos::$DB->closecursor();

				//Mensaje de exito
				$data['r'] = 1;
			}catch (Exception $e){
				$data = array(
					'r' 		=> 0,
					'mensaje'	=> $e->getMessage(),
					'class'   	=> 'alert alert-warning'
				);
			}
			echo json_encode($data);
		}
		/// Borrar pedimento
		public function deletePedimento($Data){
			try{
				if ( !defined('num_pedimento') ) throw new Exception("Falta informacion para obtener el pedimento",1);
				Pedimentos::$DB->query("SELECT * FROM cat_anexo24_pedimento WHERE num_pedimento=:num_pedimento LIMIT 1");
				Pedimentos::$DB->bind(':num_pedimento',num_pedimento);
				Pedimentos::$DB->execute();
				if ( Pedimentos::$DB->count() != 1 ) throw new Exception("No existe el pedimento",1);
				Pedimentos::$DB->closecursor();

				Pedimentos::$DB->begin();
				Pedimentos::$DB->query("DELETE FROM cat_anexo24_pedimento WHERE num_pedimento=:num_pedimento");
				Pedimentos::$DB->bind(':num_pedimento',num_pedimento);
				Pedimentos::$DB->execute();

				$data = array(
					'r'			=> 1,
					'mensaje' 	=> 'Se borro el pedimento '.num_pedimento,
					'class'		=> 'alert alert-success'
				);
				Pedimentos::$DB->end();
			}catch (Exception $e){
				Pedimentos::$DB->cancel();
				$data = array(
					'r' 		=> 0,
					'mensaje'	=> $e->getMessage(),
					'class'   	=> 'alert alert-warning'
				);
			}
			echo json_encode($data);
		}
		/// Comprobar informacion del pedimento
		public function comprobarPedimento($pedimento){
			$pedimento = unserialize($pedimento);
			if ( empty($pedimento) ) throw new Exception("Falta informacion para trabajar con el pedimento", 1);

			foreach ( $pedimento as $campo )
				if ( empty($campo) ) throw new Exception("Falta informacion para trabajar con el pedimento", 1);
		}
		/// Contar pedimentos
		public function countPedimento($num_pedimento){
			if ( empty($num_pedimento) ) throw new Exception("No puede ir vacio el pedimento",1);

			Pedimentos::$DB->query("SELECT * FROM cat_anexo24_pedimento WHERE num_pedimento=:num_pedimento");
			Pedimentos::$DB->bind(':num_pedimento',$num_pedimento);
			Pedimentos::$DB->execute();

			return Pedimentos::$DB->count();
		}

		/// Insertar factura
		public function insertFactura( $factura, $num_pedimento ){
			/// Deseerializar y generar el array
			$factura = unserialize($factura);
			if( count($factura) > 0 ){
				///Dejamos el query preparado para la insercion
				Pedimentos::$DB->query("INSERT INTO cat_anexo24_pedimento_facturas
					( num_pedimento, idFiscal, domicilio, num_factura, fecha_factura, incoterm, moneda_factura, valor_dolares)
					VALUES
					( :num_pedimento, :idFiscal, :domicilio, :num_factura, :fecha_factura, :incoterm, :moneda_factura, :valor_dolares)
				");
				//Primero recorremos la cantidad de proveedores que esten en el pedimento
				foreach ( $factura as $proveedor ){
					///Si el idFiscal no esta vacia
					if ( !empty($proveedor['idFiscal']) ){
						///Recorremos la cantidad de facturas del proveedor
						foreach ( $proveedor['factura'] as $f ) {
							Pedimentos::$DB->bind(':num_pedimento', $num_pedimento);
							Pedimentos::$DB->bind(':idFiscal', $proveedor['idFiscal']);
							Pedimentos::$DB->bind(':domicilio', $proveedor['domicilio']);
							Pedimentos::$DB->bind(':num_factura', $f['num_factura']);
							Pedimentos::$DB->bind(':fecha_factura', $f['fecha_factura']);
							Pedimentos::$DB->bind(':incoterm', $f['incoterm']);
							Pedimentos::$DB->bind(':moneda_factura', $f['moneda_factura']);
							Pedimentos::$DB->bind(':valor_dolares', $f['valor_dolares']);
							Pedimentos::$DB->execute();
						}
					}
				}
				//Pedimentos::$DB->closecursor();
			}
			//return true;
		}
		/// Delete factura
		public function deleteFactura($num_pedimento){
			if ( empty($num_pedimento) ) throw new Exception("El numero de pedimento no puede estar vacio",1);
			Pedimentos::$DB->query("DELETE FROM cat_anexo24_pedimento_facturas WHERE num_pedimento=:num_pedimento");
			Pedimentos::$DB->bind(':num_pedimento',$num_pedimento);
			Pedimentos::$DB->execute();
			//return true;
		}

		/// Insertar partida
		public function insertPartidas( $partidas, $num_pedimento ){
			$partidas = unserialize($partidas);
			if ( is_array($partidas) && count($partidas) > 0 ){
				Pedimentos::$DB->query("INSERT INTO cat_anexo24_pedimento_partidas
					( num_pedimento, num_parte, sec, fraccion, umc, cantidad_umc, umt, cantidad_umt, pvc, pod, descripcion, val_adu, imp_precio_pag, precio_unit, valor_agregado, created_at )
					VALUES
					( :num_pedimento, :num_parte, :sec, :fraccion, :umc, :cantidad_umc, :umt, :cantidad_umt, :pvc, :pod, :descripcion, :val_adu, :imp_precio_pag, :precio_unit, :valor_agregado, NOW() )
				");
				foreach ( $partidas as $p ){
					Pedimentos::$DB->bind(':num_pedimento',$num_pedimento);
					Pedimentos::$DB->bind(':num_parte', $p['num_parte']);
					Pedimentos::$DB->bind(':sec', $p['sec,']);
					Pedimentos::$DB->bind(':fraccion', $p['fraccion']);
					Pedimentos::$DB->bind(':umc', $p['umc,']);
					Pedimentos::$DB->bind(':cantidad_umc', $p['cantidad_umc']);
					Pedimentos::$DB->bind(':umt', $p['umt']);
					Pedimentos::$DB->bind(':cantidad_umt', $p['cantidad_umt']);
					Pedimentos::$DB->bind(':pvc', $p['pvc']);
					Pedimentos::$DB->bind(':pod', $p['pod']);
					Pedimentos::$DB->bind(':descripcion', $p['descripcion']);
					Pedimentos::$DB->bind(':val_adu', $p['val_adu']);
					Pedimentos::$DB->bind(':imp_precio_pag', $p['imp_precio_pag']);
					Pedimentos::$DB->bind(':precio_unit', $p['precio_unit']);
					Pedimentos::$DB->bind(':valor_agregado', $p['valor_agregado']);
					Pedimentos::$DB->execute();
				}
				//Pedimentos::$DB->closecursor();
			}
			//return true;
		}
		/// Delete partida
		public function deletePartidas($num_pedimento){
			if ( empty($num_pedimento) ) throw new Exception("El numero de pedimento no puede estar vacio",1);
			Pedimentos::$DB->query("DELETE FROM cat_anexo24_pedimento_partidas WHERE num_pedimento=:num_pedimento");
			Pedimentos::$DB->bind(':num_pedimento',$num_pedimento);
			Pedimentos::$DB->execute();
			//return true;
		}

		/// Get informacion for display pedimentos
		public function getDisplay(){
			try{
				$data['r'] = 1;
				$data['um'] 		= Pedimentos::getUM();
				$data['cliente'] 	= Pedimentos::getCUSU();
				$data['moneda']		= Pedimentos::getMoneda();
			}catch (Exception $e){
				$data = array(
					'r'			=> 0,
					'mensaje' 	=> 'No se pudo cagar la informacion esencial',
					'class'   	=> 'alert alert-warning'
				);
			}

			echo json_encode($data);
		}

		///Obtiene las unidadas de medida
		public function getUM(){
			Pedimentos::$DB->query("SELECT descripcion as unidad, id FROM cat_anexo24_um");
			return Pedimentos::$DB->resultset();
		}

		///Obtiene los clientes
		public function getCUSU(){
			Pedimentos::$DB->query("SELECT * FROM cat_cusu WHERE cusSts=1");
			Pedimentos::$DB->execute();
			$CUSU = array();
			if ( Pedimentos::$DB->count() == 0 ) $CUSU[] = array('cliente'=> 'No ahi clientes/proveedores', 'rfc' => '', 'direccion' => '');
			else {
				foreach ( Pedimentos::$DB->resultset() as $c ){
					$CUSU[$c['cusRfc']] = array(
						'cliente' => $c['cusName'],
						'rfc' => $c['cusRfc'],
						'direccion' => array(
							'calle' 	=> $c['cusAddress'],
							'colonia' 	=> $c['cusColo'],
							'numero'	=> $c['cusNume'],
							'cp'		=> $c['cusCP'],
							'estado'	=> $c['cusEdo'],
							'pais'		=> $c['cusPais']
						)
					);
				}
			}

			return $CUSU;
		}

		/// Obtiene las monedas
		public function getMoneda(){
			Pedimentos::$DB->query("SELECT abbr_mon as moneda, id_mon as id_moneda FROM cat_monedas WHERE sts_mon = 1");
			return Pedimentos::$DB->resultset();
		}
		/// Get regimenes
		public function getoptRegimen(){
			Pedimentos::$DB->query("SELECT regimen_clave, regimen_desc FROM cat_anexo24_regimenes ORDER BY regimen_clave");
			$optregimen = '';
			foreach( Pedimentos::$DB->resultset() as $Data )
				$optregimen.= '<option value="'.$Data['regimen_clave'].'">'.$Data['regimen_clave'].' - '.$Data['regimen_desc'].'</option>';
			return $optregimen;
		}
		/// Get Claves pedimentos
		public function getoptCVEpedimento(){
			Pedimentos::$DB->query("SELECT cvePed_clave, cvePed_desc FROM cat_anexo24_cvepedimento ORDER BY cvePed_clave");
			$cveopt = '';
			foreach( Pedimentos::$DB->resultset() as $Data2 ) $cveopt .= '<option value="'.$Data2['cvePed_clave'].'">'.$Data2['cvePed_clave'].' - '.$Data2['cvePed_desc'].'</option>';
			return $cveopt;
		}
		/// Get Aduanas
		public function getoptAduana(){
			Pedimentos::$DB->query("SELECT aduana_aduana, aduana_seccion, aduana_denominacion FROM cat_anexo24_aduanas ORDER BY aduana_aduana");
			$optAduanas = '';
			foreach( Pedimentos::$DB->resultset() as $Data3 ) $optAduanas .= '<option value="'.$Data3['aduana_aduana'].$Data3['aduana_seccion'].'">'.$Data3['aduana_aduana'].$Data3['aduana_seccion'].' - '.$Data3['aduana_denominacion'].'</option>';
			return $optAduanas;
		}
	}
?>