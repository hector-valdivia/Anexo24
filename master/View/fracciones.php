<?php
	//error_reporting(E_ALL);
	//ini_set('display_errors', '1');
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
	$General->Insole('anexo24/fracciones');

	$fracciones = $DOM::Driver($SQL,'Fracciones');
	$fracciones = new Fracciones;
	$material = $fracciones::DisplayMateriales($SQL); 
	$partes = $fracciones::DisplayPartes($SQL); 
	$UMC = $fracciones::DisplayUMC($SQL); 
	$UMT = $fracciones::DisplayUMT($SQL); 

	$General->AsignData(array(
		'STYLESHEET' => STYLESHEET,
		'PLUGINS' 	 => PLUGINS,
		'IMAGES' 	 => IMAGES,
		'JAVASCRIPT' => JAVASCRIPT,
		'JS'		 => $js,
		'MATERIALES'	 => $material,
		'PARTES'		 => $partes,
		'UMC'			 => $UMC,
		'UMT'			 => $UMT
	));

	$DataTemplete = $General->Show();
	print_r($DataTemplete);
?>