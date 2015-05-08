<?php
	#Cargamos archivo base
	require_once('../../../Driver/basename.php');
	$DOM = new BaseName;

	#Cargamos el core
	$DOM::LoadCore();

	#Cargamos SQL PDO
	$SQL = new PDOConnection;

	#Llamamos al driver que deseamos cargar
	$DOM::Driver($SQL,'General');
	$General = new General;
	$General::DirSLHS();
	$General->Insole('anexo24/facturas');

	$General->AsignData(array(
		'STYLESHEET'      => STYLESHEET,
		'PLUGINS' 	      => PLUGINS,
		'IMAGES' 	      => IMAGES,
		'JAVASCRIPT'      => JAVASCRIPT,
		'PEDIMENTO'       => $_GET['pedimento']
	));

	$DataTemplete = $General->Show();
	print_r($DataTemplete);
?>