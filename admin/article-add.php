<?php
require_once 'admin.inc.php';
require_once '../include/article.class.php';
require_once '../include/category.class.php';
$posttype = 'article';
$action = $_POST['action'];
if($action=='save')
{    
    $articletitle = $_POST['articletitle'];
    $articlecategory = $_POST['articlecategory'];
    $articleseotitle = $_POST['articleseotitle'];
    $articlekeywords = $_POST['articlekeywords'];
    $articledescription = $_POST['articledescription'];
    $articlecontent = $_POST['articlecontent'];
    $articlefilename = $_POST['articlefilename'];
	$articleadddate = $_POST['articleadddate'];
    $articletemplets = $_POST['articletemplets'];
    if(empty($articletitle))
    {
        exit("文章标题不能为空");
    }
    if(!is_numeric($articlecategory))
	{
	    exit("请选择正确的文章分类");
	}
	if(!empty($_FILES["newsthumb"]["name"]))
	{
	    require_once("../include/upload.class.php");
	    $filedirectory = YIQIROOT."/uploads/image";
	    $filename = date("ymdhis");
	    $filetype = $_FILES['newsthumb']['type'];
	    $upload = new Upload;
	    $upload->set_max_size(1800000); 
	    $upload->set_directory($filedirectory);
	    $upload->set_tmp_name($_FILES['newsthumb']['tmp_name']);
	    $upload->set_file_size($_FILES['newsthumb']['size']);
	    $upload->set_file_ext($_FILES['newtshumb']['name']); 
	    $upload->set_file_type($filetype); 
	    $upload->set_file_name($filename); 	    
	    $upload->start_copy(); 	    
	    if($upload->is_ok())
	    {
	        $newsthumb = YIQIPATH."uploads/image/".$filename.'.'.$upload->user_file_ext;
	    }
	    else
	    {
	        exit($upload->error());
	    }
	}else if (isset($_POST['newsthumb']))
	{
		$newsthumb = $_POST['newsthumb'];
	}
	if(empty($articleseotitle))
	{
	    $articleseotitle = $articletitle;
	}
	if(empty($articlekeywords))
	{
	    $articlekeywords = "-";
	}
    if(empty($articledescription))
	{
	    $articledescription = "-";
	}
	if(empty($articlecontent))
	{
	    $articlecontent="-";
	}	
	if(empty($articlefilename))
	{
	    $articlefilename = "-";
	}
	if($articlefilename == "-")
	{
	    $articlefilename = date("YmdHis");
	}
	$articlefilename = str_replace(" ","-",$articlefilename);
	$articledata = new Article;
    $existfilename = $articledata->ExistFilename($articlefilename,true);
	if($existfilename == 1)
	{
		if(strpos($articlefilename,"http://")!==0)
			exit("指定的文件名已经存在");
	}
	$articletemplets = str_replace("{style}/","",$articletemplets);	
	$nowdate = date("Y-m-d H:i:s");
	if(empty($articleadddate))
	{
		$articleadddate = $nowdate;
	}
	$sql = "INSERT INTO yiqi_article (aid ,title ,cid ,uid ,seotitle,seokeywords ,seodescription,content ,adddate ,lasteditdate,filename ,templets,status,newsthumb)" .
		   "VALUES (NULL, '$articletitle', '$articlecategory', '$adminuserinfo->uid','$articleseotitle', '$articlekeywords', '$articledescription', '$articlecontent', '$articleadddate', '$nowdate','$articlefilename', '$articletemplets', 'ok','$newsthumb')";
	$result = $yiqi_db->query(CheckSql($sql));
	if($result == 1)
	{
		$aid = $yiqi_db->insert_id;		
		//生成HTML
		$genehtml = getset("urlrewrite")->value;
		if ( $genehtml == "html" ) {
			$article = $articledata->GetArticle($aid);
			$article->content = mixkeyword($article->content);
			$tempinfo->assign("article",$article);
			if(!$tempinfo->template_exists($article->templets)) {
				exit("没有找到文章模板,请与管理员联系!");
			}
			$source = $tempinfo->fetch($article->templets);		
			$urlparam = array( 'name' => $articlefilename, 'type' => 'article', 'generatehtml' => 1 );
			$fileurl = formaturl($urlparam);
			$cachedata->WriteFileCache(YIQIROOT."/".$fileurl, $source, true);
		}
		//添加附加属性
		$idarr = $_POST["chk"];
		if(count($idarr) > 0) {
			foreach($idarr as $id) {
				$varname=$_POST["extname"];
				$varvalue=$_POST["extvalue"];
				if(is_numeric($id))
				{
					$sql = "INSERT INTO yiqi_meta (metaid,metatype,objectid,metaname,metavalue) VALUES (NULL,'$posttype','$aid','".$varname[$id]."','".$varvalue[$id]."')";					
					$yiqi_db->query(CheckSql($sql));
				}
			}
		}
		exit("文章添加成功！");
	}
	else
	{
	    exit("添加失败,请与管理员联系。");
	}	
}
?>
<?php
$adminpagetitle = "添加文章";
include("admin.header.php");?>
<link href="../images/cupertino/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../images/jquery-ui-1.8.4.custom.min.js"></script>
<script type="text/javascript" src="../images/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="../images/jquery-ui-timepicker-addon-0.5.min.js"></script>
<script type="text/javascript" src="../images/date.format.js"></script>
<div class="main_body">
<form id="sform" action="article-add.php" method="post">
<table class="inputform" cellpadding="1" cellspacing="1">
<tr><td class="label">文章标题</td><td class="input"><input type="text" class="txt" name="articletitle" /></td></tr>
<tr><td class="label">所属分类</td><td class="input"><select name="articlecategory">
<option value="0">请选择</option>
<?php
$categorydata = new Category;
$categorylist = $categorydata->GetCategoryList(0,"article");
foreach($categorylist as $category)
{
	echo "<option value=\"".$category->cid."\">".$category->name."</option>";
}
?></select></td></tr>
<tr><td class="label">SEO标题</td><td class="input"><input type="text" class="txt" name="articleseotitle" /></td></tr>
<tr><td class="label">SEO关键词</td><td class="input"><input type="text" class="txt" name="articlekeywords" /></td></tr>
<tr><td class="label">缩略图</td><td class="input"><div id="nwinfo"><input class="upfile txt" type="file" style="width:280px;" name="newsthumb" /> 或者 <a href="javascript:void(0);" onclick="setinput();" style="color:#0000cc;">输入地址</a></div></td></tr>
<tr><td class="label">SEO描述</td><td class="input"><textarea class="txt" name="articledescription" style="width:200px;height:110px;"></textarea></td></tr>
<tr><td class="label">发布时间</td><td class="input"><input id="pubdate" type="text" class="txt" name="articleadddate" value="<?php echo date("Y-m-d H:i:s"); ?>" />&nbsp;&nbsp;定时发布文章，该时间为北京时间。</td></tr>
<tr><td class="label">自定义文件名</td><td class="input"><input type="text" class="txt" name="articlefilename" value="" />&nbsp;&nbsp;设置为http://开头，将链接到指定的地址。</td></tr>
<tr><td class="label">默认模板</td><td class="input"><input type="text" class="txt" name="articletemplets" value="{style}/article.tpl" /></td></tr>
<tr><td class="label">文章内容</td><td class="input">
<textarea id="contentform" rows="1" cols="1" style="width:580px;height:360px;" name="articlecontent"></textarea>
<!-- Load TinyMCE -->
<script type="text/javascript" src="tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#contentform").tinymce({
			// Location of TinyMCE script
			script_url : 'tiny_mce/tiny_mce.js',

			// General options
			theme : "advanced",
			language : "zh",
			width : "580",
			height : "360",
			add_unload_trigger : true,
			plugins : "Ybrowser,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

			// Theme options
			theme_advanced_buttons1 : "undo,redo,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "forecolor,backcolor,del,ins,|,cut,copy,paste,pastetext,pasteword,|,outdent,indent,attribs,table,|,link,unlink,anchor,image,Ybrowser,media,cleanup,|,preview,code,fullscreen",
			theme_advanced_buttons3 : "",
			theme_advanced_buttons4 : "",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : false,
			
			// Drop lists for link/image/media/template dialogs
			template_external_list_url : "lists/template_list.js",
			external_link_list_url : "lists/link_list.js",
			external_image_list_url : "lists/image_list.js",
			media_external_list_url : "lists/media_list.js",
			relative_urls : false,
			convert_urls :true,
			remove_script_host : false
		});

	
		var formoptions = {
			beforeSubmit: function() {
				$("#submitbtn").val("正在处理...");
				$("#submitbtn").attr("disabled","disabled");
			},
			beforeSerialize: function($form, options) { 
				tinyMCE.triggerSave();                 
			},
            success: function (msg) {
                 alert(msg);
				 if(msg == "文章添加成功！")
				 {
					$("#sform").resetForm();
					var now = new Date();
					$("#pubdate").val(now.format("yyyy-mm-dd HH:MM:ss"));
				}
				$("#submitbtn").val("提交");
				$("#submitbtn").attr("disabled","");
            }
        };
		$("#sform").ajaxForm(formoptions);
		$("#pubdate").datetimepicker({
			showSecond: true,
			timeFormat: 'hh:mm:ss',
			hour:<?php echo date('H');?>,
			minute:<?php echo date('i');?>,
			second:<?php echo date('s'); ?>,
			closeText:'完成',
			currentText:'当前时间'
		});		
		$("#extattr").hide();
		$('#extattrlink').toggle(function(){
				$("#extattr").show();
				$(this).text('隐藏附加属性');
			},function(){
				$("#extattr").hide();
				$(this).text('显示附加属性');
		});
		var extnum = 2;
		$("#addext").click(function(){
			$("#extattr").show();
			$("#extattrlink").text('隐藏附加属性');
			$("#exttable").append('<tr id="exttd'+extnum+'"><td class="label">附加属性'+extnum+'</td><td class="input"><input type="hidden" name="chk[]" value="'+extnum+'" />名称：<input type="text" class="txt" name="extname['+extnum+']" />&nbsp;&nbsp;值：<input type="text" class="txt" name="extvalue['+extnum+']" /> <a href="javascript:void(0);" onclick="$(this).parent().parent().remove();">删除</a></td></tr>');
			extnum++;
		});
	});
	function setuploadfile(){
		$("#nwinfo").html('<input class="upfile txt" type="file" style="width:280px;" name="newsthumb" /> 或者 <a href="javascript:void(0);" onclick="setinput();" style="color:#0000cc;">输入地址</a>');
		$(".upfile").click();
	};
	function setinput(){
		$("#nwinfo").html('<input type="text" class="txt" style="width:200px;" name="newsthumb" /> 或者 <a href="javascript:void(0);" onclick="setuploadfile();" style="color:#0000cc;">上传图片</a>');
	};
</script>
<!-- /TinyMCE -->
<!-- /TinyMCE -->
</td></tr>
<tr><td class="label"><a id="extattrlink" href="javascript:void(0);">显示附加属性</a></td><td class="input"><a href="javascript:void(0);" id="addext" class="fr">增加一个附加属性</a></td></tr>
</table>
<div id="extattr">
<table id="exttable" class="inputform" cellpadding="1" cellspacing="1" style="margin-top:10px;">
<tr id="exttd1"><td class="label">附加属性1</td><td class="input"><input type="hidden" name="chk[]" value="1" />名称：<input type="text" class="txt" name="extname[1]" />&nbsp;&nbsp;值：<textarea class="txt" name="extvalue[1]"></textarea></td></tr>
</table>
</div>
<div class="clear">&nbsp;</div>
<div class="inputsubmit"><input type="hidden" name="action" value="save" /><input id="submitbtn" type="submit" class="subtn" value="提交" /></div>
</form>
</div>

</div>

<div class="clear">&nbsp;</div>
<?php include("admin.footer.php");?>
</div>

</body>

</html>