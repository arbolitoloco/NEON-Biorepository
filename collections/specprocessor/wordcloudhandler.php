<?php
include_once('../../config/symbini.php');
include_once($SERVER_ROOT.'/classes/WordCloud.php');
header("Content-Type: text/html; charset=".$CHARSET);

$collTarget = array_key_exists("colltarget",$_REQUEST)?$_REQUEST["colltarget"]:5;

$cloudHandler = new WordCloud();
$cloudHandler->setWidth(800);
$cloudHandler->buildWordFile($collTarget);

?>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=<?php echo $CHARSET;?>">
		<title><?php echo $DEFAULT_TITLE; ?> - Word Cloud Handler Collections</title>
		<link href="../../css/base.css?ver=<?php echo $CSS_VERSION; ?>" rel="stylesheet" type="text/css" />
		<link href="../../css/main.css<?php echo (isset($CSS_VERSION_LOCAL)?'?ver='.$CSS_VERSION_LOCAL:''); ?>" rel="stylesheet" type="text/css" />
		<script language="javascript" type="text/javascript">
		</script>
	</head>
	<body>
		<!-- This is inner text! -->
		<div id="innertext">
			<?php
			$cloudPath = $CLIENT_ROOT;
			if(substr($cloudPath,-1) != '/' && substr($cloudPath,-1) != "\\") $cloudPath .= '/';
			$cloudPath = 'temp/wordclouds/ocrcloud'.$collTarget.'.html';
			echo '<a href="'.$cloudPath.'">Cloud'.$collTarget.'</a>';
			?>
		</div>
	</body>
</html>