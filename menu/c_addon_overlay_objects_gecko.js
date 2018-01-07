/*
========================================
 Overlay Objects in Gecko v1.0.1
 Add-on for SmartMenus v6.0+
========================================
 (c)2008 ET VADIKOM-VASIL DINKOV
========================================
*/


// ===
c_adG={};c_adG.k=(c_gC&&c_pS>=20020530&&!c_mC);c_adG.i=[""];c_adG.sH=c_sH;c_sH=function(u){if(c_adG.k){var c,p,b,f=(c_menus[u.MM][0][1]=="fixed"),i;if(!u.IF)u.IF=c_adG.i.length;i=u.IF;c=c_cA(u);p=u.parentNode.parentNode;while(p.LV&&(p.LV>1||p.PP)){b=c_styles[p.className][0][0];c.x+=b;c.y+=b;if(c_gC13&&f)break;p=p.parentNode.parentNode}if(!c_adG.i[i]){c_adG.i[i]=c_cE("iframe",c_dB);c_adG.i[i].src=c_pS<20070309?"data:":document.location.protocol;c_adG.i[i].className="SM6GE"}c_adG.i[i].setAttribute("style","position:absolute;left:"+(c.x-(typeof c_shadow_offset!=c_u&&c_shadow_direction?c_shadow_offset:0))+"px;top:"+c.y+"px;width:"+(u.offsetWidth+(typeof c_shadow_offset!=c_u?c_shadow_offset:0))+"px;height:"+(u.offsetHeight+(typeof c_shadow_offset!=c_u?c_shadow_offset:0))+"px;border:0;"+(c_pS>=20040616?"":"-moz-")+"opacity:0;");c_dB.appendChild(c_adG.i[i])}c_adG.sH(u)};c_adG.hM=c_hM;c_hM=function(o,f){if(c_adG.k)try{c_dB.removeChild(c_adG.i[o.IF])}catch(e){};c_adG.hM(o,f)}