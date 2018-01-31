<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<title>Insert title here</title>


<style>
#id1 {
	width: 75px;
	height: 75px;
	border: 0px;
	background-image: url("emptyBoard.jpg");
	background-size: cover;
}

#id2 {
	width: 75px;
	height: 75px;
	border: 0px;
	background-image: url("blackStone.jpg");
	background-size: cover;
}

#id3 {
	width: 75px;
	height: 75px;
	border: 0px;
	background-image: url("whiteStone.jpg");
	background-size: cover;
}
</style>
</head>
<script type="text/javascript">
	var BOARDSIZE = 10;
	var WHITEPLAYER = -1;
	var BLACKPLAYER = 1;
	var CANSETWHITE = 100;
	var CANSETBLACK = 101;
	var CANSETBOTH = 102;
	var CANNOTSET = 103;
	var whoIsPlay;
	var direction = [ [ 0, -1 ], [ 1, -1 ], [ 1, 0 ], [ 1, 1 ], [ 0, 1 ],
			[ -1, 1 ], [ -1, 0 ], [ -1, -1 ] ];
	var board;

	var canSetBlackCount = 0;
	var canSetWhiteCount = 0;
	var countOfBStone = 0;
	var countOfWStone = 0;

	function checkExitGame() {
		if (canSetBlackCount === 0 || canSetWhiteCount === 0) {
			alert("게임종료!!!!");
		}

		switch (whoIsPlay) {
		case WHITEPLAYER:
			$("#player").html("하얀돌 차례");
			break;
		case BLACKPLAYER:
			$("#player").html("검은돌 차례");
			break;
		}

		$("#countOfBStone").html("검은돌 개수 : " + countOfBStone);
		$("#countOfWStone").html("하얀돌 개수 : " + countOfWStone);

	}

	function changePlayer() {
		switch (whoIsPlay) {
		case BLACKPLAYER:
			whoIsPlay = WHITEPLAYER;
			break;
		default:
			whoIsPlay = BLACKPLAYER;
		}
	}

	function setBoardState() {
		for (var k = 1; k < BOARDSIZE - 1; k++) {
			for (var j = 1; j < BOARDSIZE - 1; j++) {
				$("#board" + j + k).removeAttr("BGCOLOR");

				if (board[j][k] != BLACKPLAYER && board[j][k] != WHITEPLAYER)
					continue;
				for (var i = 0; i < 8; i++) {
					var tmpx = j + direction[i][0];
					var tmpy = k + direction[i][1];
					if ((board[tmpx][tmpy] === BLACKPLAYER || board[tmpx][tmpy] === WHITEPLAYER)) {//조건에러
						var a = checkStoneColor(tmpx, tmpy, i, board[j][k]);
						if (a != 0) {
							switch (board[j + direction[(i + 4) % 8][0]][k
									+ direction[(i + 4) % 8][1]]) {
							case CANNOTSET:
								if (a === WHITEPLAYER)
									board[j + direction[(i + 4) % 8][0]][k
											+ direction[(i + 4) % 8][1]] = CANSETWHITE;
								else if (a === BLACKPLAYER)
									board[j + direction[(i + 4) % 8][0]][k
											+ direction[(i + 4) % 8][1]] = CANSETBLACK;
								break;

							break;
						case CANSETBLACK:
							//board[tmpx][tmpy]
							if (a === WHITEPLAYER) {
								board[j + direction[(i + 4) % 8][0]][k
										+ direction[(i + 4) % 8][1]] = CANSETBOTH;
							}
							break;
						case CANSETWHITE:
							if (a === BLACKPLAYER) {
								board[j + direction[(i + 4) % 8][0]][k
										+ direction[(i + 4) % 8][1]] = CANSETBOTH;
							}
							break;
						}
					}
				}

			}
		}
	}
}

function setLocation(x, y) {
	switch (whoIsPlay) {
	case BLACKPLAYER:
		if (board[x][y] === CANSETBLACK || board[x][y] === CANSETBOTH)
			board[x][y] = whoIsPlay;
		break;
	case WHITEPLAYER:
		if (board[x][y] === CANSETWHITE || board[x][y] === CANSETBOTH)
			board[x][y] = whoIsPlay;
		break;
	default:
		return false;
	}
	return true;
}

function changeStone(x, y, dx) {
	var returnBoolean = false;

	var tx = x + direction[dx][0];
	var ty = y + direction[dx][1];

	switch (board[x][y]) {
	case CANSETWHITE:
	case CANSETBLACK:
	case CANSETBOTH:
	case CANNOTSET:
		return false;
	}
	if (board[tx][ty] === whoIsPlay) {
		return true;
	}
	if (changeStone(tx, ty, dx)) {
		board[tx][ty] = whoIsPlay;
		return true;
	}
	return returnBoolean;
}

function checkStoneColor(x, y, direcX, stone) {
	var check = false;
	while (true) {
		switch (board[x][y]) {
		case CANSETWHITE:
		case CANSETBLACK:
		case CANSETBOTH:
		case CANNOTSET:
			return 0;

		case WHITEPLAYER:
		case BLACKPLAYER:
			if (board[x][y] != stone) {
				return board[x][y];
			}
			break;
		}
		x = x + direction[direcX][0];
		y = y + direction[direcX][1];
	}
	return check;
}

function setCount() {

	for (var i = 1; i < BOARDSIZE - 1; i++) {
		for (var j = 0; j < BOARDSIZE - 1; j++) {
			if (board[i][j] === CANSETBLACK)
				canSetBlackCount++;
			else if (board[i][j] === CANSETWHITE)
				canSetWhiteCount++;
			else if (board[i][j] === CANSETBOTH) {

				canSetBlackCount++;
				canSetWhiteCount++;
			} else if (board[i][j] === WHITEPLAYER) {
				countOfWStone++;
			} else if (board[i][j] === BLACKPLAYER) {
				countOfBStone++;
			}
		}
	}
}

function firstinit() {
	$("#player").html("검은돌 차례");
	$("#countOfBStone").html("검은돌 개수 : 2");
	$("#countOfWStone").html("하얀돌 개수 : 2");
	whoIsPlay = BLACKPLAYER;
	board = [
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET,
					CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ],
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET,
					CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ],
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET,
					CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ],
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET,
					CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ],
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, WHITEPLAYER,
					BLACKPLAYER, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ],
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, BLACKPLAYER,
					WHITEPLAYER, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ],
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET,
					CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ],
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET,
					CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ],
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET,
					CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ],
			[ CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET,
					CANNOTSET, CANNOTSET, CANNOTSET, CANNOTSET ] ];
	printBoard();
}

function init() {
	for (var i = 0; i < BOARDSIZE; i++) {
		for (var j = 0; j < BOARDSIZE; j++) {
			if (board[i][j] != BLACKPLAYER && board[i][j] != WHITEPLAYER)
				board[i][j] = CANNOTSET;
		}
	}
	canSetBlackCount = 0;
	canSetWhiteCount = 0;
	countOfBStone = 0;
	countOfWStone = 0;
}

function onBoardClick(x, y) {
	//alert(x + " "+ y);

	if (setLocation(x, y)) {
		////////////////////////////
		for (var i = 0; i < 8; i++) {
			changeStone(x, y, i);
		}
		//////////////////////////
		changePlayer();
		printBoard();
		checkExitGame();
	}
}

function printBoard() {
	init();
	setBoardState();
	setCount();
	//alert(BOARDSIZE);
	//firstinit();
	//setBoardState();
	//alert(board.toString());
	for (var i = 1; i < BOARDSIZE - 1; i++) {
		for (var j = 1; j < BOARDSIZE - 1; j++) {
			var id = "";
			var state = "";
			var table = $("#board" + j + i);
			//table.html("<div id=\"id1\"></div>");
			switch (board[j][i]) {
			case WHITEPLAYER:
				id = "\"id3\"";
				break;
			case BLACKPLAYER:
				id = "\"id2\"";
				break;
			case CANSETBOTH:
				table.attr("BGCOLOR", "red");

				state = "style = \"cursor:pointer;\" onclick=\"onBoardClick("
						+ j + "," + i + ")\"";

				id = "\"id1\"";
				break;
			case CANSETWHITE:
				if (whoIsPlay === WHITEPLAYER) {
					table.attr("BGCOLOR", "red");

					//WITHD="가로" HEIGHT="세로
					state = "style = \"cursor:pointer;\" onclick=\"onBoardClick("
							+ j + "," + i + ")\"";
				}
				id = "\"id1\"";
				break;
			case CANSETBLACK:
				if (whoIsPlay === BLACKPLAYER) {
					table.attr("BGCOLOR", "red");

					state = "style = \"cursor:pointer;\" onclick=\"onBoardClick("
							+ j + "," + i + ")\"";
				}
				id = "\"id1\"";
				break;
			case CANNOTSET:
				id = "\"id1\"";
				break;
			default:
			}
			table.html("<div id="+ id +" "+state+"></div>");
		}
	}

	/*switch (whoIsPlay) {
	case WHITEPLAYER:
		$("#player").html("하얀돌 차례입니다.");
		break;
	case BLACKPLAYER:
		$("#player").html("검은돌 차례입니다.");
		break;
	}*/
	//alert("검은돌이 놓을 수 있는 위치 개수 :" + canSetBlackCount);
	//alert("흰 돌이 놓을 수 있는 위치 개수 :" + canSetWhiteCount);
}

//	function playGame() {
//		var inputx, inputy;
//		while (true) {
//			//inputx = in.nextInt();
//			exitGame(inputx);
//			//inputy = in.nextInt();
//			exitGame(inputy);
//			if (setLocation(inputx, inputy)) {
//				////////////////////////////
///				for (var i = 0; i < 8; i++) {
//					changeStone(inputx, inputy, i);
//				}
//////////////////////////
//				init();
//				setBoardState();
//				setCount();
//				changePlayer();
//				print();
//			}
//			if (canSetBlackCount == 0 && canSetWhiteCount == 0) {
//				//게임종료
//System.exit(1);
//			}//

//			switch (whoIsPlay) {
//			case WHITEPLAYER:
//				if (canSetWhiteCount == 0)
//					changePlayer();
//				break;
//			case BLACKPLAYER:
//				if (canSetBlackCount == 0)
//					changePlayer();
//				break;
//			}
//		}
//	}

function callAjax() {
	//params = params == null ? {} :params;
	//if(formId != null && formId != ""){
	//	this.params += "&" + $("#form1").serialize();
	//}
	var str = $("#form1").serialize();

	$.ajax({
		url : "/othello/GameServlet",
		type : "POST",
		data : str,
		async : false,
		success : function(data, status) {
			if (data.success === true) {
				console.log(data.msg);
			} else {
				console.log(data.msg);//콜백
			}
		}
	});
}

/*	$(function() {

 $("#call").click(
 function() {

 var str = $("#form1").serialize();
 alert(str);

 $.ajax({
 type : "POST",
 url : "/othello/MainServlet",
 contentType : "application/x-www-form-urlencoded; charset=utf-8",
 data : str,
 datatype : "json",
 success : function(data) {
 alert(data.result);
 },
 error : function(e) {
 alert("에러발생");
 }
 });
 });
 });*/
</script>

<body>

	<form id="form1" ALIGN="center">
		<input type="button" onclick="firstinit()" value="게임시작" id="call"></input>
	</form>

	<h1 id="player" ALIGN="center"></h1>

	<!-- <div id="id1"></div> -->

	<input type="hidden" id="table11" value="board11" />

	<!--    type="hidden" value="board11" onmouseover="mouseOver(board11.value)"
    -->

	<table id="gametable" ALIGN="center" VALIGN="center">
		<tr>
			<td id="board11" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board21" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board31" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board41" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board51" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board61" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board71" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board81" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td LOWSPAN="4" ALIGN="center"><h3 id="countOfBStone"></h3></td>
		</tr>
		<tr>
			<td id="board12" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board22" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board32" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board42" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board52" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board62" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board72" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board82" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
				<td></td>
		</tr>
		<tr>
			<td id="board13" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board23" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board33" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board43" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board53" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board63" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board73" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board83" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
				<td></td>
		</tr>
		<tr>
			<td id="board14" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board24" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board34" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board44" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board54" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board64" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board74" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board84" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
				<td></td>
		</tr>
		<tr>
			<td id="board15" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board25" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board35" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board45" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board55" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board65" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board75" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board85" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
				<td COLSPAN="4" ALIGN="center"><h3 id="countOfWStone"></h3></td>
		</tr>
		<tr>
			<td id="board16" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board26" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board36" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board46" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board56" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board66" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board76" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board86" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
				<td></td>
		</tr>
		<tr>
			<td id="board17" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board27" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board37" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board47" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board57" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board67" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board77" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board87" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
				<td></td>
		</tr>
		<tr>
			<td id="board18" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board28" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board38" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board48" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board58" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board68" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board78" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
			<td id="board88" width="80" height="80" ALIGN="center"
				VALIGN="center"></td>
				<td></td>
		</tr>
		<tr>
			<!-- <td COLSPAN="4" ALIGN="center"><h3 id="countOfBStone"></h3></td>
			<td COLSPAN="4" ALIGN="center"><h3 id="countOfWStone"></h3></td> -->
		</tr>
	</table>
</body>
</html>