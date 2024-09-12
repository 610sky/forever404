$(document).ready(function () {
	// 메인 페이지 테트리스 형식 팀명 문구 생성
	width = 42;
	height = 24;
	scale = 20;
	speed = 8;

	canvas = document.querySelector("canvas");
	ctx = canvas.getContext("2d");
	canvas.width = width * scale;
	canvas.height = height * scale;
	ctx.setTransform(scale, 0, 0, -scale, 0, canvas.height);
	ctx.fillStyle = "black";
	
	// 원소를 나열한 순서대로 블럭이 생성
	pieces = [
	  { shape: 5, dir: 1, x: -2 }, // shape: index[n]의 요소(들), dir:index[n]의 요소 중 i번째 것(동일한 모양을 90도씩 돌린 블럭들이 존재함), x: 전체 픽셀 중 가로축 좌표
	  { shape: 1, dir: 1, x: 2 },
	  { shape: 5, dir: 2, x: 19 },
	  { shape: 7, dir: 0, x: 4 },
	  { shape: 7, dir: 0, x: 30 },
	  { shape: 7, dir: 0, x: 30 },
	  { shape: 7, dir: 0, x: 7 },
	  { shape: 6, dir: 1, x: 6 },
	  { shape: 7, dir: 0, x: 39 },
	  { shape: 7, dir: 0, x: 23 },
	  { shape: 5, dir: 2, x: 11 },
	  { shape: 7, dir: 0, x: 25 },
	  { shape: 7, dir: 0, x: 25 },
	  { shape: 9, dir: 0, x: 15 },
	  { shape: 6, dir: 1, x: 22 },
	  { shape: 4, dir: 0, x: -1 },
	  { shape: 7, dir: 0, x: 9 },
	  { shape: 7, dir: 0, x: 9 },
	  { shape: 7, dir: 0, x: 39 },
	  { shape: 1, dir: 0, x: 38 },
	  { shape: 8, dir: 0, x: 20 },
	  { shape: 5, dir: 0, x: 7 }, 
	  { shape: 1, dir: 0, x: 29 },
	  { shape: 7, dir: 0, x: 28 },
	  { shape: 8, dir: 1, x: 14 },
	  { shape: 8, dir: 1, x: 16 }, 
	  { shape: 4, dir: 0, x: 19 }, 
	  { shape: 9, dir: 0, x: 33 },
	  { shape: 7, dir: 0, x: 33 },
	  { shape: 5, dir: 0, x: 23 }, 
	  { shape: 7, dir: 0, x: 28 },
	  { shape: 7, dir: 0, x: 30 }, 
	  { shape: 8, dir: 0, x: 12 },
	  { shape: 7, dir: 0, x: 35 },
	  { shape: 9, dir: 2, x: 33 }, 
	  { shape: 7, dir: 0, x: 37 },
	  { shape: 4, dir: 0, x: 11 }, 
	  { shape: 7, dir: 0, x: 37 },
	  { shape: 7, dir: 0, x: 39 }, 
	  { shape: 1, dir: 1, x: 4 },
	  { shape: 8, dir: 0, x: 4 }, 
	  { shape: 7, dir: 0, x: 30 }, 
	  { shape: 7, dir: 0, x: 39 },
	];
	nextPiece = 0;
	
	// 4*4 배열로 만든 블럭들
	shapes = [
	  [[0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0]], // 2*2 정사각형
	  [
	    [0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0], // 4*1 막대 가로형
	    [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0], 
	  ],
	  [
	    [0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0], // ㄱㄴ 2*3 
	    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0],
	  ],
	  [
	    [0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0], // s자 블럭 2*3
	    [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1],
	  ],
	  [
	    [0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0], // 3*2 L자 블럭
	    [0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0],	
	    [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1],
	    [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0],
	  ],
	  [
	    [0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0], // 3*2 뒤집은 L자 블럭
	    [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1],
	    [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0],
	    [0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0],
	  ],
	  [
	    [0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0], // 3*2 T자 블럭
	    [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0],
	    [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0],
	    [0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0],
	  ],
	  [
	    [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], // 1*1 정사각형 블럭
	  ],
	  [
	    [0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0], // 3*1 직사각형 블럭
	    [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0],
	  ],
	  [
	    [0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0], // v자 블럭
	    [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0],
	    [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0],
	    [0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0],
	  ],
	];
	
	function newFalling() {
	  if (nextPiece < pieces.length) {
	    falling = {
	      shape: pieces[nextPiece].shape,
	      dir: 0,
	      x: Math.floor(width / 2) - 1,
	      y: height,
	      placed: false,
	    };
	    falling.move = pieces[nextPiece].x - falling.x;
	    falling.rotate = pieces[nextPiece].dir;
	    nextPiece++;
	  } else {
	    falling = false;
	  }
	}
	
	function forEachFallingBlock(fn) {
	  forEachCellInGrid(
	    falling.x,
	    falling.y,
	    falling.x + 4,
	    falling.y + 4,
	    function (x, y, i) {
	      if (shapes[falling.shape][falling.dir][i]) {
	        fn(x, y);
	      }
	    }
	  );
	}
	
	function forEachCellInGrid(x, y, x2, y2, fn) {
	  var x1,
	    i = 0;
	  for (; y < y2; y++) {
	    for (x1 = x; x1 < x2; x1++) {
	      fn(x1, y, i);
	      i++;
	    }
	  }
	}
	
	function rotate() {
	  falling.dir = (falling.dir + 1) % shapes[falling.shape].length;
	  falling.rotate--;
	}
	
	function right() {
	  falling.x++;
	  falling.move--;
	}
	
	function left() {
	  falling.x--;
	  falling.move++;
	}
	
	function placeBlock(x, y) {
	  map[y * width + x] = 1;
	}
	
	function place() {
	  var x, y, i;
	  i = 0;
	  forEachFallingBlock(placeBlock);
	}
	
	function stepFallingBlock(x, y) {
	  ctx.fillRect(x, y, 1, 1);
	  if (y === 0 || map[(y - 1) * width + x]) {
	    falling.placed = true;
	  }
	}
	
	function drawMapCell(x, y, i) {
	  if (map[i]) {
	    ctx.fillRect(x, y, 1, 1);
	  }
	}
	
	remove = {
	  status: 0,
	  row: 0,
	};
	
	function loop() {
	  var i, x, y, options;
	  ctx.clearRect(0, 0, width, height);
	  forEachCellInGrid(0, 0, width, height, drawMapCell);
	  if (remove.status) {
	    if (remove.status == 1) {
	      map.splice(remove.row * width, width);
	    } else if (remove.status % 2 === 0) {
	      ctx.clearRect(0, remove.row, width, 1);
	    } else {
	      ctx.fillRect(0, remove.row, width, 1);
	    }
	    remove.status--;
	  } else {
	    if (falling) {
	      options = [];
	      if (falling.move > 0) {
	        options.push(right);
	      } else if (falling.move < 0) {
	        options.push(left);
	      }
	      if (falling.rotate > 0) {
	        options.push(rotate);
	      }
	      if (options.length > 0) {
	        options[Math.floor(Math.random() * (options.length - 0.8))]();
	      }
	      forEachFallingBlock(stepFallingBlock);
	      if (falling.placed) {
	        place();
	        newFalling();
	      } else {
	        falling.y--;
	      }
	    }
	    for (i = 0; i < map.length; i += width) {
	      for (var j = 0; j < width; j++) {
	        if (!map[i + j]) {
	          return;
	        }
	      }
	      if (j == width) {
	        remove.status = 6;
	        remove.row = i / width;
	        return;
	      }
	    }
	  }
	}
	
	map = [];
	for (i = 0; i < height * width; i++) {
	  map[i] = 0;
	}
	
	newFalling();
	setInterval(loop, speed);
});