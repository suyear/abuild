<%@ taglib uri="/WEB-INF/tld/struts-menu.tld" prefix="menu"%>
<%@ taglib uri="/WEB-INF/tld/hi.tld" prefix="hi"%>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html;charset=utf-8"%>
<%@ include file="/includes/main.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>Abuild Authored By SUYEAR</title>
<%@ include file="/includes/styles.jsp"%>
<script type="text/javascript">
    $( function() {
        DWZ.init("styles/dwz/dwz.frag.xml", {
            //      loginUrl:"loginsub.jsp", loginTitle:"登录",   // 弹出登录对话框
            loginUrl : "login.jsp", // 跳到登录页面
            pageInfo : {
                pageNum : "pageInfo.currentPage",
                numPerPage : "pageInfo.pageSize",
                orderField : "pageInfo.sorterName",
                orderDirection : "pageInfo.sorterDirection"
            }, //【可选】
            debug : false, // 调试模式 【true|false】
            callback : function() {
                initEnv();
                $("#themeList").theme( {
                    themeBase : "styles/dwz/themes"
                });
            }
        });
    });
</script>
<style>
<style >
#header{display:none;height:0px;}
#leftside,#container,#splitBar{top:0px}
</style>
</head>

<body scroll="no">

<div id="layout">
<div id="header" style="display:none">
<div class="headerNav"><a class="logo" href="javascript:void(0)">标志</a>
<ul class="nav">
    <li><a href="personalSettingView.action" target="dialog">欢迎您,<ws:property
        value="@org.hi.framework.security.context.UserContextHelper@getUserName()" /></a></li>
    <li><a href="j_acegi_logout">退出</a></li>
</ul>
<ul class="themeList" id="themeList">
    <li theme="default">
    <div>蓝色</div>
    </li>
    <li theme="green">
    <div>绿色</div>
    </li>
    <li theme="purple">
    <div>紫色</div>
    </li>
    <li theme="silver">
    <div>银色</div>
    </li>
    <li theme="ext">
    <div class="selected">EXT</div>
    </li>
</ul>
</div>
</div>

<div id="leftside" style="top: 0px;">
<div id="sidebar_s">
<div class="collapse">
<div class="toggleCollapse">
<div></div>
</div>
</div>
</div>
<div id="sidebar">
<div class="toggleCollapse">
<h2>主菜单</h2>
<div>收缩</div>
</div>

<menu:useMenuDisplayer name="Velocity" config="menu/sysmenu.html"
    bundle="">
    <hi:displayMenu name="com.hi.tree.menu" menuName="himenu" type="sys" />
</menu:useMenuDisplayer></div>

</div>
<div id="container" style="top: 0px;">
<div id="navTab" class="tabsPage">
<div class="tabsPageHeader">
<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
<ul class="navTab-tab">
    <li tabid="main" class="main"><a href="javascript:void(0)"><span><span
        class="home_icon">我的主页</span></span></a></li>
</ul>
</div>
<div class="tabsLeft">left</div>
<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
<div class="tabsRight">right</div>
<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
<div class="tabsMore">more</div>
</div>
<ul class="tabsMoreList">
    <li><a href="javascript:void(0)">我的主页</a></li>
</ul>
<div class="navTab-panel tabsPageContent">
<div>
<div class="accountInfo">
<div class="alertInfo">
<!--
<h2><a href="http://j-hi.googlecode.com/files/j-hi_user_guide.pdf"
    target="_blank">J-Hi平台开发指南(PDF)</a></h2>
<a href="http://j-hi.googlecode.com/files/dwz-user-guide.pdf"
    target="_blank">DWZ框架使用手册(PDF)</a></div>
<div class="right">
 
<h2>
<p><a
    href="http://www.j-hi.net/courses!ke_cheng.action?project.id=1"
    target="_blank" style="line-height: 19px">初学者必读</a></p>
</h2>
<p><a href="http://j-hi.googlecode.com/files/application.swf"
    target="_blank" style="line-height: 19px">应用开发视频(flash)</a></p>
     -->
</div>
<p><span><a href="personalSettingView.action" target="dialog">欢迎您,<ws:property
    value="@org.hi.framework.security.context.UserContextHelper@getUserName()" />
| </a></span> <span><a href="j_acegi_logout">管理员退出</a></span></p>
<p><a href="demo_page2.html" target="dialog"></a></p>
</div>
<div class="pageFormContent" layoutH="80">
<!--
<h3>
<p>J-Hi官方网站<a href="http://www.j-hi.net" target="_blank">
http://www.j-hi.net</a></p>
</h3>
<p>在线演示地址<a href="http://demo.j-hi.net" target="_blank">
http://demo.j-hi.net</a> 帐号/密码 sa/sa</p>
<p>Google Code下载 <a href="http://code.google.com/p/j-hi/"
    target="_blank">http://code.google.com/p/j-hi/</a></p>
<p>J-Hi HowTo手册 <a
    href="http://j-hi.googlecode.com/files/j-hi_howto.doc" target="_blank">http://j-hi.googlecode.com/files/j-hi_howto.doc</a></p>
<p>WooW工作流文档(PDF) <a
    href="http://j-hi.googlecode.com/files/WooW-user-guide.pdf"
    target="_blank">http://j-hi.googlecode.com/files/WooW-user-guide.pdf</a></p>
<p>WooW工作流演示 <a href="http://woow.j-hi.net" target="_blank">http://woow.j-hi.net</a>
帐号/密码 sa/sa</p>
 -->
<!--
<div class="divider"></div>
<h2>J-Hi历程:</h2>
<pre style="margin: 5px; line-height: 1.4em">
唉！J-Hi平台终于发布了，这里面凝聚了太多人的艰辛与汗水。回想五年前它还只是大家为了探索如何使程序开发更好、更快速、易于管理而又不影响开发人员的编程习惯的一个构想，
当初它还只是个底层框架或开发工具，核心团队成员就是用这个小小的底层框架做了很多项目，从未想过会将它开源出来（因为我们觉得做得还不够好，担心开源后会被同行笑话）。
后来随着所接项目的逐渐增多，J-Hi所涉足的行业领域也不断广阔，因此我们也不得不适应需求的变化不断的为它加入新的功能，慢慢的它变得越来越强壮。
突然有一天有人提议我们将它开源吧,大家这才为平台的开源做准备。

如今这一版是J-Hi的第二个版本,除对底层做完善工作外，主要是集成了DWZ前端框架,以后我们还会秉承这一思想使J-Hi融入更多更优秀的技术。

使用Java开发就像，嗨！~~，打个招呼这般简单实用是J-Hi的源动力
</pre>
 -->
<div class="divider"></div>
<h2>关于聚喜猫:</h2>
<pre style="margin: 5px; line-height: 1.4em">
聚喜猫，这个名字有点喜庆，带点可爱。
你不妨把它当做一个结婚资讯获取、自己结婚过程分享互动的图片轻社区。
聚喜猫的想法来源于：我们希望帮助大家发现婚礼时尚，分享每个人结婚过程中的点滴幸福。
我们每个人都可以通过上传图片分享关于婚礼的一切幸福，其他人可以喜欢收藏作为借鉴或者互相评论交流心得，让每个人的幸福都来一次大升级。
其实我们聚喜猫操作起来很简单，一是喜欢，二是上传自己的分享，三是从互联网采集自己的分享，同时你还可以关注好友，和大家进行私信、评论和互动，当然玩聚喜猫是要注册会员的。
我们聚喜猫操作过程非常简单，使用之后快乐无限。
如果聚喜猫能给你结婚带来便利，那便是对我们价值的最大认可了。
</pre>

<div class="divider"></div>
<h2>我们的理念:</h2>
<pre style="margin: 5px; line-height: 1.4em">
每一张图片背后都倾注了我们极大的心血。
我们希望我们的认真与付出被您以及更多的人看到和认可。
我们倾力为您打造一个以分享婚礼幸福为主题的网络家园。
我们致力于此，并愿为之付出全部努力。
三个大领导，一群80末，90初的小萝卜头。
这就是我们。
或许开始的，我们并不是最大的，但是我们会努力成为最好的，我们愿意去学习，去努力为您提供最贴心的服务。
相信我们的服务会让您满意！
</pre>

<div class="divider"></div>
<h2>联系我们:</h2>
<p style="color: red">聚喜猫邮箱：contact@juximao.com</p>

<p style="color: red">聚喜猫官方QQ：800018141</p>

<p style="color: red">聚喜猫官方微博：<a href="http://weibo.com/javahi"
    target="_blank">@聚喜猫</a></p>
</div>

</div>
</div>
</div>
</div>

<div id="taskbar" style="left: 0px; display: none;">
<div class="taskbarContent">
<ul></ul>
</div>
<div class="taskbarLeft taskbarLeftDisabled" style="display: none;">taskbarLeft</div>
<div class="taskbarRight" style="display: none;">taskbarRight</div>
</div>
<div id="splitBar"></div>
<div id="splitBarProxy"></div>
</div>
<!-- <div id="footer">Copyright &copy; 2011 <a href="#" target="dialog">J-Hi研发团队</a></div> -->
<div id="footer">©Copyright 2010-2012 聚喜猫 juximao.com
苏ICP备09057240号-2</div>
<!--拖动效果-->
<div class="resizable"></div>
<!--阴影-->
<div class="shadow" style="width: 508px; top: 148px; left: 296px;">
<div class="shadow_h">
<div class="shadow_h_l"></div>
<div class="shadow_h_r"></div>
<div class="shadow_h_c"></div>
</div>
<div class="shadow_c">
<div class="shadow_c_l" style="height: 296px;"></div>
<div class="shadow_c_r" style="height: 296px;"></div>
<div class="shadow_c_c" style="height: 296px;"></div>
</div>
<div class="shadow_f">
<div class="shadow_f_l"></div>
<div class="shadow_f_r"></div>
<div class="shadow_f_c"></div>
</div>
</div>
<!--遮盖屏幕-->
<div id="alertBackground" class="alertBackground"></div>
<div id="dialogBackground" class="dialogBackground"></div>

<div id='background' class='background'></div>
<div id='progressBar' class='progressBar'>数据加载中，请稍等...</div>

<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push( [ '_setAccount', 'UA-16716654-1' ]);
    _gaq.push( [ '_trackPageview' ]);

    ( function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? ' https://ssl'
                : ' http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();
</script>

</body>
</html>