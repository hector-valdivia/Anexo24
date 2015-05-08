<?php
	#Cargamos archivo base
	require_once('../../../Driver/basename.php');
	$DOM = new BaseName;

	#Cargamos el core
	$DOM::LoadCore();

	#Cargamos SQL PDO
	$SQL = new PDOConnection;

	#Driver de sessiones
	$DOM::Driver($SQL,'Sessiones');
	$Sessiones = new Sessiones;
	$Sessiones->comprobar_sesesion();
	$js = $Sessiones->createJavascript();

	#Llamamos al driver que deseamos cargar
	$DOM::Driver($SQL,'General');
	$General = new General;
	$General::DirSLHS();
	$General->Insole('anexo24/main');

	$DOM::Driver($SQL,'Pedimentos');

	$General->AsignData(array(
		'STYLESHEET'      => STYLESHEET,
		'PLUGINS' 	      => PLUGINS,
		'IMAGES' 	      => IMAGES,
		'JAVASCRIPT'      => JAVASCRIPT,
		'JS'		      => $js
	));

	$DataTemplete = $General->Show();
	print_r($DataTemplete);
?>