<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
	
<title>Snake</title>

</head>

<script src="./view/game/assets/js/phaser.min.js"></script>
<script src="./view/game/assets/js/menu.js"></script>
<script src="./view/game/assets/js/game.js"></script>
<script src="./view/game/assets/js/game_over.js"></script>
<script src="./view/game/assets/js/main.js"></script>


<body>
 <div id="snakeCanvas" style="margin-top: 10px; margin-left:400px;">
</div> 
<form id ="gameFrm" method="POST" action="insertRank.do">
	<input type="hidden" id="score" name="score" value =""/>
	<input type="hidden" id="gameNo" name="gameNo" value ="1"/>
</form>
</body>

</html>


