!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof module&&module.exports?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n)}:e(window.jQuery)}(function(e){e.extend(e.FE.DEFAULTS,{lineBreakerTags:["table","hr","form","dl","span.fr-video",".fr-embedly"],lineBreakerOffset:15,lineBreakerHorizontalOffset:10}),e.FE.PLUGINS.lineBreaker=function(t){function n(n,r){var a,o,i,s,f,l,p,u;if(null==n)s=r.parent(),f=s.offset().top,p=r.offset().top,a=p-Math.min((p-f)/2,t.opts.lineBreakerOffset),i=s.outerWidth(),o=s.offset().left;else if(null==r)s=n.parent(),l=s.offset().top+s.outerHeight(),(u=n.offset().top+n.outerHeight())>l&&(s=e(s).parent(),l=s.offset().top+s.outerHeight()),a=u+Math.min(Math.abs(l-u)/2,t.opts.lineBreakerOffset),i=s.outerWidth(),o=s.offset().left;else{s=n.parent();var d=n.offset().top+n.height(),g=r.offset().top;if(d>g)return!1;a=(d+g)/2,i=s.outerWidth(),o=s.offset().left}t.opts.iframe&&(o+=t.$iframe.offset().left-t.helpers.scrollLeft(),a+=t.$iframe.offset().top-t.helpers.scrollTop()),t.$box.append(b),b.css("top",a-t.win.pageYOffset),b.css("left",o-t.win.pageXOffset),b.css("width",i),b.data("tag1",n),b.data("tag2",r),b.addClass("fr-visible").data("instance",t)}function r(e,r){var o,i,s=e.offset().top,f=e.offset().top+e.outerHeight();if(Math.abs(f-r)<=t.opts.lineBreakerOffset||Math.abs(r-s)<=t.opts.lineBreakerOffset)if(Math.abs(f-r)<Math.abs(r-s)){for(var l=(i=e.get(0)).nextSibling;l&&l.nodeType==Node.TEXT_NODE&&0===l.textContent.length;)l=l.nextSibling;if(!l)return n(e,null),!0;if(o=a(l))return n(e,o),!0}else{if(!(i=e.get(0)).previousSibling)return n(null,e),!0;if(o=a(i.previousSibling))return n(o,e),!0}b.removeClass("fr-visible").removeData("instance")}function a(n){if(n){var r=e(n);if(0===t.$el.find(r).length)return null;if(n.nodeType!=Node.TEXT_NODE&&r.is(t.opts.lineBreakerTags.join(",")))return r;if(r.parents(t.opts.lineBreakerTags.join(",")).length>0)return n=r.parents(t.opts.lineBreakerTags.join(",")).get(0),0!==t.$el.find(n).length&&e(n).is(t.opts.lineBreakerTags.join(","))?e(n):null}return null}function o(e){if("undefined"!=typeof e.inFroalaWrapper)return e.inFroalaWrapper;for(var n=e;e.parentNode&&e.parentNode!==t.$wp.get(0);)e=e.parentNode;return n.inFroalaWrapper=e.parentNode==t.$wp.get(0),n.inFroalaWrapper}function i(e,n){var r=t.doc.elementFromPoint(e,n);return r&&!r.closest(".fr-line-breaker")&&!t.node.isElement(r)&&r!=t.$wp.get(0)&&o(r)?r:null}function s(e,n,r){for(var a=r,o=null;a<=t.opts.lineBreakerOffset&&!o;)(o=i(e,n-a))||(o=i(e,n+a)),a+=r;return o}function f(e,n,r){for(var a=null,o=100;!a&&e>t.$box.offset().left&&e<t.$box.offset().left+t.$box.outerWidth()&&o>0;)(a=i(e,n))||(a=s(e,n,5)),"left"==r?e-=t.opts.lineBreakerHorizontalOffset:e+=t.opts.lineBreakerHorizontalOffset,o-=t.opts.lineBreakerHorizontalOffset;return a}function l(e){w=null;var n=null,o=null,i=t.doc.elementFromPoint(e.pageX-t.win.pageXOffset,e.pageY-t.win.pageYOffset);i&&("HTML"==i.tagName||"BODY"==i.tagName||t.node.isElement(i)||(i.getAttribute("class")||"").indexOf("fr-line-breaker")>=0)?((o=s(e.pageX-t.win.pageXOffset,e.pageY-t.win.pageYOffset,1))||(o=f(e.pageX-t.win.pageXOffset-t.opts.lineBreakerHorizontalOffset,e.pageY-t.win.pageYOffset,"left")),o||(o=f(e.pageX-t.win.pageXOffset+t.opts.lineBreakerHorizontalOffset,e.pageY-t.win.pageYOffset,"right")),n=a(o)):n=a(i),n?r(n,e.pageY):t.core.sameInstance(b)&&b.removeClass("fr-visible").removeData("instance")}function p(e){return!(b.hasClass("fr-visible")&&!t.core.sameInstance(b))&&(t.popups.areVisible()||t.el.querySelector(".fr-selected-cell")?(b.removeClass("fr-visible"),!0):void(!1!==h||t.edit.isDisabled()||(w&&clearTimeout(w),w=setTimeout(l,30,e))))}function u(){w&&clearTimeout(w),b.hasClass("fr-visible")&&b.removeClass("fr-visible").removeData("instance")}function d(){h=!0,u()}function g(){h=!1}function v(n){n.preventDefault();var r=b.data("instance")||t;b.removeClass("fr-visible").removeData("instance");var a=b.data("tag1"),o=b.data("tag2"),i=t.html.defaultTag();null==a?i&&"TD"!=o.parent().get(0).tagName&&0===o.parents(i).length?o.before("<"+i+">"+e.FE.MARKERS+"<br></"+i+">"):o.before(e.FE.MARKERS+"<br>"):i&&"TD"!=a.parent().get(0).tagName&&0===a.parents(i).length?a.after("<"+i+">"+e.FE.MARKERS+"<br></"+i+">"):a.after(e.FE.MARKERS+"<br>"),r.selection.restore()}function c(){t.shared.$line_breaker||(t.shared.$line_breaker=e('<div class="fr-line-breaker"><a class="fr-floating-btn" role="button" tabIndex="-1" title="'+t.language.translate("Break")+'"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect x="21" y="11" width="2" height="8"/><rect x="14" y="17" width="7" height="2"/><path d="M14.000,14.000 L14.000,22.013 L9.000,18.031 L14.000,14.000 Z"/></svg></a></div>')),b=t.shared.$line_breaker,t.events.on("shared.destroy",function(){b.html("").removeData().remove(),b=null},!0),t.events.on("destroy",function(){b.removeData("instance").removeClass("fr-visible").appendTo("body:first"),clearTimeout(w)},!0),t.events.$on(b,"mousemove",function(e){e.stopPropagation()},!0),t.events.bindClick(b,"a",v)}function m(){return!!t.$wp&&(c(),h=!1,t.events.$on(t.$win,"mousemove",p),t.events.$on(e(t.win),"scroll",u),t.events.on("popups.show.table.edit",u),t.events.on("commands.after",u),t.events.$on(e(t.win),"mousedown",d),void t.events.$on(e(t.win),"mouseup",g))}var b,h,w;return{_init:m}}});