<?php /* Smarty version 2.6.25, created on 2014-12-18 15:39:56
         compiled from comment.tpl */ ?>
<?php $this->assign('seotitle', "在线留言"); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
	<!--main start-->
	<div class="main">
		<div class="combox">
			<h2>在线留言</h2>
			<div class="content">
				<form action="" method="post">
				<table style="width:100%;line-height:30px;height:30px;">
					<tr><td class="w20">留言标题</td><td><input type="text" name="msgtitle" value="我对贵公司产品感兴趣"/></td></tr>
					<tr><td class="w20">您的姓名</td><td><input type="text" name="msgname"/></td></tr>
					<tr><td class="w20">联系方式</td><td><input type="text" name="msgcontact"/></td></tr>
					<tr><td class="w20">留言内容</td><td><textarea name="msgcontent" rows="10" cols="30"></textarea></td></tr>
					<tr><td class="w20">验证码</td><td><input type="text" name="capcode" style="width:80px;"/>&nbsp;<img style="cursor:pointer" src="<?php echo $this->_tpl_vars['siteurl']; ?>
/captcha/captcha.php" onclick="$(this).attr('src','<?php echo $this->_tpl_vars['siteurl']; ?>
/captcha/captcha.php?d='+Date())" /></td></tr>
					<tr><td class="w20">&nbsp;</td><td><input type="hidden" name="action" value="save"/><input type="submit" value="提交" /></td></tr>
				</table>
				</form>
			</div>
		</div>		
	</div>
	<!--main end-->
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>