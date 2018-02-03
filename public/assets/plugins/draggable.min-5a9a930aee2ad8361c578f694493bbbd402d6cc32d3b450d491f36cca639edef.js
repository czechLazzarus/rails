!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof module&&module.exports?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n)}:e(window.jQuery)}(function(e){e.extend(e.FE.DEFAULTS,{dragInline:!0}),e.FE.PLUGINS.draggable=function(t){function n(n){return!(!n.originalEvent||!n.originalEvent.target||n.originalEvent.target.nodeType!=Node.TEXT_NODE)||(n.target&&"A"==n.target.tagName&&1==n.target.childNodes.length&&"IMG"==n.target.childNodes[0].tagName&&(n.target=n.target.childNodes[0]),e(n.target).hasClass("fr-draggable")?(t.undo.canDo()||t.undo.saveStep(),t.opts.dragInline?t.$el.attr("contenteditable",!0):t.$el.attr("contenteditable",!1),t.opts.toolbarInline&&t.toolbar.hide(),e(n.target).addClass("fr-dragging"),t.browser.msie||t.browser.edge||t.selection.clear(),void n.originalEvent.dataTransfer.setData("text","Froala")):(n.preventDefault(),!1))}function r(e){return!(e&&("HTML"==e.tagName||"BODY"==e.tagName||t.node.isElement(e)))}function a(e,n,r){t.opts.iframe&&(e+=t.$iframe.offset().top,n+=t.$iframe.offset().left),v.offset().top!=e&&v.css("top",e),v.offset().left!=n&&v.css("left",n),v.width()!=r&&v.css("width",r)}function o(n){var o=t.doc.elementFromPoint(n.originalEvent.pageX-t.win.pageXOffset,n.originalEvent.pageY-t.win.pageYOffset);if(!r(o)){for(var i=0,l=o;!r(l)&&l==o&&n.originalEvent.pageY-t.win.pageYOffset-i>0;)i++,l=t.doc.elementFromPoint(n.originalEvent.pageX-t.win.pageXOffset,n.originalEvent.pageY-t.win.pageYOffset-i);(!r(l)||v&&0===t.$el.find(l).length&&l!=v.get(0))&&(l=null);for(var s=0,f=o;!r(f)&&f==o&&n.originalEvent.pageY-t.win.pageYOffset+s<e(t.doc).height();)s++,f=t.doc.elementFromPoint(n.originalEvent.pageX-t.win.pageXOffset,n.originalEvent.pageY-t.win.pageYOffset+s);(!r(f)||v&&0===t.$el.find(f).length&&f!=v.get(0))&&(f=null),o=null==f&&l?l:f&&null==l?f:f&&l?s>i?l:f:null}if(e(o).hasClass("fr-drag-helper"))return!1;if(o&&!t.node.isBlock(o)&&(o=t.node.blockParent(o)),o&&["TD","TH","TR","THEAD","TBODY"].indexOf(o.tagName)>=0&&(o=e(o).parents("table").get(0)),o&&["LI"].indexOf(o.tagName)>=0&&(o=e(o).parents("UL, OL").get(0)),o&&!e(o).hasClass("fr-drag-helper")){v||(e.FE.$draggable_helper||(e.FE.$draggable_helper=e('<div class="fr-drag-helper"></div>')),v=e.FE.$draggable_helper,t.events.on("shared.destroy",function(){v.html("").removeData().remove(),v=null},!0));var g;g=n.originalEvent.pageY<e(o).offset().top+e(o).outerHeight()/2;var d=e(o),p=0;g||0!==d.next().length?(g||(d=d.next()),"before"==v.data("fr-position")&&d.is(v.data("fr-tag"))||(d.prev().length>0&&(p=parseFloat(d.prev().css("margin-bottom"))||0),p=Math.max(p,parseFloat(d.css("margin-top"))||0),a(d.offset().top-p/2-t.$box.offset().top,d.offset().left-t.win.pageXOffset-t.$box.offset().left,d.width()),v.data("fr-position","before"))):"after"==v.data("fr-position")&&d.is(v.data("fr-tag"))||(p=parseFloat(d.css("margin-bottom"))||0,a(d.offset().top+e(o).height()+p/2-t.$box.offset().top,d.offset().left-t.win.pageXOffset-t.$box.offset().left,d.width()),v.data("fr-position","after")),v.data("fr-tag",d),v.addClass("fr-visible"),v.appendTo(t.$box)}else v&&t.$box.find(v).length>0&&v.removeClass("fr-visible")}function i(e){e.originalEvent.dataTransfer.dropEffect="move",t.opts.dragInline?f()||!t.browser.msie&&!t.browser.edge||e.preventDefault():(e.preventDefault(),o(e))}function l(e){e.originalEvent.dataTransfer.dropEffect="move",t.opts.dragInline||e.preventDefault()}function s(e){t.$el.attr("contenteditable",!0);var n=t.$el.find(".fr-dragging");v&&v.hasClass("fr-visible")&&t.$box.find(v).length?g(e):n.length&&(e.preventDefault(),e.stopPropagation()),v&&t.$box.find(v).length&&v.removeClass("fr-visible"),n.removeClass("fr-dragging")}function f(){for(var t=null,n=0;n<e.FE.INSTANCES.length;n++)if((t=e.FE.INSTANCES[n].$el.find(".fr-dragging")).length)return t.get(0)}function g(n){for(var r,a,o=0;o<e.FE.INSTANCES.length;o++)if((r=e.FE.INSTANCES[o].$el.find(".fr-dragging")).length){a=e.FE.INSTANCES[o];break}if(r.length){if(n.preventDefault(),n.stopPropagation(),v&&v.hasClass("fr-visible")&&t.$box.find(v).length)v.data("fr-tag")[v.data("fr-position")]('<span class="fr-marker"></span>'),v.removeClass("fr-visible");else{if(!1===t.markers.insertAtPoint(n.originalEvent))return!1}if(r.removeClass("fr-dragging"),!1===(r=t.events.chainTrigger("element.beforeDrop",r)))return!1;var i=r;if(r.parent().is("A")&&(i=r.parent()),t.core.isEmpty())t.events.focus();else{t.$el.find(".fr-marker").replaceWith(e.FE.MARKERS),t.selection.restore()}if(a==t||t.undo.canDo()||t.undo.saveStep(),t.core.isEmpty())t.$el.html(i);else{var l=t.markers.insert();0===i.find(l).length?e(l).replaceWith(i):e(l).replaceWith(r),r.after(e.FE.MARKERS),t.selection.restore()}return t.popups.hideAll(),t.selection.save(),t.$el.find(t.html.emptyBlockTagsQuery()).not("TD, TH, LI, .fr-inner").remove(),t.html.wrap(),t.html.fillEmptyBlocks(),t.selection.restore(),t.undo.saveStep(),t.opts.iframe&&t.size.syncIframe(),a!=t&&(a.popups.hideAll(),a.$el.find(a.html.emptyBlockTagsQuery()).not("TD, TH, LI, .fr-inner").remove(),a.html.wrap(),a.html.fillEmptyBlocks(),a.undo.saveStep(),a.events.trigger("element.dropped"),a.opts.iframe&&a.size.syncIframe()),t.events.trigger("element.dropped",[i]),!1}v&&v.removeClass("fr-visible"),t.undo.canDo()||t.undo.saveStep(),setTimeout(function(){t.undo.saveStep()},0)}function d(e){if(e&&"DIV"==e.tagName&&t.node.hasClass(e,"fr-drag-helper"))e.parentNode.removeChild(e);else if(e&&e.nodeType==Node.ELEMENT_NODE)for(var n=e.querySelectorAll("div.fr-drag-helper"),r=0;r<n.length;r++)n[r].parentNode.removeChild(n[r])}function p(){t.opts.enter==e.FE.ENTER_BR&&(t.opts.dragInline=!0),t.events.on("dragstart",n,!0),t.events.on("dragover",i,!0),t.events.on("dragenter",l,!0),t.events.on("document.dragend",s,!0),t.events.on("document.drop",s,!0),t.events.on("drop",g,!0),t.events.on("html.processGet",d)}var v;return{_init:p}}});