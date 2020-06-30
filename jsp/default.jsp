<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <head><link rel="stylesheet" type="text/css" href="../css/style.css" /> </head>
<%--    <meta charset="UTF-8">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
    <title>Default page</title>
</head>
<body>
    <div class="topbar">
        <!-- 这里是网站的顶部导航栏 -->
        <div>
            <ul id="ul1">
                <!-- <li><img src="../images/1.png" alt=""></li> -->
                <li class="selected"><p>首页</p></li>
                <li><p>榜单</p></li>
                <li><p>我的喜欢<p></li>
                <li><p>歌单<p></li>
                <li><p>听歌记录<p></li>
            </ul>
            <form action="">
                <ul id="ul2">
                    <li><input class="input" type="text" placeholder="查找音乐"></li> 
                </ul> 
                <ul id="ul4">
                    <li><input id="search" type="button" value="搜索"></li>
                </ul>
            </form>
            <ul id="ul3">
                <li><a href="">注册</a></li>
                <li><a href="">登录</a></li>
            </ul>
        </div>
   </div>
   <div class="content">
        <div class="list" id="list1">
            <div class="direction">
                <img src="../images/left.png"  id="left">
                <img src="../images/right.png"  id="right">
        </div>
        </div>
        <div class="list">
             <h3>this is page 2</h3>
            <img src="../images/1.png">
        </div>
        <div class="list">
             <h3>this is page 3</h3>
        </div>
        <div class="list">
             <h3>this is page 4</h3>
        </div>
        <div class="list">
            <h3>this is page 5</h3>
       </div>
    </div>
    <script>
        $(function(){
            //获取点击事件的对象
            $(".topbar #ul1 li").click(function(){
                //获取要显示或隐藏的对象
                var divShow = $(".content").children('.list');
                //判断当前对象是否被选中，如果没选中的话进入if循环
                if (!$(this).hasClass('selected')) {
                    //获取当前对象的索引
                    var index = $(this).index();
                    //当前对象添加选中样式并且其同胞移除选中样式；
                    $(this).addClass('selected').siblings('li').removeClass('selected');
                    //索引对应的div块显示
                    $(divShow[index]).show();
                    //索引对应的div块的同胞隐藏
                    $(divShow[index]).siblings('.list').hide();
                }
            });
        });
    </script>
    <script>
        window.onload = () =>{
         var container = document.createElement('div');//
         container.className = 'containers';
         list1.appendChild(container);
         var uls = document.createElement('ul');//生成容器
         uls.className = 'ulContainer'
         uls.id = 'ulList'
         var lis = '';
         for (var i = 1 ; i < 6 ; i++) {
             lis = document.createElement('li')
             var img = document.createElement('img')
             img.setAttribute("id", "newImg");
             img.src = "../images/b"+i+".jpg"
             lis.className = 'lis'
             lis.appendChild(img)
             uls.appendChild(lis)
         }
         container.appendChild(uls)
         uls.appendChild(lis)
         var lefts = document.getElementById('left')
         var rights = document.getElementById('right')
         var ulLists = document.getElementById('ulList');
         var lis = ulLists.getElementsByTagName('li');
         var i = 0;
         lefts.onclick = () => {
             --i;
             if ( i > 4 || i <= 0) {
                 ulLists.style.left = 0+'px';
                 i = 0;
             } else {
                 ulLists.style.left = -800*i+'px'
             }                
         }
         function rightMovie(){
             ++i;
             if ( i > 4) {
                 ulLists.style.left = 0+'px';
                 i = 0;
             } else {
                 ulLists.style.left = -800*i+'px'
             }
         }
         rights.onclick = () => {
             rightMovie()
         }
         setInterval(() => {
             rightMovie()
         },3000)
        }
     </script>
</body>
</html>
