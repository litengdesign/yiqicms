<?php /* Smarty version 2.6.25, created on 2014-01-07 16:17:44
         compiled from search.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'formaturl', 'search.tpl', 19, false),)), $this); ?>
﻿    <?php $this->assign('seotitle', $this->_tpl_vars['titlekeywords']); ?>
    <?php $this->assign('seokeywords', $this->_tpl_vars['metakeywords']); ?>
    <?php $this->assign('seodescription', $this->_tpl_vars['metadescription']); ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <DIV id=mainmain>
    <DIV id=main_con>
    <DIV class=web_bg>
    <DIV id=leftmain>
    <DIV id=left_1></DIV>
    <DIV id=left>
    <DIV class="mod_block">
    <H3 class=blk_t>搜索结果</H3>
    <DIV class=art_list_con>
    <UL>
    <?php $this->assign('keywordslist', $this->_tpl_vars['productdata']->SearchCategoryList($this->_tpl_vars['keywords'])); ?>
    <?php $_from = $this->_tpl_vars['keywordslist']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['keywordsinfo']):
?>
    <LI>
    <p><?php echo $this->_tpl_vars['keywordsinfo']->name; ?>
</p>
    <P class=l_title><a href="<?php echo formaturl(array('siteurl' => $this->_tpl_vars['siteurl'],'type' => 'product','name' => $this->_tpl_vars['keywordsinfo']->filename), $this);?>
" target="_blank"><img src="<?php echo $this->_tpl_vars['keywordsinfo']->thumb; ?>
"/></a></P>
    <p><?php echo $this->_tpl_vars['keywordsinfo']->content; ?>
</p>
    <P class=n_time><?php echo $this->_tpl_vars['keywordsinfo']->lasteditdate; ?>
</P></LI>
    <?php endforeach; endif; unset($_from); ?>
    </UL>
    </DIV>
    <div class="clear"> </div>
    <DIV class=list_bot></DIV></DIV>
    </DIV>
    <DIV id=left_2></DIV></DIV>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "side.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <DIV class=blankbar></DIV></DIV></DIV>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>