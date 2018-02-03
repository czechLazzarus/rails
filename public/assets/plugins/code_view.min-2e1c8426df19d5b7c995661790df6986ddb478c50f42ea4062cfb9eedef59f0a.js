!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof module&&module.exports?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n)}:e(window.jQuery)}(function(e){e.extend(e.FE.DEFAULTS,{codeMirror:window.CodeMirror,codeMirrorOptions:{lineNumbers:!0,tabMode:"indent",indentWithTabs:!0,lineWrapping:!0,mode:"text/html",tabSize:2},codeBeautifierOptions:{end_with_newline:!0,indent_inner_html:!0,extra_liners:["p","h1","h2","h3","h4","h5","h6","blockquote","pre","ul","ol","table","dl"],brace_style:"expand",indent_char:"\t",indent_size:1,wrap_line_length:0},codeViewKeepActiveButtons:["fullscreen"]}),e.FE.PLUGINS.codeView=function(t){function n(){return t.$box.hasClass("fr-code-view")}function i(){return h?h.getValue():d.val()}function s(e){var n=i();t.html.set(n),t.$el.blur(),t.$tb.find(" > .fr-command").not(e).removeClass("fr-disabled").attr("aria-disabled",!1),e.removeClass("fr-active").attr("aria-pressed",!1),t.selection.setAtStart(t.el),t.selection.restore(),t.placeholder.refresh(),t.undo.saveStep()}function o(n){d||(l(),!h&&t.opts.codeMirror?h=t.opts.codeMirror.fromTextArea(d.get(0),t.opts.codeMirrorOptions):t.events.$on(d,"keydown keyup change input",function(){t.opts.height?this.removeAttribute("rows"):(this.rows=1,0===this.value.length?this.style.height="auto":this.style.height=this.scrollHeight+"px")})),t.undo.saveStep(),t.html.cleanEmptyTags(),t.html.cleanWhiteTags(!0),t.core.hasFocus()&&(t.core.isEmpty()||(t.selection.save(),t.$el.find('.fr-marker[data-type="true"]:first').replaceWith('<span class="fr-tmp fr-sm">F</span>'),t.$el.find('.fr-marker[data-type="false"]:last').replaceWith('<span class="fr-tmp fr-em">F</span>')));var i=t.html.get(!1,!0);t.$el.find("span.fr-tmp").remove(),t.$box.toggleClass("fr-code-view",!0),t.core.hasFocus()&&t.$el.blur(),i=(i=i.replace(/<span class="fr-tmp fr-sm">F<\/span>/,"FROALA-SM")).replace(/<span class="fr-tmp fr-em">F<\/span>/,"FROALA-EM"),t.codeBeautifier&&(i=t.codeBeautifier.run(i,t.opts.codeBeautifierOptions));var s,o;if(h){(s=i.indexOf("FROALA-SM"))>(o=i.indexOf("FROALA-EM"))?s=o:o-=9;var r=(i=i.replace(/FROALA-SM/g,"").replace(/FROALA-EM/g,"")).substring(0,s).length-i.substring(0,s).replace(/\n/g,"").length,a=i.substring(0,o).length-i.substring(0,o).replace(/\n/g,"").length;s=i.substring(0,s).length-i.substring(0,i.substring(0,s).lastIndexOf("\n")+1).length,o=i.substring(0,o).length-i.substring(0,i.substring(0,o).lastIndexOf("\n")+1).length,h.setSize(null,t.opts.height?t.opts.height:"auto"),t.opts.heightMin&&t.$box.find(".CodeMirror-scroll").css("min-height",t.opts.heightMin),h.setValue(i),h.focus(),h.setSelection({line:r,ch:s},{line:a,ch:o}),h.refresh(),h.clearHistory()}else{s=i.indexOf("FROALA-SM"),o=i.indexOf("FROALA-EM")-9,t.opts.heightMin&&d.css("min-height",t.opts.heightMin),t.opts.height&&d.css("height",t.opts.height),t.opts.heightMax&&d.css("max-height",t.opts.height||t.opts.heightMax),d.val(i.replace(/FROALA-SM/g,"").replace(/FROALA-EM/g,"")).trigger("change");var c=e(t.o_doc).scrollTop();d.focus(),d.get(0).setSelectionRange(s,o),e(t.o_doc).scrollTop(c)}t.$tb.find(" > .fr-command").not(n).filter(function(){return t.opts.codeViewKeepActiveButtons.indexOf(e(this).data("cmd"))<0}).addClass("fr-disabled").attr("aria-disabled",!0),n.addClass("fr-active").attr("aria-pressed",!0),!t.helpers.isMobile()&&t.opts.toolbarInline&&t.toolbar.hide()}function r(e){void 0===e&&(e=!n());var i=t.$tb.find('.fr-command[data-cmd="html"]');e?(t.popups.hideAll(),o(i)):(t.$box.toggleClass("fr-code-view",!1),s(i))}function a(){n()&&r(!1),h&&h.toTextArea(),d.val("").removeData().remove(),d=null,f&&(f.remove(),f=null)}function l(){d=e('<textarea class="fr-code" tabIndex="-1">'),t.$wp.append(d),d.attr("dir",t.opts.direction),t.$box.hasClass("fr-basic")||(f=e('<a data-cmd="html" title="Code View" class="fr-command fr-btn html-switch'+(t.helpers.isMobile()?"":" fr-desktop")+'" role="button" tabIndex="-1"><i class="fa fa-code"></i></button>'),t.$box.append(f),t.events.bindClick(t.$box,"a.html-switch",function(){r(!1)}));var s=function(){return!n()};t.events.on("buttons.refresh",s),t.events.on("copy",s,!0),t.events.on("cut",s,!0),t.events.on("paste",s,!0),t.events.on("destroy",a,!0),t.events.on("html.set",function(){n()&&r(!0)}),t.events.on("form.submit",function(){n()&&(t.html.set(i()),t.events.trigger("contentChanged",[],!0))},!0)}function c(){return!!t.$wp&&void 0}var d,h,f;return{_init:c,toggle:r,isActive:n,get:i}},e.FE.RegisterCommand("html",{title:"Code View",undo:!1,focus:!1,forcedRefresh:!0,toggle:!0,callback:function(){this.codeView.toggle()},plugin:"codeView"}),e.FE.DefineIcon("html",{NAME:"code"})});