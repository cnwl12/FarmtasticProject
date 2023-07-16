var uiagent = { name : null, version : null };
!function(){var e,a=navigator.userAgent.toLowerCase(),i=a.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i)||[];return/trident/i.test(i[1])?(e=/\brv[ :]+(\d+)/g.exec(a)||[],uiagent.name="ie",uiagent.version=e[1]||100,!1):"chrome"===i[1]&&(e=a.match(/\bopr\/(\d+)/),null!=e)?(uiagent.name="opera",uiagent.version=e[1],!1):(i=i[2]?[i[1],i[2]]:[navigator.appName,navigator.appVersion,"-?"],i[0]="msie"==i[0]?"ie":i[0],null!=(e=a.match(/version\/(\d+)/i))&&i.splice(1,1,e[1]),uiagent.name=i[0],uiagent.version=i[1],!1)}();
if(uiagent.name=="ie"&&uiagent.version<=8) (function(d,s){d=document,s=d.createStyleSheet();d.querySelectorAll=function(r,c,i,j,a){a=d.all,c=[],r=r.replace(/\[for\b/gi,'[htmlFor').split(',');for(i=r.length;i--;){s.addRule(r[i],'k:v');for(j=a.length;j--;)a[j].currentStyle.k&&c.push(a[j]);s.removeRule(0)}return c}})();
var ui = {
/* S: 2017-05-30 추가 */
	initialize : function(){
		/* 카테고리 관련 스크립트 */
		this.setSlider(); // flexslider 세팅

		//2017-05 추가 Start
		this.labelToPlaceholder(); //label로 placeholder기능
        this.setFormStyle(); //폼요소 스타일 적용
		this.setCssSelectbox(); //셀렉박스 선택 전 스타일
		this.checkAll(); //체크박스 전체 선택
        this.checkboxStyle(); //checkbox / radio style
		this.flexibleTextarea(); //textarea.flexible 높이 변화
		this.fixedBottomBtn(); //하단 고정 버튼
		this.convertBtnText(); //버튼 텍스트 전환
		this.focusField(); //텍스트필드 입력시\
        this.checkUnfold(); //라디오/체크박스 선택 시 펼쳐짐
		this.autoHypenPhone(); //휴대폰번호 입력 중 하이픈 넣기
        //2017-05 추가 End

		//~IE9일 경우에만 실생
        if(ui.isIe9){
            $('.list-field li .col:first-of-type').addClass('first');
            $('.list-field li .col:last-of-type').addClass('last');
        }
	},

    getUagent : function(a) {
        return new RegExp(a).test(navigator.userAgent || navigator.vendor || window.opera);
    },

    //디바이스 별 구분으로 class 부여
    checkUagent : function(){
		if(this.getUagent(/iphone|ipad/i)){
			this.isIos = true;
			$('html').addClass('ios');
		}else if(this.getUagent(/android/i)){
            this.isAndroid = true;
            $('html').addClass('android');
		}else if(this.getUagent(/MSIE 8|MSIE 9/i)){
            this.isIe9 = true;
			this.isPc = true; // 2017-06-07 : 추가
            $('html').addClass('pc ie9');
		}else{
            $('html').addClass('pc');
			this.isPc = true;
		}
    },

	//checkbox / radio style
	checkboxStyle : function () {
    	var o = this;
		$(document).on('change','input:checkbox:not(".all-check"),input:radio',function () {
            $('input:radio').each(function () {
				$(this).filter('[name='+$(this).attr('name')+']').parent().removeClass('on');
            });
			if($(this).prop('checked')){
				$(this).parent().addClass('on').hide().show(); /* 2018-09-17 : .hide().show() 추가(IE8 렌더링 오류로 다시 그려야 함) */
			}else{
				$(this).parent().removeClass('on').hide().show(); /* 2018-09-17 : .hide().show() 추가(IE8 렌더링 오류로 다시 그려야 함) */
			}
            o.checkAll();
        });
		$(document).on('change','input.all-check',function () {
            var $chkall = $(this);
            /*if($(this).closest('.ui-all-check').find('.agree .icon-ps').length){
            	var $chkbox = $(this).closest('.ui-all-check').find('.agree').has('.icon-ps').find('input:checkbox').not(':disabled');  2018-10-30 : 수정 
            }else{
                var $chkbox = $(this).closest('.ui-all-check').find('input:checkbox').filter(':gt(0)');
            }*/
            var $chkbox = $(this).closest('.ui-all-check').find('input:checkbox').filter(':gt(0)'); /* 2020-09-16 : 추가 */
            if($chkbox.not(':checked').length){
                $chkall.prop('checked',true);
                $chkbox.prop('checked',true);
                $chkall.parent().addClass('on');
                $chkbox.parent().addClass('on');
                if($('[data-target]').length){
                	$($(this).data('target')).focus();
				}
            }else{
                $chkall.prop('checked',false);
                $chkbox.prop('checked',false);
                $chkall.parent().removeClass('on');
                $chkbox.parent().removeClass('on');
            }
            o.checkAll();
        });
    },

	//체크박스 전체 선택
    checkAll : function(){
		function init() {
			$('.ui-all-check').each(function () {
				var $chkall = $(this).find('.all-check');
				/* 2020-10-05 : 삭제
				if($(this).find('.agree .icon-ps').length){
                	var $chkbox = $(this).find('.agree').has('.icon-ps').find('input:checkbox').not(':disabled'); /* 2018-10-30 : 수정 * /
				}else{
                	var $chkbox = $(this).find('input:checkbox').filter(':gt(0)').not(':disabled');
				}
				*/
				var $chkbox = $(this).find('input:checkbox').filter(':gt(0)').not(':disabled'); /* 2020-10-05 : 추가 */
                if($chkbox.not(':checked').length){
                    $chkall.prop('checked',false);
                    $chkall.parent().removeClass('on');
				}else{
                    $chkall.prop('checked',true);
                    $chkall.parent().addClass('on');
				}
			});
        }
        init();
		setTimeout(function () {
			init();
        },50);
	},

	//폼요소 스타일 적용
	setFormStyle : function () {
		$('input:checked').parent().addClass('on');
    },
	
	//셀렉박스 선택 전 스타일
	setCssSelectbox : function(){
		$('select.ready').on('change',function(){
			if(this.selectedIndex === 0){
				$(this).addClass('ready');
			}else{
				$(this).removeClass('ready');
			}
		});
	},
	
	//label로 placeholder기능
	labelToPlaceholder : function(){
		this.labelReset = function(){
			$('.join2 .col').each(function(){
				if($(this).find('input, textarea').val() != ''){
					$(this).find('label').hide();
				}
			});
		}
		$(document)
		.on('keydown keyup focus change','.join2 .col input, .join2 .col textarea',function(){
			var $lb = $(this).closest('.col').find('label');
			if($(this).val() != ''){
				$lb.hide();
			}else{
				$lb.show();
			}
		})
		.on('blur','.join2 .col input, .join2 .col textarea',function(){
			var $lb = $(this).closest('.col').find('label');
			if($(this).val() == ''){
				$lb.show();
			}
			
		})
		.on('click','.join2 .col label',function(){
			$(this).closest('.col').find('input,textarea').focus();
		});
		this.labelReset();

	   /* 2018-01-29 : 추가 */
	   setTimeout(function () {
	      ui.labelReset();
	   },100);
	   /* //2018-01-29 : 추가 */

	},
	
	//textarea.flexible 높이 변화
	flexibleTextarea : function(){
		$(document).on('keyup','textarea.flexible',function(){
			$(this).css('height','').outerHeight(this.scrollHeight);
		});
	},

	//하단 고정 버튼
	fixedBottomBtn : function(){
		var $win = $(window);
		var $body = $('body');
		var $join2 = $('.join2');
        if(this.isPc){
        	var $wrap = $('ui-wrap');
			$body = $('#ui-container');
		}
		var setFixed = function(){
			var init = function () {
				if (this.isPc) {
					if ($body.height() < 720) {
						$join2.addClass('btn-fixed-bottom-on');
					} else {
						$join2.removeClass('btn-fixed-bottom-on');
					}
				} else {
					if ($body.height() < $win.height()) {
						$join2.addClass('btn-fixed-bottom-on');
					} else {
						$join2.removeClass('btn-fixed-bottom-on');
					}
				}
			}
            setTimeout(function () {
                init();
            },100);
            init();
		}
		$(window).bind('scroll resize',setFixed);
        setFixed();
	},

	//버튼 텍스트 전환
	convertBtnText : function () {
		$(document).on('click','[data-after-text]',function () {
			$(this).text($(this).data('after-text'));
        });
    },

	//텍스트필드 입력시
    focusField : function () {
		$(document).on('focus','.list-field input, .list-field select, .list-field textarea',function () {
			$(this).closest('li').addClass('focus');
        });
		$(document).on('blur','.list-field input, .list-field select, .list-field textarea',function () {
			$(this).closest('li').removeClass('focus');
        });
    },

	//휴대폰번호 입력 중 하이픈 넣기
    autoHypenPhone : function(){
        var init = function() {
           var str = $(this).val().replace(/[^0-9]/g, '');
           var tmp = '';
           if(str.length === 7){
               tmp += str.substr(0, 3);
               tmp += '-';
               tmp += str.substr(3);
               $(this).val(tmp);
           }else if(str.length > 4){
               tmp += str.substr(0, 4);
               tmp += '-';
               tmp += str.substr(4);
               $(this).val(tmp);
           }
       }
		$(document).on('keyup','input[data-input-type="phone-num"]',init);
        $('input[data-input-type="phone-num"]').each(init);
	},

	//라디오/체크박스 선택 시 펼쳐짐
	checkUnfold : function () {
		$('[data-role=ui-check-fold]').each(function () {
			var $that = $(this);
			var $sendBtn = $(this).find('.ui-sendbtn');
			var $layer = $that.find('[data-role^=ui-fold-layer-]');
			var init = function ($btn) {
                $layer.stop().slideUp('fast');
				$sendBtn.attr('disabled','disabled');
                if($btn.prop('checked')) {
					/* S: 2017-08-14 : 수정 */
                    $that.find('[data-role=ui-fold-layer-'+$btn.data('rel').replace('ui-fold-btn-','')+']').stop().slideDown('fast',function () {
						$(this).css('height','');
                    });
                    /* E: 2017-08-14 : 수정 */
                    //$that.find('[data-role=ui-fold-layer-'+$btn.data('rel').replace('ui-fold-btn-','')+']').stop().slideDown('fast');
                    $btn.closest('li').find('.ui-sendbtn').removeAttr('disabled');
                }
            }
            $(this).find('[data-rel^=ui-fold-btn-]').change(function () {
				init($(this));
            });
			init($(this).find('[data-rel^=ui-fold-btn-]:checked'));
        });
    },

	setSlider : function(){
		//슬라이딩 요소 정의
        $('.slides').each(function () {
        	if($(this).children().length > 1){
				$(this).parent().flexslider({
					animation : "slide"
				});
			}
        })
	},

	gototop : function(){
		$(document).on("click", '#ui-gototop a.btn-top', function(e){
			$(document).scrollTop(0);
			e.preventDefault();
		});
	},
	uiFloating : function(){
        if(!$("#ui-nav-page").length) return;
		var lastScroll = $(document).scrollTop();
		if($(document).scrollTop() > 0){
			$("#ui-aside-quick").addClass("scroll");
		}
		if($(document).scrollTop() == 0){
			$("#ui-nav-page ul li.top").hide();
		}else{
			$("#ui-nav-page ul li.top").show();
		}
		$(document).on("scroll", function(e){
			var st = $(document).scrollTop();

			if(st >= lastScroll){
				if(st == lastScroll || st < lastScroll){
					return;
				}
				$("#ui-aside-quick").addClass("scroll");
			}else if(st == 0){
				$("#ui-aside-quick").removeClass("scroll");
			}else{
				$("#ui-aside-quick").removeClass("scroll");
			}

			lastScroll = st;

			if($(document).scrollTop() == 0){
				$("#ui-nav-page ul li.top").hide();
			}else{
				$("#ui-nav-page ul li.top").show();
			}
		});
	},
	toggleClass : function(){
		$(document).on("click", '[data-toggleclass]', function(e){
			var $button = $(e.currentTarget),
				classNames = $button.attr("data-toggleclass").split(" ");

			$(classNames).each(function(i, v){
				$button.hasClass(v) ? $button.removeClass(v) : $button.addClass(v);
			});
			e.preventDefault();
		});
	},
/* E: 2017-05-30 추가 */

	common : {
		trace : function(msg,type){ /* ui.common.trace(1); */
			if($("#ui-trace").length==0) $("body").append("<div id='ui-trace' style='position:fixed; left:0; bottom:10px; padding:3px; width:95%; background:#fff; border:1px solid red;z-index:1000000;'><a href='#del' style='position:absolute;right:3px;top:3px;' onclick='$(this).next().html(\"\"); return false;'>del</a><div class='inner'></div></div>");
			$box = $("#ui-trace .inner");
			msg = (type) ? $box.html()+msg : msg;
			$box.html(msg);
		},
		user : function(type){ return {"is":(uiagent.name==type)?true:false,"name":uiagent.name,"version":uiagent.version}; },
		getstyle : function(tg,p){ return (tg.currentStyle)? tg.currentStyle[p] : document.defaultView.getComputedStyle(tg,null)[p]; },
		setstyle : function(obj, cs){ for(i in cs) obj.style[i] = cs[i]; },
		addEvent : function(ev, fun, type){ if (window.addEventListener) window.addEventListener(ev, fun, type||false); else if (window.attachEvent) window.attachEvent("on"+ev, fun); },
		offset : function(elem){
			var box = { top: 0, left: 0 };
			if ( typeof elem.getBoundingClientRect !== undefined ) box = elem.getBoundingClientRect();
			var doc = elem && elem.ownerDocument, docelem = doc.documentElement;
			win = ((doc != null && doc == doc.window) ? doc : doc.nodeType === 9 ? doc.defaultView || doc.parentWindow : false);
			return { top: box.top  + ( win.pageYOffset || docelem.scrollTop )  - ( docelem.clientTop  || 0 ), left: box.left + ( win.pageXOffset || docelem.scrollLeft ) - ( docelem.clientLeft || 0 ) };
		},
		numtwo : function(num){ return (num>9) ? num : "0"+""+num; }, /* 숫자 두자리 */
		inputDesign : function(objs){
			var inputChange = function(){
				var cn = (this.type =="radio") ? "radio" : "check", regname = cn+"-checked";
				if(cn=="radio" && this.checked) $('input[name="'+this.name+'"]').parent().removeClass(cn+"-checked");
				if(this.checked) this.parentNode.className += (" "+cn+"-checked");
				else this.parentNode.className = this.parentNode.className.replace(new RegExp(regname,"gi"),"");
			};
			for(jj in objs){ if(Number(jj)||Number(jj)===0){
				if(objs[jj].type=="file"){
					objs[jj].baseW = objs[jj].offsetWidth;
					if(!objs[jj].parentNode.className.match(/file\-design/)){
						$(objs[jj]).wrap('<span class="file-design" />');
						$(objs[jj]).addClass("resize").parent().prepend('<input type="text" id="designFileInput'+jj+'" class="text '+objs[jj].className+'" readonly="readonly" title="첨부파일 결과값 출력" value="'+($(objs[jj]).attr("placeholder")?$(objs[jj]).attr("placeholder"):"")+'" style="width:'+(objs[jj].baseW-84)+'px;text-shadow:0;" />');
						document.getElementById("designFileInput"+jj).matchFile = objs[jj];
						objs[jj].matchInput = document.getElementById("designFileInput"+jj); objs[jj].matchInput.readonly = true; /* ,"disabled":"true"    .click(function(){ objs[jj].matchFile.click(); }); --> 개발 붙이면 충돌일어나서 삭제 */
						if(objs[jj].placeholder){ objs[jj].matchInput.value = objs[jj].placeholder; /* ui.common.placeholder(objs[jj]); */ }
						objs[jj].onchange = function(){ this.matchInput.value = this.value; this.matchInput.reset(); };
						objs[jj].reset = function(){ var $this = $(this); $this.removeClass("resize"); try{ this.matchInput.style.width = this.offsetWidth-84+"px"; $this.addClass("resize"); this.matchInput.value = this.value; this.matchInput.reset(); }catch(e){}; };
					};
					objs[jj].reset();
				}else{
					var cn = (objs[jj].type =="radio") ? "radio" : "check";
					if(!objs[jj].checked) objs[jj].checked = false;
					if(!objs[jj].reset){
						if(!objs[jj].parentNode.className.match(cn+'-design')) $(objs[jj]).wrap('<span class="'+cn+'-design" />');
						$(objs[jj]).focus(function(){ $(this).parent().addClass(cn+"-focus") }).blur(function(){ $(this).parent().removeClass(cn+"-focus") }).change(inputChange);
						objs[jj].reset = function(){inputChange.call(this);};
					};
					objs[jj].reset();
				}
			}}
		},
		toggleList : function(tag, pos, targetname, type, vtxt){
			vtxt = vtxt || false;
			if(type=="faq"||type=="case1"){
				var target = [pos.parents(tag).first().find("."+targetname[0]), pos.parents(tag).first().find("."+targetname[1])];
				var eqnum = target[0].index(pos);
				target[1].not(":eq("+eqnum+")").removeClass("active").end().eq(eqnum).toggleClass("active");
				target[0].not(":eq("+eqnum+")").removeClass("active").end().eq(eqnum).toggleClass("active").end().each(function(ii){
					if(vtxt){ var alink = $(this).find("a")[0];
					alink.innerHTML = target[0].eq(ii).is(".active")? alink.innerHTML.replace(vtxt.closetxt,vtxt.opentxt) : alink.innerHTML.replace(vtxt.opentxt,vtxt.closetxt); }
				});
			}else if(type=="case2"){
				var target = [pos.parents(tag).first().find("."+targetname[0]), pos.parents(tag).first().find("."+targetname[1])];
				var eqnum = target[0].index(pos);
				if(vtxt&&vtxt.rc) $(vtxt.rc).toggleClass("active");
				target[1].eq(eqnum).toggleClass("active");
				target[0].eq(eqnum).toggleClass("active").each(function(ii){
					if(vtxt){ var alink = vtxt.rc?vtxt.rc:$(this).find("a")[0];
					alink.innerHTML = target[0].eq(eqnum).is(".active")? alink.innerHTML.replace(vtxt.closetxt,vtxt.opentxt) : alink.innerHTML.replace(vtxt.opentxt,vtxt.closetxt); } //2015-12-17 SSO개발자 수정
				});
			}
		},
		boxshow : function(btn, $obj, cssname){
			if(cssname && btn) $(btn).addClass(cssname);
			if(typeof($obj)=="string"){
				if($obj.split("#").length>1) $("#"+$obj.split("#")[1]).removeClass("js-colhide").show();
			}else if(typeof($obj)=="object"){
				$obj.removeClass("js-colhide").show();
			}
		},
		boxhide : function(btn, $obj, cssname){
			if(cssname && btn) $(btn).removeClass(cssname);
			if(typeof($obj)=="string"){
				if($obj.split("#").length>1) $("#"+$obj.split("#")[1]).addClass("js-colhide").hide();
			}else if(typeof($obj)=="object"){
				$obj.addClass("js-colhide");
			}
		},
		boxtoggle : function(btn, $obj, cssname, vtxt, type){
			type = type || false, showcss = (type?"js-colhidefix":"js-colhide");
			if(cssname && btn) $(btn).toggleClass(cssname);
			var endfun = function(){
				if(!btn || !vtxt) return;
				if($(this).is(":hidden")||$(this).is("."+cssname)){ btn.innerHTML = btn.innerHTML.replace(vtxt.opentxt,vtxt.closetxt); }else{ btn.innerHTML = btn.innerHTML.replace(vtxt.closetxt,vtxt.opentxt); }
			}
			if(typeof($obj)=="string"){
				if($obj.split("#").length>1) $obj = $("#"+$obj.split("#")[1]);
				else return false;
			};
			if(btn.nodeName.toLowerCase()=="input"){
				if(btn.checked){ if(cssname && btn) $(btn).addClass(cssname); $obj.removeClass(showcss).show(); }else{ if(cssname && btn) $(btn).removeClass(cssname); $obj.addClass(showcss); }
			}else{
				if(type=="onlycss"){
					if($(btn).is("."+cssname)) $obj.addClass(cssname);
					else $obj.removeClass(cssname);
				}else{
					if($obj.is(":hidden")||$obj.is("."+showcss)) $obj.removeClass(showcss).show();
					else $obj.show().addClass(showcss);
				}
			}; $obj.each(endfun);
		},
		coltoggle : function(btn, $obj, vtxt){
			var findname = "tr-toggle";
			if(btn) $(btn).toggleClass("active");
			if(btn.className.match(/active/)){
				if(ui.common.user("ie").version<=7) $obj.find("."+findname).addClass("js-colshow").removeClass("js-colhide");
				else  $obj.find("."+findname).addClass("js-colshow").slideUp(100, function(){$(this).removeClass("js-colhide").removeAttr("style")});
				btn.innerHTML = btn.innerHTML.replace(vtxt.closetxt,vtxt.opentxt);
			}else{
				$obj.find("."+findname).addClass("js-colhide").removeClass("js-colshow");
				btn.innerHTML = btn.innerHTML.replace(vtxt.opentxt,vtxt.closetxt);
			}
			if(vtxt.func) vtxt.func(btn);
		},
		tabchange : function(btn, $links, cssname, $pos, type){
			cssname = cssname || "active", $pos = $pos || false, showcss = (type?"js-colhidefix":"js-colhide");
			var isviewtype = false;
			if(!btn.$obj){ btn.$obj = ui.common.idobjreturn(btn.href); if(!btn.$obj) btn.$obj = ui.common.idobjreturn(btn.className, "class"); };
			if($(btn).is(".ex-tab-thumb")||$(btn).is(".ex-tab-list")){
				if($(btn).parents('.samll-exwrap').length>0){
					if($(btn).parents('.samll-exwrap').prev('.ex-tabwrap').length>0) isviewtype = $(btn).parents('.samll-exwrap').prev('.ex-tabwrap').find('.view-type a');
					else isviewtype = $(btn).parents('.samll-exwrap').parent().prev('.ex-tabwrap').find('.view-type a');
				}else if($(btn).parents('.ex-tabwrap').length>0){
					if($(btn).parents('.ex-tabwrap').next('.samll-exwrap').length>0) isviewtype = $(btn).parents('.ex-tabwrap').next('.samll-exwrap').find('.view-type a');
					else isviewtype = $(btn).parents('.ex-tabwrap').parent().next('.samll-exwrap').find('.view-type a');
				}
			}
			$links.each(function(ii){
				if(!this.$obj){ this.$obj = ui.common.idobjreturn(this.href); if(!this.$obj) this.$obj = ui.common.idobjreturn(this.className, "class"); };
				if(btn==this){ if(isviewtype) isviewtype.eq(ii).addClass(cssname); if(this.$obj){ this.$obj.removeClass(showcss).show(); }; $(this).addClass(cssname).parent("li").addClass("active-parent"); }
				else{ if(this.$obj&&this.$obj.get(0)!=btn.$obj.get(0)){ if(this.$obj){ this.$obj.addClass(showcss)}; if(isviewtype) isviewtype.eq(ii).removeClass(cssname); }; $(this).removeClass(cssname).parent("li").removeClass("active-parent"); }
			});
			if($pos){
				var postop = $pos.position().top+($(btn).offset().top-$pos.offset().top+parseFloat($pos.css("margin-top")));
				$pos.stop().animate({"top":postop<0?0:postop}, 300, "easeInOutCubic");
			}
		},
		tabauto : function(v){
			var $area = v.$area, $obj = v.$obj, $links = v.$links, cssname = v.cssname, time = v.time || 3000, dir = v.direction || "left", acttype = v.acttype || "click";
			cssname = cssname || "active";
			var reset = function(){
				var $this = $(this), objcontainer = this;
				if(v.stoparea) v.stoparea = $this.parents(v.stoparea).first();
				this.$taba = $this.find($obj+" "+$links), this.tabflag = false, this.tabrepeat = null, this.tabtime=time, this.stoparea=v.stoparea || $this, this.stoparea[0].obj = this;
				if(this.$taba.length<=1) return;
				objcontainer.tabclear = function(objinherit){ clearTimeout(objinherit.tabrepeat); };
				objcontainer.tabnext = function(objinherit){ objinherit.tabmov(objinherit, $this.find($obj+" "+$links).index($this.find($obj+" "+$links).filter("."+cssname))); return false; };
				objcontainer.tabtoggle = function(objinherit,btn){ objinherit.tabclear(objinherit); objinherit.tabflag = !objinherit.tabflag; if(!objinherit.tabflag){ objinherit.tabauto(objinherit); }; $(btn).toggleClass("play").html(function(){ return (this.innerHTML.indexOf("수동")>-1)?"슬라이드 자동":"슬라이드 수동"}); };
				objcontainer.tabstop = function(objinherit){ objinherit.tabclear(objinherit); };
				objcontainer.tabplay = function(objinherit){ objinherit.tabclear(objinherit); objinherit.auto(objinherit); };
				objcontainer.tabauto = function(objinherit){ objinherit.tabclear(objinherit); if(!objinherit.tabflag){ objinherit.tabautoRepeat(objinherit); }};
				objcontainer.tabautoRepeat = function(objinherit){ objinherit.tabrepeat = setTimeout(function(){ if(!objinherit.oflag){ objinherit.tabnext(objinherit); } objinherit.tabauto(objinherit); }, objinherit.tabtime); };
				objcontainer.tabmov = function(objinherit, pos){
					objinherit.$taba = $this.find($obj+" "+$links);
					var nextpos = (dir=="left")?objinherit.$taba.eq(pos).parent().position().left+objinherit.$taba.eq(pos).parent().width():objinherit.$taba.eq(pos).parent().position().top+objinherit.$taba.eq(pos).parent().height();
					if($this.find(".controlarea .next").length==0&&nextpos==((dir=="left")?$this.find(".js-rolling-list").width():$this.find(".js-rolling-list").height())) nextpos = 0;
					objinherit.$taba.each(function(ii){
						var $pobj = $(this).parents($obj), ppos = ($pobj.length>0) ? ((dir=="left")?$pobj.offset().left-$pobj.parent().offset().left:$pobj.offset().top-$pobj.parent().offset().top) : 0, cpos = ((dir=="left")?$(this).parent().position().left:$(this).parent().position().top)+ppos;
						if(nextpos>=((dir=="left")?$pobj.parent().width():$pobj.parent().height())-10){ $this.find(".controlarea .next").click(); return false; }
						else if(cpos==nextpos){ if(acttype=="click"){$(this).trigger("click");}else{$(this).trigger("mouseover");$(this).trigger("mouseout");}; return false; }
					});
				};
				if(v.cfun) $this.find($obj+" "+$links).click(function(){ if(acttype=="click"){ objcontainer.tabauto(objcontainer); v.cfun.call(this); return false; }else{return} }).mouseover(function(){ if(acttype=="over"){ objcontainer.tabauto(objcontainer); v.cfun.call(this); } });
				objcontainer.stoparea.mouseover(function(){this.obj.oflag = true;}).mouseout(function(){this.obj.oflag = false;});
				if($this.find(".controlarea").length==0) $this.prepend('<span class="controlarea"></span>');
				if($this.find(".controlarea .auto").length==0) $this.find(".controlarea").prepend('<button class="ir auto stop"><i>슬라이드 수동</i></button>');
				this.auto = $this.find(".controlarea .auto").unbind("click").click(function(){ objcontainer.tabtoggle(objcontainer, this); return false; });
				this.tabclear(this); this.tabauto(this);
			};
			$area.each(reset);
		},
		zonefix : function(v){
			v.zone = v.zone || $("body").children().first();
			if(!v.zone && v.zone.length==0) return;
			v.zone.each(function(ii){
				if($(this).find(v.fix.eq(ii)).length!=0){
					$(this).find(v.fix.eq(ii)).parentsUntil("#ui-contents, .pop-wrap").andSelf().addClass("js-show");
					$(this).find(v.fix.eq(ii)).wrap("<div class='js-fix-wrap' style='height:"+v.fix.eq(ii).outerHeight()+"px; width:"+v.fix.eq(ii).outerWidth()+"px; float:"+v.fix.eq(ii).css("float")+"; margin:"+v.fix.eq(ii).css("margin")+";' />");
					$(this).find(v.fix.eq(ii)).wrap("<div class='js-fix-obj' />");
					var fixobj = { $obj : $(this).find(v.fix.eq(ii)).parent(), $wrap : $(this).find(v.fix.eq(ii)).parent().parent(), $zone : $(this), repeat:null };
					fixobj.$obj[0].reset = function(falg){
						if(fixobj.$obj.is(":hidden")) return;
						fixobj.$obj.stop();
						var wrapPos = fixobj.$wrap.offset();
						var pos = {fixin : wrapPos.top, fixout : wrapPos.top+fixobj.$zone.height(), scLeft : $(document).scrollLeft(), scTop : $(document).scrollTop() };
						pos.fixmax = pos.fixout-fixobj.$obj.height();
						fixobj.$obj.css({"margin-top":0});
						if(pos.fixin<=pos.scTop && pos.fixout >pos.scTop){
							fixobj.$obj.css({"position":"fixed", "left":fixobj.$wrap.offset().left, "top":0, "width":fixobj.$wrap.width(), "z-index":100, "margin-left":-pos.scLeft});
							if(pos.fixmax<pos.scTop) fixobj.$obj.css({"margin-top":pos.fixmax-pos.scTop});
						}else{ fixobj.$obj.removeAttr("style"); }
						if(!falg) fixobj.$obj.delay(300).animate({"z-index":"auto"}, 0, function(){ fixobj.$obj[0].reset(true); })
					};
					$(this).find(v.fix.eq(ii)).parentsUntil("#ui-contents, .pop-wrap").andSelf().removeClass("js-show");
					$(window).load(function(){fixobj.$obj[0].reset();}).scroll(function(event, delta) { fixobj.$obj[0].reset(); }).resize(function(){fixobj.$obj[0].reset();}).click(function(){
					fixobj.$wrap.css({"height":fixobj.$obj.height()}); fixobj.$obj[0].reset(); });
				}
			});
		},
		activepage : function($obj,num){ $obj.find("a").not(".first, .prev, .next, .last").removeClass("active").eq(num-1).addClass("active"); },
		pagescroll : function(v){ if(!v.posobj.offset()){ return false; }; $(!ui.common.user("ie").is?"body":"html").stop().animate({"scrollTop":v.posobj.offset().top-(v.gap||0)}, 500); },
		expendfunc : function(objinherit,v){
			if(!objinherit.btn.pagenum) return;
			var curbtn = objinherit.btn.pagenum.children(".num"), curindex = curbtn.index(curbtn.filter(".active")), pagepos = Math.floor(curindex/objinherit.nummax);
			curbtn.parent().stop().animate({"scrollTop":curbtn.parent().height()*pagepos}, 600, "easeInOutCubic");
			if(v){ if(v.total && Math.floor(objinherit.$item.length/objinherit.nummax)>0){ if(objinherit.btn.area.children(".total").length==0) objinherit.btn.area.append('<span class="total"><strong class="cur">'+(pagepos+1)+'</strong> / <span class="max">'+Math.ceil(objinherit.$item.length/objinherit.nummax)+'</span></span>'); else objinherit.btn.area.find(".total .cur").text(pagepos+1); }else{ objinherit.btn.area.children(".total").remove(); }}
		},
		slider : function(v){ /* 기본값 : ui.common.slider({$obj:오브젝트, itemname:">ul.rolllist>li", view:1, direction : "left", effect : "default", numbtn : false, stepbtn : true, auto:false, loop : false, ani:true, time:3000 }); */
			v.$obj.each(function(){
				var obj = this;
				obj.$obj = $(this);
				obj.$obj.parentsUntil("#ui-contents").andSelf().addClass("js-show");
				obj.itemname = v.itemname || ">ul.rolllist>li";
				if(v.stoparea) v.stoparea = obj.$obj.parents(v.stoparea).first();
				obj.stoparea = v.stoparea || obj.$obj;
				obj.stoparea[0].obj = obj;
				obj.view = v.view || 1, obj.movstep = v.movstep || obj.view, obj.nummax = v.nummax || obj.view, obj.ishover = v.ishover || false, obj.random = v.random || false, obj.direction = v.direction || "left" /* left || top */, obj.acttype = v.acttype || "click" /* click || over */, obj.effect = v.effect || "default" /* default || alpha */, obj.movendfun = v.movendfun || false, obj.movprevfun = v.movprevfun || false;
				obj.numbtn = v.numbtn || false, obj.stepbtn = v.stepbtn || false, obj.total = v.total || false, obj.auto = obj.vauto = v.auto || false, obj.loop = v.loop || false, obj.ani = (v.ani==false?false:true), obj.time = v.time || 3000, obj.pos = {cur : 0, old : -1};
				if(obj.auto||obj.effect=="alpha"||obj.movstep!=obj.view) obj.loop = true; /* auto일 경우는 true */
				if(obj.loop&&obj.movstep>1) obj.numbtn = false; /* loop일 경우 view 1개 이상은 true */
				obj.aflag = false /* auto flag */, obj.oflag = false /* over flag */, obj.mflag = false /* move flag */;
				obj.max = 0, obj.btn = { area : false, prev : false, next : false, pagenum : false, auto : false };
				obj.$item = obj.$obj.find(obj.itemname), obj.$itemwrap=false, obj.$itemwrapclone=false;
				obj.funclear = function(objinherit){ clearTimeout(objinherit.repeat); };
				obj.funprev = function(objinherit){ objinherit.mov(objinherit, objinherit.pos.cur-1); return false; };
				obj.funnext = function(objinherit){ objinherit.mov(objinherit, objinherit.pos.cur+1); return false; };
				obj.funtoggle = function(objinherit,btn){ objinherit.funclear(objinherit); objinherit.aflag = !objinherit.aflag; if(!objinherit.aflag){ objinherit.funauto(objinherit); }; $(btn).toggleClass("play").html(function(){ return (this.innerHTML.indexOf("수동")>-1)?"슬라이드 자동":"슬라이드 수동"}); };
				obj.funstop = function(objinherit){ objinherit.funclear(objinherit); };
				obj.funplay = function(objinherit){ objinherit.funclear(objinherit); objinherit.auto(objinherit); };
				obj.funauto = function(objinherit){ objinherit.funclear(objinherit); if(!objinherit.aflag){ objinherit.funautoRepeat(objinherit); }};
				obj.funautoRepeat = function(objinherit){ objinherit.repeat = setTimeout(function(){ if(!objinherit.oflag){ objinherit.funnext(objinherit); } objinherit.funauto(objinherit); }, objinherit.time); };
				obj.stoparea.mouseover(function(){this.obj.oflag = true;}).mouseout(function(){this.obj.oflag = false;});
				obj.viewitem = function(objinherit){
					var type = (objinherit.pos.old<objinherit.pos.cur) ? "next" : "prev", itemmax = objinherit.$item.length;
					var curindex = (objinherit.pos.cur*objinherit.view)%itemmax;
					objinherit.scrollLeft = 0, objinherit.parentNode.scrollLeft = 0, objinherit.scrollTop = 0, objinherit.parentNode.scrollTop = 0;
					objinherit.$item.css({"position":"absolute","left":"9999px","top":"0","width":"0","display":"block", "overflow":"hidden"});
					objinherit.$itemwrapclone.empty();
					if(objinherit.view==1&&objinherit.effect!="alpha"){
						if(objinherit.direction=="left"){
							objinherit.$item.eq(curindex).css({"top":"0","left":(0*objinherit.size.item.w)+"px", "width":(objinherit.size.item.w<1008?objinherit.size.item.w+"px":"100%"), "height":objinherit.size.item.h+"px"});
							objinherit.$itemwrapclone.append(objinherit.$item.eq((objinherit.pos.old*objinherit.view)%itemmax).clone().css({"position":"static","left":"auto","top":"auto","display":"block","width":(objinherit.size.item.w<1008?objinherit.size.item.w+"px":"100%"),"height":objinherit.size.item.h+"px"}));
						}else{
							objinherit.$item.eq(curindex).css({"left":"0","top":(0*objinherit.size.item.h)+"px", "height":objinherit.size.item.h+"px", "width":objinherit.size.item.w+"px"});
							objinherit.$itemwrapclone.append(objinherit.$item.eq((objinherit.pos.old*objinherit.view)%itemmax).clone().css({"position":"static","left":"auto","top":"auto","display":"block","height":objinherit.size.item.h+"px","width":objinherit.size.item.w+"px"}));
						}
					}else{
						for(var i=0, old="", cur=""; i<objinherit.view ;i++){
							cur = curindex+i;
							if(type=="prev") old = curindex+i+objinherit.view;
							else old = curindex+i-objinherit.view;
							if(old>=itemmax) old = old-itemmax;
							if(old<0) old = old+itemmax;
							if(cur>=itemmax) cur = cur-itemmax;
							if(cur<0) cur = cur+itemmax;
							if(objinherit.direction=="left"){
								objinherit.$item.eq(cur).css({"top":"0","left":(i*objinherit.size.item.w)+"px", "width":(objinherit.size.item.w<1008?objinherit.size.item.w+"px":"100%"), "height":objinherit.size.item.h+"px"});
								objinherit.$itemwrapclone.append(objinherit.$item.eq(old).clone().css({"position":"static","left":"auto","top":"auto","display":"block","width":(objinherit.size.item.w<1008?objinherit.size.item.w+"px":"100%"),"height":objinherit.size.item.h+"px"}));
							}else{
								objinherit.$item.eq(cur).css({"left":"0","top":(i*objinherit.size.item.h)+"px", "height":objinherit.size.item.h+"px", "width":objinherit.size.item.w+"px"});
								objinherit.$itemwrapclone.append(objinherit.$item.eq(old).clone().css({"position":"static","left":"auto","top":"auto","display":"block","height":objinherit.size.item.h+"px","width":objinherit.size.item.w+"px"}));
							}
						};
					};
				};
				obj.btnSet = function(objinherit){
					if(objinherit.loop){
						if(objinherit.btn.prev) objinherit.btn.prev.removeClass("disabled").css({cursor:"pointer"});
						if(objinherit.btn.next) objinherit.btn.next.removeClass("disabled").css({cursor:"pointer"});
						if(objinherit.btn.pagenum) objinherit.btn.pagenum.children(".num").removeClass("active").eq((objinherit.pos.cur*objinherit.movstep)%objinherit.$item.length).addClass("active");
					}else{
						if(objinherit.btn.prev&&objinherit.pos.cur==0) objinherit.btn.prev.addClass("disabled").css({cursor:"default"});
						else if(objinherit.btn.prev) objinherit.btn.prev.removeClass("disabled").css({cursor:"pointer"});
						if(objinherit.btn.next&&objinherit.pos.cur>=objinherit.max-1) objinherit.btn.next.addClass("disabled").css({cursor:"default"});
						else if(objinherit.btn.next) objinherit.btn.next.removeClass("disabled").css({cursor:"pointer"});
						if(objinherit.btn.pagenum) objinherit.btn.pagenum.children(".num").removeClass("active").eq(objinherit.pos.cur).addClass("active");
					}
				};
				obj.mov = function(objinherit, pos, ani){
					if(objinherit.$item.length<=objinherit.view){
						if(objinherit.auto){
							objinherit.pos.cur = (pos>=objinherit.view )?objinherit.$item.length-pos:pos;
							if(objinherit.numbtn&&objinherit.btn.pagenum&&objinherit.acttype=="over") objinherit.btn.pagenum.children(".num").eq(objinherit.pos.cur).trigger("hover");
							else if(objinherit.numbtn&&objinherit.btn.pagenum) objinherit.btn.pagenum.children(".num").eq(objinherit.pos.cur).trigger("click");
							if(objinherit.movendfun&&(objinherit.pos.old!=objinherit.pos.cur)){ objinherit.movendfun(objinherit); };
						}
						return false;
					}
					if(objinherit.mflag && objinherit.acttype!="over") return false;
					if((objinherit.pos.cur*objinherit.view)%objinherit.$item.length == (pos*objinherit.view)%objinherit.$item.length && objinherit.pos.old!=-1) return false;
					if(ani!=false) ani = (!objinherit.ani ? false : true);
					if(objinherit.vauto){ objinherit.funclear(objinherit); objinherit.funauto(objinherit); };
					if(objinherit.loop && (objinherit.movstep==objinherit.view)){
						objinherit.mflag = true, objinherit.pos.old = objinherit.pos.cur, objinherit.pos.cur = pos;
						objinherit.viewitem(objinherit);
						var type = (objinherit.pos.old<objinherit.pos.cur) ? "next" : "prev";
						if(objinherit.effect=="alpha"){
							objinherit.$itemwrapclone.css({"display":"block","height":objinherit.size.item.h+"px","opacity":"1", "z-index":2}).stop().animate({"opacity":0},(ani?600:0), "easeInOutCubic", function(){ objinherit.mflag = false; this.style.zIndex = 1; objinherit.$itemwrapclone.empty(); });
							objinherit.$itemwrap.css({"height":objinherit.size.item.h+"px","opacity":"0", "z-index":1}).stop().animate({"opacity":1},(ani?600:0), "easeInOutCubic", function(){ objinherit.mflag = false; this.style.zIndex = 2; if(objinherit.movendfun&&(objinherit.pos.old!=objinherit.pos.cur)){ objinherit.movendfun(objinherit); }; });
						}else{
							if(objinherit.direction=="left"){
								objinherit.$itemwrapclone.css({"display":"block","margin-left":"0", "z-index":2}).stop().animate({"margin-left":(type=="prev"?100:-100)+"%"},(ani?600:0), "easeInOutCubic", function(){ objinherit.mflag = false; this.style.zIndex = 1; });
								objinherit.$itemwrap.css({"margin-left":(type=="prev"?-100:100)+"%", "z-index":1}).stop().animate({"margin-left":0},(ani?600:0), "easeInOutCubic", function(){ objinherit.mflag = false; this.style.zIndex = 2; if(objinherit.movendfun&&(objinherit.pos.old!=objinherit.pos.cur)){ objinherit.movendfun(objinherit); }; });
							}else{
								objinherit.$itemwrapclone.css({"display":"block","height":objinherit.size.item.h*objinherit.view+"px", "overflow":"hidden","margin-top":"0", "z-index":2}).stop().animate({"margin-top":(type=="prev"?(objinherit.size.item.h*objinherit.view):-(objinherit.size.item.h*objinherit.view))+"px"},(ani?600:0), "easeInOutCubic", function(){ objinherit.mflag = false; this.style.zIndex = 1; });
								objinherit.$itemwrap.css({"margin-top":(type=="prev"?-(objinherit.size.item.h*objinherit.view):(objinherit.size.item.h*objinherit.view))+"px", "z-index":1}).stop().animate({"margin-top":0},(ani?600:0), "easeInOutCubic", function(){ objinherit.mflag = false; this.style.zIndex = 2; if(objinherit.movendfun&&(objinherit.pos.old!=objinherit.pos.cur)){ objinherit.movendfun(objinherit); }; });
							}
						}
					}else{
						if((pos<0 || pos>objinherit.max-1) && objinherit.movstep==objinherit.view) return;
						objinherit.mflag = true, objinherit.pos.old = objinherit.pos.cur, objinherit.pos.cur = pos;
						if(objinherit.movstep!=objinherit.view){
							if(objinherit.pos.cur<0){
								objinherit.pos.cur = objinherit.$item.length+objinherit.pos.cur+1-objinherit.movstep;
								if(objinherit.direction=="left"){
								objinherit.$itemwrap.css({"left":-(objinherit.pos.cur+1)*objinherit.size.item.w});
								objinherit.$itemwrapclone.css({"left":-(objinherit.pos.cur+1)*objinherit.size.item.w});
								}else{
								objinherit.$itemwrap.css({"top":-(objinherit.pos.cur+1)*objinherit.size.item.h});
								objinherit.$itemwrapclone.css({"top":-(objinherit.pos.cur+1)*objinherit.size.item.h});
								}
							}
							if(objinherit.direction=="left"){
								objinherit.$itemwrapclone.css({"display":"block"}).animate({"left" : (objinherit.size.item.w*-objinherit.pos.cur)+"px" },(ani?600:0), "easeInOutCubic", function(){ objinherit.mflag = false; });
							}else{
								objinherit.$itemwrapclone.css({"display":"block"}).animate({"top" : (objinherit.size.item.h*-objinherit.pos.cur)+"px" },(ani?600:0), "easeInOutCubic", function(){ objinherit.mflag = false; });
							}
						}
						if(objinherit.direction=="left"){
							objinherit.$itemwrap.css({"display":"block"}).stop().animate({"left" : -(objinherit.size.item.w*objinherit.pos.cur)*objinherit.movstep+"px" },(ani?600:0), "easeInOutCubic", function(){
								if(objinherit.pos.cur>objinherit.$item.length){
									objinherit.pos.cur = (type=="next"?objinherit.$item.length+objinherit.pos.cur:objinherit.pos.cur-objinherit.$item.length);
									objinherit.$itemwrap.css({"left":objinherit.pos.cur*-objinherit.size.item.w});
									objinherit.$itemwrapclone.css({"left":objinherit.pos.cur*-objinherit.size.item.w});
								} objinherit.mflag = false;  if(objinherit.movendfun&&(objinherit.pos.old!=objinherit.pos.cur)){ objinherit.movendfun(objinherit); };
							});
						}else{
							objinherit.$itemwrap.css({"display":"block"}).stop().animate({"top" : -(objinherit.size.item.h*objinherit.pos.cur)*objinherit.movstep+"px" },(ani?600:0), "easeInOutCubic", function(){
								if(objinherit.pos.cur>objinherit.$item.length){
									objinherit.pos.cur = (type=="next"?objinherit.$item.length+objinherit.pos.cur:objinherit.pos.cur-objinherit.$item.length);
									objinherit.$itemwrap.css({"top":objinherit.pos.cur*-objinherit.size.item.h});
									objinherit.$itemwrapclone.css({"top":objinherit.pos.cur*-objinherit.size.item.h});
								} objinherit.mflag = false;  if(objinherit.movendfun&&(objinherit.pos.old!=objinherit.pos.cur)){ objinherit.movendfun(objinherit); };
							});
						};
					}
					objinherit.btnSet(objinherit);
					if(objinherit.movprevfun&&(objinherit.pos.old!=objinherit.pos.cur)){ objinherit.movprevfun(objinherit); };
					if(objinherit.total) objinherit.btn.total.cur.text(function(){ var cur=objinherit.pos.cur,max=objinherit.$item.length,val; val = max+(cur%max)+1; if(val>max) val = val%max; return val==0?max:val; }); /* 페이징 번호가 있을 경우 */
				};
				obj.reset = function(){
					var objcontainer = this;
					this.$obj.find(".js-clone").remove();
					this.$obj.find(".js-clone-front").remove();
					if(this.$item.parent().parent().is(".js-rolling-wrap")) this.$item.parent().removeClass("js-rolling-list").removeAttr("style").unwrap();
					this.$item = this.$obj.find(this.itemname);
					if(this.$item.length==0){ this.$obj.parents().andSelf().removeClass("js-show"); return; };
					this.max = Math.ceil(this.$item.length/this.movstep);
					this.size = {
						outer:{ w:(v.objsize?v.objsize.w:false) || this.$obj.outerWidth(), h:(v.objsize?v.objsize.h:false) || this.$obj.height()},
						item:{ w:(v.itemsize?v.itemsize.w:false) || this.$item.first().outerWidth(), h:(v.itemsize?v.itemsize.h:false) || this.$item.first().outerHeight() }
					};
					if(this.direction=="left") this.size.onestep = {w:this.size.item.w*this.movstep, h:this.size.item.h};
					else this.size.onestep = {w:this.size.item.w, h:this.size.item.h*this.movstep};
						var $itemobj = this;
						this.$item.each(function(){ $itemobj.size.item.h = Math.max($itemobj.size.item.h, this.offsetHeight); $itemobj.size.item.w = Math.max($itemobj.size.item.w, this.offsetWidth); });
						if(this.direction=="left") this.$item.css({"float":"left", "width":(this.size.item.w<1008?this.size.item.w+"px":"100%")});
						if(this.direction=="top") this.$item.css({"height":this.size.item.h+"px"});
						this.$item.parent().wrap('<div class="js-rolling-wrap" style="position:relative;overflow:hidden;z-index:1;"/>');
						if(this.direction=="left"){
							var istype = ((this.effect=="alpha" || this.loop)||this.movstep!=this.view);
							this.$item.parent().parent().css({"width": (this.size.item.w*this.view<1008?this.size.item.w*this.view+"px":"100%"),"height":istype ? this.size.item.h:"auto"});
						}else{
							var istype = ((this.effect=="alpha" || this.loop)||this.movstep!=this.view);
							this.$item.parent().parent().css({"width":istype ? this.size.item.w:"auto","height":(this.size.item.h*this.view)+"px"});
						}
						this.$item.parent().addClass("js-rolling-list").css({"position":"relative","left":"0","top":"0","overflow":"hidden", "width":((this.direction=="left")?(this.$item.length*this.size.item.w)+"px":"auto"), "height":((this.direction=="top")?this.$item.length*this.size.item.h+"px":"auto")});
						this.$itemwrap = this.$obj.find(".js-rolling-list");
					if(this.$item.length>this.view){
						//탭형 포커싱이 이상 작동. 2014-11-05삭제 this.$item.each(function(i){ $(this).find("a").focus(function(){ objcontainer.oflag = true; objcontainer.mov(objcontainer, Math.floor(i/objcontainer.movstep), false); }).blur(function(){ objcontainer.oflag = false; }); });
						if(this.effect=="alpha" || this.loop){
							this.$itemwrap.css({"position":"absolute", "left":"0", "z-index":1,"overflow":"visible"}).parent().append(this.$itemwrap.clone().removeClass("js-rolling-list").addClass("js-clone-front").css({"z-index":2, "display":"none"}).empty());
							this.$itemwrapclone = this.$obj.find(".js-clone-front");
							if(this.movstep==this.view){
								var itemwidth = (this.$itemwrap.parent().width()<1008?this.$itemwrap.parent().width()+"px":"100%");
								this.$itemwrap.css({"width":itemwidth, "height":this.$itemwrap.parent().height()});
								this.$itemwrapclone.css({"width":itemwidth});
								this.$item.css({"display":"none"}).each(function(i){ if(i<objcontainer.movstep) this.style.display = "block"; });
							}else{
								//this.$itemwrap.css({"width":this.$itemwrap.parent().width(), "height":this.$itemwrap.parent().height()});
								this.$itemwrapclone.append(this.$itemwrap.children().clone().removeClass("active-parent").find(".active").removeClass("active").end())
								if(this.direction=="left") this.$itemwrapclone.css({"display":"block", "margin-left":this.$itemwrap.width()+"px"});
								else this.$itemwrapclone.css({"display":"block", "margin-top":this.$itemwrap.height()+"px"});
							}
						}
					}
					if((this.numbtn || this.stepbtn || this.auto)){ /* 컨트롤 버튼이 있을 경우 */
						if(this.$obj.children(".controlarea").length==0) this.$obj.prepend('<span class="controlarea" />');
						this.btn.area = this.$obj.find(".controlarea");
					}
					if(this.vauto&&this.$item.length>1){ /* 자동 롤링일 경우 */
						if(this.btn.area.children(".auto").length==0) this.btn.area.append('<button class="ir auto stop"><i>슬라이드 수동</i></button>');
						this.btn.auto = this.btn.area.find(".auto").unbind("click").click(function(){ objcontainer.funtoggle(objcontainer, this); return false; });
						if(this.vauto){ this.funclear(this); this.funauto(this); };
					};
					if(this.$item.length>this.view){
						if(this.stepbtn){ /* 이전,다음 버튼이 있을 경우 */
							if(this.btn.area.children(".step").length==0) this.btn.area.append('<span class="step" '+(this.ishover?"style='display:none;'":"")+'><button class="ir prev disabled" style="cursor:default"><i>이전</i></button><button class="ir next disabled" style="cursor:default"><i>다음</i></button></span>');
							this.btn.prev = this.btn.area.find(".step .prev").unbind("click").click(function(){ if(!this.className.match(/disabled/)){objcontainer.funprev(objcontainer);}; return false; }), this.btn.next = this.btn.area.find(".step .next").unbind("click").click(function(){ if(!this.className.match(/disabled/)){objcontainer.funnext(objcontainer);}; return false; });
							if(this.loop && this.$item.length/this.movstep>1) this.btn.prev.removeClass("disabled");
							if(this.$item.length/this.movstep>1) this.btn.next.removeClass("disabled");
							if(this.ishover) this.$obj.mouseover(function(){this.btn.area.children(".step").show()}).mouseout(function(){this.btn.area.children(".step").hide()});
						};
						if(this.numbtn){ /* pagenum 이 있을 경우 */
							this.btn.pagenum = this.btn.area.find(".pagenum");
							if(this.btn.pagenum.children().length!=this.max){
								if(this.btn.pagenum) this.btn.pagenum.remove();
								this.btn.area.append('<span class="pagenum" />');
								for(var i=1, pagehtml=""; i<=this.max; i++) pagehtml += '<button class="ir num num'+i+(i==1?" active":"")+'"><i>'+i+'</i></button>';
								this.btn.pagenum = this.btn.area.find(".pagenum").html(pagehtml);
							}
							this.btn.pagenum.children(".num").each(function(i){
								if(objcontainer.acttype=="over") $(this).unbind("mouseover").mouseover(function(){ objcontainer.mov(objcontainer, i)});
								else $(this).unbind("click").click(function(){ objcontainer.mov(objcontainer, i); return false;});
							});
						};
						if(this.total){ /* 페이징 번호가 있을 경우 */
							if(this.btn.area.children(".total").length==0) this.btn.area.append('<span class="total"><strong class="cur">0</strong> / <span class="max">0</span></span>');
							this.btn.total = {"cur":this.btn.area.children(".total").children(".cur"), "max": this.btn.area.children(".total").children(".max")};
							this.btn.total.cur.text(1);
							this.btn.total.max.text(this.max);
						};
					}
					if(this.$item.filter(".active").length>0||this.$item.children(".active").length>0){
						var idxcur = (this.$item.children(".active").length>0) ? this.$item.index(this.$item.children(".active").parents(this.$item)) : this.$item.index(this.$item.filter(".active"));
						this.pos.cur = Math.floor(idxcur/this.view);
					}else{
						var idxcur = !this.random ? 0 :Math.floor(Math.random() * this.$item.length);
						this.pos.cur = Math.floor(idxcur/this.view);
					}
					this.pos.old = -1;
					this.mov(this, this.pos.cur, false);
					if(this.movendfun&&idxcur!=this.pos.cur) this.$item.eq(idxcur).find("a").first().click();
					this.$obj.parents().andSelf().removeClass("js-show");
				};
				if(obj.movendfun&&(obj.pos.old!=obj.pos.cur)&&obj.$obj.find(".active").length==0){ obj.movendfun(obj); };
				obj.reset();
			});
		},
		idobjreturn : function(url, type, a){
			var returnobj = null; type = type || false;
			if(type=="class"){
				returnobj = url.match(/matchobj\-([\-|a-z|A-Z|0-9]*)/);
				if(returnobj&&returnobj.length>1) returnobj = $("#"+returnobj[1]);
				if(returnobj&&returnobj.length>0) return returnobj;
			}
			if(!type || !returnobj){
				if(url.split("#").length>1) returnobj = $("#"+url.split("#")[1]).length>0 ? $("#"+url.split("#")[1]) : false;
				if(returnobj&&returnobj.length>0) return returnobj; else return false;
			}
		},
		counttime : {
			timeformat : function($obj){
				var obj = $obj[0];
				var day		= parseInt(obj.seconds/86400).toString();				// 남은 시간 '일'
				var hour 	= parseInt((obj.seconds%86400)/3600).toString();		// 남은시간 '시간'
				var min 	= parseInt(((obj.seconds%86400)%3600)/60).toString();	// 남은 시간 '분'
				var sec 	= parseInt(((obj.seconds%86400)%3600)%60).toString();	// 남은 시간 '초'
				var rday1 	= day.length == 2 ? day.substring(0,1):'0';		// 십의 자리 남은 '일자'
				var rday2 	= day.length == 2 ? day.substring(1,2):day;		// 일의 자리 남은 '일자'
				var rhour1 	= hour.length == 2 ? hour.substring(0,1):'0';	// 십의 자리 남은 '시간'
				var rhour2 	= hour.length == 2 ? hour.substring(1,2):hour;	// 일의 자리 남은 '시간'
				var rmin1 	= min.length == 2 ? min.substring(0,1):'0';		// 십의 자리 남은 '분'
				var rmin2 	= min.length == 2 ? min.substring(1,2):min;		// 일의 자리 남은 '분'
				var rsec1 	= sec.length == 2 ? sec.substring(0,1):'0';		// 십의 자리 남은 '초'
				var rsec2 	= sec.length == 2 ? sec.substring(1,2):sec;		// 일의 자리 남은 '초'
				$obj.find(".day").html(rday2);
				$obj.find(".hour1").html(rhour1);
				$obj.find(".hour2").html(rhour2);
				$obj.find(".min1").html(rmin1);
				$obj.find(".min2").html(rmin2);
				$obj.find(".sec1").html(rsec1);
				$obj.find(".sec2").html(rsec2);
			//	2015-12-17 SSO 개발자 추가 시작
			},endTime : function(){
				$("#count-time").hide();
				$("#resultText").show();
				$("#resultText").html("인증번호 유효시간이 지났습니다.");
			// 2015-12-17 SSO 개발자 추가 끝
			},
			repeat : function($obj){
				var obj = $obj[0];
				if(obj.seconds!=0) {
					obj.seconds = obj.seconds -1;
					ui.common.counttime.timeformat($obj); // 남은 시간 구하기 포멧1 함수 호출
				} else {
					clearTimeout(timer);
					ui.common.counttime.endTime(); // 2015-12-17 SSO개발자추가
				}
			},
			set : function($obj, seconds){ $obj[0].seconds = seconds; timer = setInterval(function(){ ui.common.counttime.repeat($obj) }, 1000); }
		},
		placeholder : function(place){
			place = place || document.querySelectorAll('.placeholder');
			for(jj in place){
				if(Number(jj)||Number(jj)===0){
					place[jj].onfocus = function(){ if(!this.readOnly) $(this).removeClass("placeholder"); }
					place[jj].onblur = function(){ if(!this.value) $(this).addClass("placeholder"); }
					place[jj].reset = function(){ if(this.value) $(this).removeClass("placeholder"); else $(this).addClass("placeholder"); }; place[jj].reset();
				}
			}
		},
		tooltip : function(){
			var hidecss = {"position":"fixed", "left":"0", "top":"-9999px", "display":"block"};
			var hidden = function(){ try{ this.btn.isFlag = false; this.btn.$matchcont.css(hidecss); }catch(e){} };
			var view = function(e){
				try{ if(!this.btn){$(this).each(set);}; this.matchcont.btn = this.btn; var $this = $(this.btn), offset = { btn : $this.offset(), box : this.btn.$body.offset() };
				var elm = (e.srcElement||e.target).nodeName.toLowerCase()=="span"?(e.srcElement||e.target).parentNode:(e.srcElement||e.target);
				if(e.type=="mouseover"&&elm==this.btn&&!this.btn.isFlag&&this.isActType) return false;
				this.btn.isFlag = true;
				var boxwidth = this.btn.$body.width();
				var curY = (offset.btn.top-offset.box.top+(this.btn.offsetHeight+2)), curX = (offset.btn.left-offset.box.left);
				var max = boxwidth-parseFloat(this.btn.$matchcont.width());
				if($this.innerWidth() > this.btn.$matchcont.innerWidth()) curX = curX+(($this.innerWidth()-this.btn.$matchcont.innerWidth())/2);
				if(curX > max) curX = curX-(this.btn.$matchcont.width()-this.btn.offsetWidth);
				if(curX<0) curX = 0;
				this.btn.$matchcont.css({"position":"absolute", "left":curX, "top":curY+(this.btn.$body.is(".wing-cont")?this.btn.$body[0].scrollTop:0), "z-index":999999}); }catch(e){};
				return false;
			};
			var set = function(){
				this.$matchcont=false, this.isFlag = false, this.isActType = this.className.match(/act-click/);
				var classtype = (this.className.match(/(cname-)([A-Za-z0-9\-\_]*)/));
				if(classtype) this.$matchcont = $(this).parents().find(">."+classtype[2]).first();
				else this.$matchcont = false;
				if(!this.$matchcont||this.$matchcont.length==0) this.$matchcont=false;
				else this.$matchcont[0].btn = $(this);
				this.plus = parseFloat($(this).css("margin-left")) || 0;
				if(this.$matchcont){
					this.$matchcont.css(hidecss).prepend(function(){return $(this).find(".js-fake").length==0?"<span class='js-fake' style='position:absolute; top:-7px; left:0; width:100%; height:7px; display:block;' />":""});
					this.$body = $("#ui-contents") || $(".pop-contents");
					if($(this).parents("#ui-aside-ad, #ui-com-category .cat-view, .sch-layer").length>0) this.$body = $(this).parents("#ui-aside-ad, #ui-com-category .cat-view, .sch-layer, #ui-aside-wing .wing-cont");
					if(this.$body.length==0) this.$body = $("body");
					this.$body.append(this.$matchcont);
					this.matchcont=this.$matchcont[0];
					this.btn = this.matchcont.btn = this, this.matchcont.matchcont = this.matchcont;
					this.$matchcont.find(".close-act, .tip-close, .btn-close").click(function(){ $('.tooltip').trigger('mouseout');return false; });
					this.$matchcont.each(function(){ if(!this.hides) this.hides = function(){$(this).trigger('mouseout');} }); /* 툴팁 닫히는 함수 ex) DomObj.hides() */
				}
				var clickfun = function(){ if(this.nodeName.toLowerCase().indexOf("button")<0&&this.nodeName.toLowerCase().indexOf("a")<0) return; if(this.nodeName.toLowerCase().indexOf("a")>-1) return; else return false; };
				if(this.isActType) $(this).on("click", view);
				else $(this).on("click",clickfun);
			}
			//$(".tooltip").each(set);
			$("body").on( "mouseover",".tooltip,.tip-wrap", view).on("mouseout",".tooltip,.tip-wrap", hidden);
		},
		msg : function(btn, code, w, pos){
			w = w || "auto", pos = pos || "top", containwrap = document.querySelectorAll('#ui-contents, .pop-wrap');
			var obj = containwrap.length>0 ? containwrap[0] : document.getElementsByTagName("body")[0], $obj = $(obj);
			var hidecss = {"position":"fixed", "left":"0", "top":"-9999px", "width":w, "display":"block", "z-index":"99999"};
			var msgbox = document.createElement('div'); msgbox.className = "tip-wrap ui-clickmsg-js"; msgbox.innerHTML='<div class="tip" style="padding-bottom:9px;">'+code+'</div>'
			with (msgbox){ style.position = "fixed"; style.left = "0"; style.top = "-9999px"; style.width = w; style.display = "block"; style.zIndex = "99999" };
			obj.appendChild(msgbox);
			var op = {btn:ui.common.offset(btn),obj:ui.common.offset(obj)}
			var os = {btn:{w:btn.offsetWidth,h:btn.offsetHeight},obj:{w:obj.offsetWidth,h:obj.offsetHeight},box:{w:msgbox.offsetWidth,h:msgbox.offsetHeight}}
			with (msgbox){
				style.left = Math.min((op.btn.left-((os.box.w-os.btn.w)/2)-op.obj.left),op.obj.left+os.obj.w-os.box.w)+"px";
				style.top = (pos=="top"?Math.min(op.btn.top+os.btn.h+5-op.obj.top,op.obj.top+os.obj.h-os.box.h):op.btn.top-(os.box.h+5+op.obj.top))+"px";
				style.position = "absolute";
			};
			$(msgbox).delay(800).animate({"opacity":0}, 500, function(){ $(this).remove(); });
		},
		fakesc : function(obj){ $(obj).each(function(){ this.fscroll = fakescroll.set(this, { scrollsize:50, scrollsizefix:2, barsize:80, blockparentscroll:true, x:{disable:true} }); }); },
		fakescPos : function(obj){
			var posObj = ui.common.idobjreturn(obj.href);
			var scObj = posObj.parents(".fake-scroll").first();
			var targetpos = (posObj.position().top);
			scObj[0].fscroll.scrollTop(targetpos);
		},
		killevent : function(e, withpreventdefault){
			if(!e) e = window.event;
			if(e.stopPropagation){
				e.stopPropagation(); if(withpreventdefault && e.preventDefault) e.preventDefault();
			}
			e.cancelBubble=true, e.returnValue=false;
			return false;
		},
		dimmed : {
			view : function(){ var $obj = $("#ui-wrap").length>0 ? $("#ui-wrap") : $("body"); $obj.prepend('<span class="modal-bg" style="z-index:110000"></span>'); $("body")[0].onmousewheel=function(e){if($(".modal-bg").length==0) return;if(!e) e = window.event;ui.common.killevent(e, true);} }
			, hidden : function($obj){ if($obj){$obj.hide();} $(".modal-bg").remove(); }
		},
		set : function(){
			ui.common.placeholder(); //placeholder
			ui.common.tooltip(); //툴팁
			if(document.getElementsByTagName('select').length>0 && !$('#ui-content.join2').length) $('select').fakeselect(); //셀렉트 디자인 // 2017-08-14 : 수정(조건문 추가)
			if(document.querySelectorAll('.fake-scroll').length>0) $('.fake-scroll').each(function(){ if(!this.fscroll){ui.common.fakesc(this);} }); //스크롤바 디자인
			if(document.querySelectorAll('.fake-radio, .fake-check, .fake-file').length>0) ui.common.inputDesign(document.querySelectorAll('.fake-radio, .fake-check, .fake-file')); //radio, checkbox, file 디자인
			try{ if(document.querySelectorAll('.calendar-form').length>0) if(calendar) calendar.init(); }catch(e){}; //mini 달력
		}
	},
	popup : {
		body : null, clear : null, isresize : true,
		open : function(name, url, width, height, scroll, pos){
			scroll = scroll || false;
			scroll = (eval(scroll))?'yes':'no';
			pos = (!pos || (typeof pos != "object"))?{}:pos;
			pos.left = pos.left || "auto", pos.top = pos.top || "auto"
			if(scroll=="yes") width = eval(width)+17;
			window.open(url, name, ('width='+width+', height='+height+', toolbar=no, menubar=no, location=no, scrollbars='+scroll+', status=no, resizable=no, left='+pos.left+', top='+pos.top));
		},
		blank : function(url){ window.open(url); },
		close : function(){ self.close(); return false; },
		layer : function(btn, obj, type, pos){
			type = type || "case99", pos = pos || {}, pos.left = pos.left || false, pos.top = pos.top || false, pos.zindex = pos.zindex || (type=="case2"?110001:99999);
			if(!btn&&type=="case99") type = "case1";
			var L, T, hidecss = {"position":"fixed", "left":"0", "top":"-9999px", "display":"block", "z-index":pos.zindex}, wrap = ((type=="case2" || type=="case3" || type=="case0") ? document.getElementById("ui-wrap"):document.getElementById("ui-contents")) || document.getElementsByTagName("body")[0];
			if(!(type=="case1" || type=="case2" || type=="case3" || type=="case0")&&obj.parents("#ui-aside-wing, #ui-com-category .cat-view").length>0) wrap = obj.parents(".wing-cont, #ui-com-category .cat-view")[0];

			$(wrap).append(obj.css(hidecss)).find(".tip-wrap, .layer-wrap").css(btn?hidecss:'');
			var reset = function(){
				var $btn = $(btn), $wrap = $(wrap), ws = [wrap.offsetWidth, obj.innerWidth(), 0], hs = [wrap.offsetHeight, obj.innerHeight(), 0], ofts = [$wrap.offset(), obj.offset(), {top:0,left:0}];
				if(type=="case1" || type=="case2" || type=="case3" || type=="case0"){
					L = pos.left?pos.left:((document.documentElement.clientWidth-ws[1])/2);
					T = pos.top?pos.top:((document.documentElement.clientHeight-hs[1])/2);
				}else{
					if($btn.get(0).nodeType&&$btn.length>0&&!$btn.is(document,window)) ws[2] = $btn.innerWidth(), hs[2] = $btn.innerHeight(), ofts[2] = $btn.offset();
					var max = ws[0]-ws[1], base = (ofts[2].left-ofts[0].left);
					if(ws[2] > ws[1]) base = base+((ws[2]-ws[1])/2);
					if(max<base) L = base-(ws[1]-ws[2]); else L = base;
					if(L<0) L=0;
					T = pos.top?(pos.top=="bottom"?((ofts[2].top-ofts[0].top)-(obj.height()+5)):pos.top):(ofts[2].top-ofts[0].top)+hs[2]+5;
					if(wrap.className.match(/wing\-cont/)) T = T+wrap.scrollTop;
				}
				obj.css({"left":L+"px","top":T+"px"});
			}
			obj.each(function(){
				var $thisobj=$(this); wrap.appendChild(this);
				$thisobj.find(".close-act, .tip-close, .btn-close").click(function(){ $(document.documentElement).trigger("click"); $thisobj.hide(); ui.common.dimmed.hidden(); return false; });
				if(!this.hides){ this.hides = function(){ $(this).hide(); ui.common.dimmed.hidden(); } }
				if(!this.reset) this.reset = function(){reset();};
				reset();
				$thisobj.removeClass("js-colhidefix").removeClass("js-colhide").css({"position":(type=="case1" || type=="case2" || type=="case3") ? "fixed" : "absolute"});
				if(type=="case2") ui.common.dimmed.view();
			});
		},
		resize : function(h, w){
			var target, targetW;
			var maxH = (this.body.offsetHeight > screen.height-100) ? screen.height-100 : this.body.offsetHeight;
			var maxW = screen.width-100;
			if(w) targetW = (w-document.documentElement.clientWidth);
			else targetW = this.body.offsetWidth>maxW ? maxW-this.body.offsetWidth : 0;
			if(h) target = (h-document.documentElement.clientHeight);
			else target = (maxH-(document.documentElement.clientHeight));
			resizeBy(targetW,target);
			if(this.isresize) this.clear = setTimeout(function(){ui.popup.resize(h);},500);
			this.isresize = false;
		},
		set : function(h,w){
			h = h || false, w = w || false;
			this.body = document.querySelectorAll(".pop-wrap");
			if(this.body.length==0) this.body = (document.body.childNodes[0].nodeType==1)?document.body.childNodes[0]:document.body.childNodes[1];
			else this.body = this.body[0];
			clearTimeout(this.clear);
			this.clear = setTimeout(function(){ui.popup.resize(h, w);},300);
			ui.common.set(); //팝업, 바닥 공통 실행
		}
	},
	page : {
		$contain : null,
		set : function(){
			if(ui.common.user("ie").is){ document.getElementsByTagName("body")[0].className = "ie"+ui.common.user("ie").version; }
			this.$contain = document.getElementById("ui-contents") ? $("#ui-contents") : null;
			ui.common.set(); //팝업, 바닥 공통 실행
		}
	}
	
	/* 2020-09-16 : 추가 */
	/*iframe 높이 설정*/
	,setFrameSizeTerms : function(){
		document.getElementsByTagName('html')[0].className += ' none-body-scroll';
		const init = function () {
			const $wrap = document.querySelector('.frame-terms');
			const $frame = $wrap.getElementsByTagName('iframe')[0];
			const topHeight = document.getElementById('ui-header').offsetHeight;
			const bottomHeight = document.querySelector('.btn-fixed-bottom').offsetHeight;
			const titHeight = $wrap.getElementsByTagName('h1')[0].offsetHeight;
			$frame.style.height = (window.innerHeight-topHeight-bottomHeight-titHeight)+'px';
		}
		window.addEventListener('resize',init);
		window.addEventListener('load',init);
		setTimeout(init,500);
		init();
	}
	/* //2020-09-16 : 추가 */
}

/* 2020-09-25 : 추가 */
/***********************************************
* FAQ스타일
************************************************/
;(function($){
	function Faq(element, _options){
		var that = this;

		this.options  = _options;
		this.$element = $(element);

		this.$btns = this.$element.find('[data-roll="faq"]'),
		this.$layers;
		this.oldActive;

		// faq 관련 레이어 수집
		this.$layers = $.map(this.$btns, function(n){ return that._getLayer(n)[0]; });
		this.$layers = $(this.$layers);

		// initialize
		this.$layers.hide();
		this.$element.on("click", '[data-roll="faq"]', $.proxy(this._onChange, this));

		this.$btns.each(function(){
			if($(this).hasClass("open")){ that.open(this, 0); }
		});
	}

	Faq.prototype._onChange = function(e){
		var that = e.currentTarget,
			$targetLayer = this._getLayer(that);

		e.preventDefault();

		if(!this.options.headingRel){
			$targetLayer.is(":visible") ? this.close(that) : this.open(that);

		}else{
			if(this.oldActive === that){
				this.close(that);
				this.oldActive = null;
				return;
			}
			this.oldActive && this.close(this.oldActive);
			this.open(that);
		}

	}

	Faq.prototype.open = function(btn, speed){
		var $targetLayer = this._getLayer(btn);
		$targetLayer.data("ui.faq.btn", btn);

		$(btn).addClass("open");
		$targetLayer.stop(true).slideDown(speed !== undefined ? speed : "fast", function(){ $(this).addClass("open"); });
		this.oldActive=btn;
		if(this.options.open) this.options.open.call(btn);
	}

	Faq.prototype.close = function(btn){
		var $targetLayer = this._getLayer(btn);

		$(btn).removeClass("open");
		$targetLayer.stop(true).slideUp("fast", function(){ $(this).removeClass("open"); });
		if(this.options.close) options.close.call(btn);
	}

	Faq.prototype._getLayer = function(btn){
		var href = $(btn).attr("data-href") || $(btn).attr("href");
			return href==="next" ? $(btn).next() : $(href);
	}

	Faq.DEFAULTS = {headingRel : true};

	$.fn.faq = function(_options){
		var arg = Array.prototype.slice.call(arguments, 1);

		return this.each(function(){
			var $this   = $(this),
				data    = $this.data('ui.faq'),
				options = $.extend({}, Faq.DEFAULTS, $this.data(), typeof _options == 'object' && _options);

			if(!data) $this.data('ui.faq', (data = new Faq(this, options)));
			if(typeof _options == 'string') data[_options].apply(data, arg);
		});
	};

	// HTML DATA-API
	$(document).on('click', '[data-roll="faq-close"]', function(e){
		var that  = $(e.currentTarget),
			$this = $(that),
			data  = $this.data(),
			href  = $this.attr("data-href") || $this.attr("href"),
			btn, $self;

			if( href === "parent" ){
				$self = $this.parent();
				while( $self[0].nodeName.toLowerCase()!=="html" && !$self.is('[data-roll="faq-layer"]') ){
					$self = $self.parent();
				}

				btn = $self.data("ui.faq.btn");
				console.log( btn );
				btn && $(btn).trigger('click');
			}
			href.indexOf("#")!==-1 && $(href).trigger('click');
			e.preventDefault();
	});

	$(function(){
		$('[data-rel="faq"]').each(function(){ $(this).faq(); });
	});
})($);
/* //2020-09-25 : 추가 */

/* 2017-05-30 추가 */
$(function($){
	ui.initialize();
});

;(function(){
    ui.checkUagent();
})();