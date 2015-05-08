<?php 
	#Cargamos archivo base
	require_once('../../../../Driver/basename.php');
	//Crear Objecto Base Name
	$DOM = new BaseName;

	#Cargamos el core
	$DOM::LoadCore();

	#Cargamos SQL PDO
	$SQL = new PDOConnection;

	//Llamar al driver de sessiones
	$DOM::Driver($SQL,'Sessiones');

	#Llamamos al driver que deseamos cargar
	$DOM::Driver($SQL,'General');
	$General = new General;
	$General::DirSLHS();

	// DB table to use
	$table = 'viewfraccionespartes';

	// Table's primary key
	$primaryKey = 'id';

	//Array de las columnas de la BD que seran leidas y en viadas de regreso a la DataTable
	//El db representa el nombre de la columna en la Base de Datos y el dt parametros de las
	//las columnas de la dataTable
	$columns = array(
		array( 'db' => 'id','dt' => 0),
		array( 'db' => 'parte', 'dt' => 1 ),
		array( 'db' => 'UMC',  'dt' => 2 ),
		array( 'db' => 'UMT', 'dt' => 3 ),
		array( 'db' => 'fraccion', 'dt' => 4 ),
		array(
			'db' => 'status',
			'dt'=> 5,
			'formatter' => function( $Status, $row ){
				switch ($Status) {
					case '1':
						$span = '<span class="label label-success">Activo</span>';
					break;

					case '2':
						$span = '<span class="label label-inverse">Suspendido</span>';
					break;
				}
            	return $span;
        	}
		),
		array(
			'db' => 'status',
			'dt' => 6,
			'formatter' => function ( $Status, $row ){
				///Creamos la session
				$Sessiones = new Sessiones;
				$permisos = $Sessiones->getPermisos();

				//Se pone un array debido a la cantidad de peticiones que se hacen al servidor incrementan de acuerdo al movimiento entre clases
				$url[] = $_SERVER['HTTP_REFERER'];

				//Modulo de la peticion
				$m = $Sessiones->getPaginaPeticionFromBD( $url );

				///Comprobar que no hubo error al consultar el modulo
				if ( $m['r'] == 1 ){
					//// ID's del modulo y submodulo
					$keymodulo 		= $m['keyMod'];
					$keysubmodulo	= $m['keySubMod'];

					///Primera parte del boton
					$html = '<div class="btn-group"><a class="btn btn-white btn-small dropdown-toggle btn-demo-space" data-toggle="dropdown" href="#"> Acciones <span class="caret"></span></a><ul class="dropdown-menu">';
					//Buscar dentro del objeto
					$modulo = array_filter($permisos, function ($e) use ($keymodulo) { return ($e->modulo == $keymodulo); } );
					foreach ($modulo as $m);

					$submodulo = array_filter($m->submodulos, function ($e) use ($keysubmodulo) { return ($e->submodulo == $keysubmodulo); } );
					foreach ($submodulo as $s) $reglas = $s->reglas;

					//// QUIERO COMENTARIOS AQUI
					if ( $Status == 1 ){
						if ( $reglas->editar  ) $html.= '<li class="lista" id=""><a href="javascript:editar(\''.$row['id'].'\',\''.parte.'\')" >Editar</li>';
						if ( $reglas->suspender 	) $html.= '<li><a href="javascript:suspender(\''.$row['id'].'\',\''.parte.'\')">Suspender</li><div class=\"divider\"></div>';
						if ( $reglas->eliminar	) $html.= '<li><a href="javascript:eliminar(\''.$row['id'].'\',\''.parte.'\')" >Eliminar</li>';
					}
					
					//// QUIERO COMENTARIOS AQUI
					else if ( $Status == 2 ){
						if ( $reglas->suspender ) $html.= '<li class="lista" id=""><a href="javascript:suspender(\''.$row['id'].'\',\''.parte.'\')" >Reactivar</li><div class="divider"></div>';
						if ( $reglas->eliminar   ) $html.= '<li><a href="javascript:eliminar(\''.$row['id'].'\',\''.parte.'\')" >Eliminar</li>';
					}

					//Cerrar boton
					$html.= '</ul></div>';
				}else $html = 'Sin acciones';

				return $html;
			}
		)
	);

	echo json_encode(SSP::simple( $_GET, $DB = new DB(), $table, $primaryKey, $columns));