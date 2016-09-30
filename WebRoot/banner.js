imgUrl1="logo/01.jpg";
imgtext1="MoviePoster01"
imgLink1=escape("http://www.makewing.com");
imgUrl2="logo/02.jpg";
imgtext2="MoviePoster02"
imgLink2=escape("http://www.makewing.com");
imgUrl3="logo/03.jpg";
imgtext3="MoviePoster03"
imgLink3=escape("http://www.makewing.com");
imgUrl4="logo/04.jpg";
imgtext4="MoviePoster04"
imgLink4=escape("http://www.makewing.com");
imgUrl5="logo/05.jpg";
imgtext5="MoviePoster05"
imgLink5=escape("http://www.makewing.com");

//这里调整滚动图片大小
 var focus_width=210
 var focus_height=210
 var text_height=15
 var swf_height = focus_height+text_height
 
 var pics=imgUrl1+"|"+imgUrl2+"|"+imgUrl3+"|"+imgUrl4+"|"+imgUrl5
 var links=imgLink1+"|"+imgLink2+"|"+imgLink3+"|"+imgLink4+"|"+imgLink5
 var texts=imgtext1+"|"+imgtext2+"|"+imgtext3+"|"+imgtext4+"|"+imgtext5
 
 document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
 document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="focus.swf"><param name="quality" value="high"><param name="bgcolor" value="#F0F0F0">');
 document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
 document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
 document.write('<embed src="pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0F0F0" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');  document.write('</object>');