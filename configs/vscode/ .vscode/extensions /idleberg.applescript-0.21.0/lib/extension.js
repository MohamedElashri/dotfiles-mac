var ir=Object.create,L=Object.defineProperty,or=Object.getPrototypeOf,ar=Object.prototype.hasOwnProperty,sr=Object.getOwnPropertyNames,ur=Object.getOwnPropertyDescriptor;var ve=e=>L(e,"__esModule",{value:!0});var R=(e,r)=>()=>(r||(r={exports:{}},e(r.exports,r)),r.exports),lr=(e,r)=>{for(var t in r)L(e,t,{get:r[t],enumerable:!0})},cr=(e,r,t)=>{if(r&&typeof r=="object"||typeof r=="function")for(let n of sr(r))!ar.call(e,n)&&n!=="default"&&L(e,n,{get:()=>r[n],enumerable:!(t=ur(r,n))||t.enumerable});return e},g=e=>cr(ve(L(e!=null?ir(or(e)):{},"default",e&&e.__esModule&&"default"in e?{get:()=>e.default,enumerable:!0}:{value:e,enumerable:!0})),e);var Q=R(V=>{"use strict";Object.defineProperty(V,"__esModule",{value:!0});var fr=require("vscode"),w=require("path");function pr(e){return e&&typeof e=="object"&&"default"in e?e:{default:e}}var f=pr(fr);function W(e,r,t,n){function o(i){return i instanceof t?i:new t(function(s){s(i)})}return new(t||(t=Promise))(function(i,s){function a(c){try{u(n.next(c))}catch(p){s(p)}}function l(c){try{u(n.throw(c))}catch(p){s(p)}}function u(c){c.done?i(c.value):o(c.value).then(a,l)}u((n=n.apply(e,r||[])).next())})}function J(e,r){var t={label:0,sent:function(){if(i[0]&1)throw i[1];return i[1]},trys:[],ops:[]},n,o,i,s;return s={next:a(0),throw:a(1),return:a(2)},typeof Symbol=="function"&&(s[Symbol.iterator]=function(){return this}),s;function a(u){return function(c){return l([u,c])}}function l(u){if(n)throw new TypeError("Generator is already executing.");for(;t;)try{if(n=1,o&&(i=u[0]&2?o.return:u[0]?o.throw||((i=o.return)&&i.call(o),0):o.next)&&!(i=i.call(o,u[1])).done)return i;switch(o=0,i&&(u=[u[0]&2,i.value]),u[0]){case 0:case 1:i=u;break;case 4:return t.label++,{value:u[1],done:!1};case 5:t.label++,o=u[1],u=[0];continue;case 7:u=t.ops.pop(),t.trys.pop();continue;default:if(i=t.trys,!(i=i.length>0&&i[i.length-1])&&(u[0]===6||u[0]===2)){t=0;continue}if(u[0]===3&&(!i||u[1]>i[0]&&u[1]<i[3])){t.label=u[1];break}if(u[0]===6&&t.label<i[1]){t.label=i[1],i=u;break}if(i&&t.label<i[2]){t.label=i[2],t.ops.push(u);break}i[2]&&t.ops.pop(),t.trys.pop();continue}u=r.call(e,t)}catch(c){u=[6,c],o=0}finally{n=i=0}if(u[0]&5)throw u[1];return{value:u[0]?u[1]:void 0,done:!0}}}var me=typeof globalThis!="undefined"?globalThis:typeof window!="undefined"?window:typeof global!="undefined"?global:typeof self!="undefined"?self:{};function he(e){var r={exports:{}};return e(r,r.exports),r.exports}var G=function(e){return e&&e.Math==Math&&e},d=G(typeof globalThis=="object"&&globalThis)||G(typeof window=="object"&&window)||G(typeof self=="object"&&self)||G(typeof me=="object"&&me)||function(){return this}()||Function("return this")(),I=function(e){try{return!!e()}catch(r){return!0}},K=!I(function(){return Object.defineProperty({},1,{get:function(){return 7}})[1]!=7}),ye={}.propertyIsEnumerable,we=Object.getOwnPropertyDescriptor,dr=we&&!ye.call({1:2},1),gr=dr?function(r){var t=we(this,r);return!!t&&t.enumerable}:ye,vr={f:gr},be=function(e,r){return{enumerable:!(e&1),configurable:!(e&2),writable:!(e&4),value:r}},mr={}.toString,xe=function(e){return mr.call(e).slice(8,-1)},hr="".split,yr=I(function(){return!Object("z").propertyIsEnumerable(0)})?function(e){return xe(e)=="String"?hr.call(e,""):Object(e)}:Object,ee=function(e){if(e==null)throw TypeError("Can't call method on "+e);return e},re=function(e){return yr(ee(e))},b=function(e){return typeof e=="object"?e!==null:typeof e=="function"},Se=function(e,r){if(!b(e))return e;var t,n;if(r&&typeof(t=e.toString)=="function"&&!b(n=t.call(e))||typeof(t=e.valueOf)=="function"&&!b(n=t.call(e))||!r&&typeof(t=e.toString)=="function"&&!b(n=t.call(e)))return n;throw TypeError("Can't convert object to primitive value")},wr={}.hasOwnProperty,h=function(e,r){return wr.call(e,r)},te=d.document,br=b(te)&&b(te.createElement),xr=function(e){return br?te.createElement(e):{}},Fe=!K&&!I(function(){return Object.defineProperty(xr("div"),"a",{get:function(){return 7}}).a!=7}),Oe=Object.getOwnPropertyDescriptor,Sr=K?Oe:function(r,t){if(r=re(r),t=Se(t,!0),Fe)try{return Oe(r,t)}catch(n){}if(h(r,t))return be(!vr.f.call(r,t),r[t])},Te={f:Sr},X=function(e){if(!b(e))throw TypeError(String(e)+" is not an object");return e},Ee=Object.defineProperty,Fr=K?Ee:function(r,t,n){if(X(r),t=Se(t,!0),X(n),Fe)try{return Ee(r,t,n)}catch(o){}if("get"in n||"set"in n)throw TypeError("Accessors not supported");return"value"in n&&(r[t]=n.value),r},Pe={f:Fr},j=K?function(e,r,t){return Pe.f(e,r,be(1,t))}:function(e,r,t){return e[r]=t,e},ne=function(e,r){try{j(d,e,r)}catch(t){d[e]=r}return r},$e="__core-js_shared__",Or=d[$e]||ne($e,{}),O=Or,Tr=Function.toString;typeof O.inspectSource!="function"&&(O.inspectSource=function(e){return Tr.call(e)});var Ne=O.inspectSource,ke=d.WeakMap,Er=typeof ke=="function"&&/native code/.test(Ne(ke)),Ce=he(function(e){(e.exports=function(r,t){return O[r]||(O[r]=t!==void 0?t:{})})("versions",[]).push({version:"3.8.1",mode:"global",copyright:"\xA9 2020 Denis Pushkarev (zloirock.ru)"})}),Pr=0,$r=Math.random(),Ae=function(e){return"Symbol("+String(e===void 0?"":e)+")_"+(++Pr+$r).toString(36)},Ie=Ce("keys"),Nr=function(e){return Ie[e]||(Ie[e]=Ae(e))},je={},kr=d.WeakMap,q,M,z,Cr=function(e){return z(e)?M(e):q(e,{})},Ar=function(e){return function(r){var t;if(!b(r)||(t=M(r)).type!==e)throw TypeError("Incompatible receiver, "+e+" required");return t}};Er?(T=O.state||(O.state=new kr),Me=T.get,_e=T.has,De=T.set,q=function(e,r){return r.facade=e,De.call(T,e,r),r},M=function(e){return Me.call(T,e)||{}},z=function(e){return _e.call(T,e)}):($=Nr("state"),je[$]=!0,q=function(e,r){return r.facade=e,j(e,$,r),r},M=function(e){return h(e,$)?e[$]:{}},z=function(e){return h(e,$)});var T,Me,_e,De,$,Be={set:q,get:M,has:z,enforce:Cr,getterFor:Ar},Ir=he(function(e){var r=Be.get,t=Be.enforce,n=String(String).split("String");(e.exports=function(o,i,s,a){var l=a?!!a.unsafe:!1,u=a?!!a.enumerable:!1,c=a?!!a.noTargetGet:!1,p;if(typeof s=="function"&&(typeof i=="string"&&!h(s,"name")&&j(s,"name",i),p=t(s),p.source||(p.source=n.join(typeof i=="string"?i:""))),o===d){u?o[i]=s:ne(i,s);return}else l?!c&&o[i]&&(u=!0):delete o[i];u?o[i]=s:j(o,i,s)})(Function.prototype,"toString",function(){return typeof this=="function"&&r(this).source||Ne(this)})}),ie=d,Le=function(e){return typeof e=="function"?e:void 0},jr=function(e,r){return arguments.length<2?Le(ie[e])||Le(d[e]):ie[e]&&ie[e][r]||d[e]&&d[e][r]},Mr=Math.ceil,_r=Math.floor,Re=function(e){return isNaN(e=+e)?0:(e>0?_r:Mr)(e)},Dr=Math.min,Br=function(e){return e>0?Dr(Re(e),9007199254740991):0},Lr=Math.max,Rr=Math.min,Wr=function(e,r){var t=Re(e);return t<0?Lr(t+r,0):Rr(t,r)},We=function(e){return function(r,t,n){var o=re(r),i=Br(o.length),s=Wr(n,i),a;if(e&&t!=t){for(;i>s;)if(a=o[s++],a!=a)return!0}else for(;i>s;s++)if((e||s in o)&&o[s]===t)return e||s||0;return!e&&-1}},Jr={includes:We(!0),indexOf:We(!1)},Gr=Jr.indexOf,Kr=function(e,r){var t=re(e),n=0,o=[],i;for(i in t)!h(je,i)&&h(t,i)&&o.push(i);for(;r.length>n;)h(t,i=r[n++])&&(~Gr(o,i)||o.push(i));return o},Xr=["constructor","hasOwnProperty","isPrototypeOf","propertyIsEnumerable","toLocaleString","toString","valueOf"],qr=Xr.concat("length","prototype"),zr=Object.getOwnPropertyNames||function(r){return Kr(r,qr)},Hr={f:zr},Yr=Object.getOwnPropertySymbols,Qr={f:Yr},Zr=jr("Reflect","ownKeys")||function(r){var t=Hr.f(X(r)),n=Qr.f;return n?t.concat(n(r)):t},Ur=function(e,r){for(var t=Zr(r),n=Pe.f,o=Te.f,i=0;i<t.length;i++){var s=t[i];h(e,s)||n(e,s,o(r,s))}},Vr=/#|\.prototype\./,_=function(e,r){var t=rt[et(e)];return t==nt?!0:t==tt?!1:typeof r=="function"?I(r):!!r},et=_.normalize=function(e){return String(e).replace(Vr,".").toLowerCase()},rt=_.data={},tt=_.NATIVE="N",nt=_.POLYFILL="P",it=_,ot=Te.f,at=function(e,r){var t=e.target,n=e.global,o=e.stat,i,s,a,l,u,c;if(n?s=d:o?s=d[t]||ne(t,{}):s=(d[t]||{}).prototype,s)for(a in r){if(u=r[a],e.noTargetGet?(c=ot(s,a),l=c&&c.value):l=s[a],i=it(n?a:t+(o?".":"#")+a,e.forced),!i&&l!==void 0){if(typeof u==typeof l)continue;Ur(u,l)}(e.sham||l&&l.sham)&&j(u,"sham",!0),Ir(s,a,u,e)}},Je=!!Object.getOwnPropertySymbols&&!I(function(){return!String(Symbol())}),st=Je&&!Symbol.sham&&typeof Symbol.iterator=="symbol",H=Ce("wks"),D=d.Symbol,ut=st?D:D&&D.withoutSetter||Ae,Ge=function(e){return h(H,e)||(Je&&h(D,e)?H[e]=D[e]:H[e]=ut("Symbol."+e)),H[e]},lt=Ge("match"),ct=function(e){var r;return b(e)&&((r=e[lt])!==void 0?!!r:xe(e)=="RegExp")},ft=function(){var e=X(this),r="";return e.global&&(r+="g"),e.ignoreCase&&(r+="i"),e.multiline&&(r+="m"),e.dotAll&&(r+="s"),e.unicode&&(r+="u"),e.sticky&&(r+="y"),r},pt=Ge("replace"),dt=RegExp.prototype;at({target:"String",proto:!0},{replaceAll:function e(r,t){var n=ee(this),o,i,s,a,l,u,c,p,v;if(r!=null){if(o=ct(r),o&&(i=String(ee("flags"in dt?r.flags:ft.call(r))),!~i.indexOf("g")))throw TypeError("`.replaceAll` does not allow non-global regexes");if(s=r[pt],s!==void 0)return s.call(r,n,t)}if(a=String(n),l=String(r),l==="")return e.call(a,/(?:)/g,t);if(u=a.split(l),typeof t!="function")return u.join(String(t));for(c=u[0],p=c.length,v=1;v<u.length;v++)c+=String(t(l,p,a)),p+=l.length+u[v].length,c+=u[v];return c}});var E=e=>{let r=typeof e;return e!==null&&(r==="object"||r==="function")},gt=new Set(["__proto__","prototype","constructor"]),vt=e=>!e.some(r=>gt.has(r));function Y(e){let r=e.split("."),t=[];for(let n=0;n<r.length;n++){let o=r[n];for(;o[o.length-1]==="\\"&&r[n+1]!==void 0;)o=o.slice(0,-1)+".",o+=r[++n];t.push(o)}return vt(t)?t:[]}var oe={get(e,r,t){if(!E(e)||typeof r!="string")return t===void 0?e:t;let n=Y(r);if(n.length!==0){for(let o=0;o<n.length;o++)if(e=e[n[o]],e==null){if(o!==n.length-1)return t;break}return e===void 0?t:e}},set(e,r,t){if(!E(e)||typeof r!="string")return e;let n=e,o=Y(r);for(let i=0;i<o.length;i++){let s=o[i];E(e[s])||(e[s]={}),i===o.length-1&&(e[s]=t),e=e[s]}return n},delete(e,r){if(!E(e)||typeof r!="string")return!1;let t=Y(r);for(let n=0;n<t.length;n++){let o=t[n];if(n===t.length-1)return delete e[o],!0;if(e=e[o],!E(e))return!1}},has(e,r){if(!E(e)||typeof r!="string")return!1;let t=Y(r);if(t.length===0)return!1;for(let n=0;n<t.length;n++)if(E(e)){if(!(t[n]in e))return!1;e=e[t[n]]}else return!1;return!0}};function mt(){for(var e=[],r=0;r<arguments.length;r++)e[r]=arguments[r];return W(this,void 0,void 0,function(){var t=this;return J(this,function(n){switch(!0){case e.length===0:return[2,f.default.workspace.getConfiguration()];case e.length===1:return[2,Ke(e[0])];default:return[2,Promise.all(e.map(function(o){return W(t,void 0,void 0,function(){return J(this,function(i){return[2,Ke(o)]})})}))]}})})}function Ke(e){return W(this,void 0,void 0,function(){var r,t;return J(this,function(n){switch(n.label){case 0:return r=(e==null?void 0:e.length)?oe.get(f.default.workspace.getConfiguration(),e):f.default.workspace.getConfiguration(),r&&Object.keys(r).length?[4,ht(r)]:[3,2];case 1:return t=n.sent(),[3,3];case 2:t=r,n.label=3;case 3:return[2,t]}})})}function ht(e){return W(this,void 0,void 0,function(){var r,t,n,o,i,s,a,a,l,u;return J(this,function(c){return r=JSON.stringify(e),(r==null?void 0:r.includes("${workspaceFolder}"))&&(r=r.replace(/\${workspaceFolder}/g,ae())),(r==null?void 0:r.includes("${workspaceFolderBasename}"))&&(r=r.replace(/\${workspaceFolderBasename}/g,w.basename(ae()))),(r==null?void 0:r.includes("${file}"))&&(r=r.replace(/\${file}/g,N())),(r==null?void 0:r.includes("${relativeFile}"))&&(r=r.replace(/\${relativeFile}/g,Xe())),(r==null?void 0:r.includes("${relativeFileDirname}"))&&(r=r.replace(/\${relativeFileDirname}/g,yt())),(r==null?void 0:r.includes("${fileBasename}"))&&(r=r.replace(/\${fileBasename}/g,wt())),(r==null?void 0:r.includes("${fileBasenameNoExtension}"))&&(r=r.replace(/\${fileBasenameNoExtension}/g,bt())),(r==null?void 0:r.includes("${fileDirname}"))&&(r=r.replace(/\${fileDirname}/g,xt())),(r==null?void 0:r.includes("${fileExtname}"))&&(r=r.replace(/\${fileExtname}/g,qe())),(r==null?void 0:r.includes("${cwd}"))&&(r=r.replace(/\${cwd}/g,process.cwd())),(r==null?void 0:r.includes("${lineNumber}"))&&(t=ze(),t&&parseInt(t)&&(r=r.replace(/\${lineNumber}/g,ze()))),(r==null?void 0:r.includes("${selectedText}"))&&(n=St().join(),n&&(r=r.replace(/\${selectedText}/g,n))),(r==null?void 0:r.includes("${execPath}"))&&(r=r.replace(/\${execPath}/g,process.execPath)),(r==null?void 0:r.includes("${pathSeparator}"))&&(r=r.replace(/\${pathSeparator}/g,w.sep)),r&&/\${workspaceFolder:[^}]+}/.test(r)&&(o=f.default.workspace.workspaceFolders,i=/\${workspaceFolder:(?<name>[^}]+)}/g,s=r.match(i),(s==null?void 0:s.length)&&s.map(function(p){var v=p.match(/\${workspaceFolder:(?<name>[^}]+)\}/).groups;if(v.name){var A=o.find(function(B){return B.name===v.name});A&&(r=r.replaceAll("${workspaceFolder:"+v.name+"}",A.uri.fsPath))}})),r&&/\${env:[^}]+}/.test(r)&&(a=r.match(/\${env:(?<name>[^}]+)\}/).groups,(a==null?void 0:a.name)&&process.env[a.name]&&(r=r.replace(/(\${env:[^}]+})/g,process.env[a.name]))),r&&/\${config:[^}]+}/.test(r)&&(a=r.match(/\${config:(?<name>[^}]+)\}/).groups,l=f.default.workspace.getConfiguration(),(a==null?void 0:a.name)&&oe.get(l,a.name)&&(u=String(oe.get(l,a.name)),r=r.replace(/(\${config:[^}]+})/g,u))),[2,JSON.parse(r)]})})}function N(){var e=f.default.window.activeTextEditor;if(!e){f.default.window.showWarningMessage("No open editors");return}return e.document.uri.fsPath}function Xe(){var e=ae();return w.relative(e,N())}function yt(){return w.dirname(Xe())}function wt(){return w.basename(N())}function bt(){return w.basename(N(),qe())}function xt(){return w.dirname(N())}function qe(){return w.extname(N())}function ze(){var e=f.default.window.activeTextEditor;if(!e){f.default.window.showWarningMessage("No open editors");return}return String(e.selection.active.line)}function St(){return f.default.window.activeTextEditor.selections.map(function(e){return f.default.window.activeTextEditor.document.getText(new f.default.Range(e.start.line,e.start.character,e.end.line,e.end.character))})}function ae(e){var r,t;e===void 0&&(e="");var n=f.default.window.activeTextEditor;if(!n){f.default.window.showWarningMessage("No open editors");return}var o=f.default.workspace.getWorkspaceFolder((r=n==null?void 0:n.document)===null||r===void 0?void 0:r.uri).uri;if(!((t=o.fsPath)===null||t===void 0?void 0:t.length)){f.default.window.showWarningMessage("No open workspaces");return}return(e==null?void 0:e.length)?w.join(o.fsPath,e):o.fsPath}V.getConfig=mt});var se=R((At,He)=>{var Ft={}.toString;He.exports=Array.isArray||function(e){return Ft.call(e)=="[object Array]"}});var Qe=R((It,Ye)=>{"use strict";var Ot=se();Ye.exports=function(r){return r!=null&&typeof r=="object"&&Ot(r)===!1}});var Ue=R((Mt,Ze)=>{"use strict";var Tt=se(),Et=Qe(),jt=Array.prototype.slice;Ze.exports=k;function k(e,r){if(!(this instanceof k))return typeof r=="number"?new k(e).fromIndex(r):new k(e,r);this.str=e||"",this.lineToIndex=Pt(this.str),r=r||{},this.origin=typeof r.origin=="undefined"?1:r.origin}k.prototype.fromIndex=function(e){if(e<0||e>=this.str.length||isNaN(e))return null;var r=$t(e,this.lineToIndex);return{line:r+this.origin,col:e-this.lineToIndex[r]+this.origin}};k.prototype.toIndex=function(e,r){if(typeof r=="undefined")return Tt(e)&&e.length>=2?this.toIndex(e[0],e[1]):Et(e)&&"line"in e&&("col"in e||"column"in e)?this.toIndex(e.line,"col"in e?e.col:e.column):-1;if(isNaN(e)||isNaN(r))return-1;if(e-=this.origin,r-=this.origin,e>=0&&r>=0&&e<this.lineToIndex.length){var t=this.lineToIndex[e],n=e===this.lineToIndex.length-1?this.str.length:this.lineToIndex[e+1];if(r<n-t)return t+r}return-1};function Pt(e){for(var r=e.split(`
`),t=new Array(r.length),n=0,o=0,i=r.length;o<i;o++)t[o]=n,n+=r[o].length+1;return t}function $t(e,r){if(e>=r[r.length-1])return r.length-1;for(var t=0,n=r.length-2,o;t<n;)if(o=t+(n-t>>1),e<r[o])n=o-1;else if(e>=r[o+1])t=o+1;else{t=o;break}return t}});ve(exports);lr(exports,{activate:()=>Nt});var m=g(require("vscode"));var F=g(require("path")),tr=g(Q());var S=g(require("path")),ue=g(Q()),Ve=g(require("child_process")),le=g(require("vscode")),er=g(Ue());async function rr(e){if(!await(0,ue.getConfig)("applescript.convertErrorRange"))return!1;let t=/^(?<filePath>[^:]+):(?<rangeFrom>\d+):((?<rangeTo>\d+):)?(?<message>.*)$/u.exec(e);if(!t||!t.groups.rangeFrom)return!1;let n=le.window.activeTextEditor.document.getText(),o=le.window.activeTextEditor.document.fileName,i=(0,er.default)(n,{origin:1}).fromIndex(t.groups.rangeFrom);return i.col=t.groups.rangeTo?i.col:1,`${o}:${i.line}:${i.col}:${t.groups.message}`}function C(e,r="scpt"){let t=(0,S.dirname)(e),n=(0,S.basename)(e,(0,S.extname)(e));return(0,S.join)(t,`${n}.${r}`)}async function ce(e,r,t){let{alwaysShowOutput:n}=await(0,ue.getConfig)("applescript");return new Promise((o,i)=>{t.clear(),n&&t.show();let s=(0,Ve.spawn)(e,r);s.stdout.on("data",async a=>{let l=a.toString().trim();if(l.length){let u=await rr(l),c=u||l;t.appendLine(c)}}),s.stderr.on("data",async a=>{let l=a.toString().trim();if(l.length){let u=await rr(l),c=u||l;t.appendLine(c)}}),s.on("close",a=>a===0?o():i())})}var Z=g(require("fs")),y=g(require("vscode"));async function fe(e=!1){if(typeof y.workspace.rootPath=="undefined"||y.workspace.rootPath===null){y.window.showErrorMessage("Task support is only available when working on a workspace folder. It is not available when editing single files.");return}let{alwaysOpenBuildTask:r,defaultBuildTask:t,osacompile:n,osascript:o}=await(0,tr.getConfig)("applescript"),i=y.window.activeTextEditor.document,s=(0,F.basename)(i.fileName),a=[],l=[],u=[];e===!0&&a.push("-l","JavaScript"),n.executeOnly===!0&&a.push("-x"),n.stayOpen===!0&&u.push("-s"),n.startupScreen===!0&&u.push("-u"),o.outputStyle.trim().length>0&&o.outputStyle.trim().length<=2&&l.push("-s",o.outputStyle.trim());let c={version:"2.0.0",tasks:[{label:"Run Script",type:"shell",command:"osascript",args:[...a,...l,s]},{label:"Compile Script",type:"shell",command:"osacompile",args:[...a,"-o",(0,F.basename)(C(i.fileName)),s],group:t==="script"?"build":"none"},{label:"Compile Script Bundle",type:"shell",command:"osacompile",args:[...a,"-o",(0,F.basename)(C(i.fileName,"scptd")),s],group:t==="bundle"?"build":"none"},{label:"Compile Application",type:"shell",command:"osacompile",args:[...a,"-o",(0,F.basename)(C(i.fileName,"app")),s],group:t==="app"?"build":"none"}]},p=JSON.stringify(c,null,2),v=(0,F.join)(y.workspace.rootPath,"/.vscode"),A=(0,F.join)(v,"tasks.json");(0,Z.mkdir)(v,()=>{(0,Z.writeFile)(A,p,B=>{B&&y.window.showErrorMessage(B.toString()),r!==!1&&y.workspace.openTextDocument(A).then(nr=>{y.window.showTextDocument(nr)})})})}var pe=g(require("os")),x=g(require("vscode")),de=g(Q());var U=x.window.createOutputChannel("AppleScript");async function P(e,r={isJXA:!1}){let{ignoreOS:t,osacompile:n,showNotifications:o}=await(0,de.getConfig)("applescript");if(r={...r,...n},(0,pe.platform)()!=="darwin"&&t!==!0){x.window.showWarningMessage("This command is only available on macOS");return}let i=x.window.activeTextEditor.document;i.save().then(()=>{let s=C(i.fileName,e),a=["-o",s];r.isJXA===!0&&a.push("-l","JavaScript"),r.executeOnly===!0&&a.push("-x"),e==="app"&&r.stayOpen===!0&&a.push("-s"),e==="app"&&r.startupScreen===!0&&a.push("-u"),a.push(i.fileName),ce("osacompile",a,U).then(()=>{o&&x.window.showInformationMessage(`Successfully compiled '${i.fileName}'`)}).catch(()=>{U.show(!0),o&&x.window.showErrorMessage("Failed to compile or exited with error (see output for details)")})})}async function ge(e={isJXA:!1}){let{ignoreOS:r,osascript:t,showNotifications:n}=await(0,de.getConfig)("applescript");if((0,pe.platform)()!=="darwin"&&r!==!0){x.window.showWarningMessage("This command is only available on macOS");return}let o=x.window.activeTextEditor.document,i=[];o.isDirty?o.getText().split(`
`).forEach(function(a){i.push("-e",a)}):i.push(o.fileName),t.outputStyle.trim().length>0&&t.outputStyle.trim().length<=2&&i.unshift("-s",t.outputStyle.trim()),e.isJXA===!0&&i.unshift("-l","JavaScript"),ce("osascript",i,U).catch(()=>{U.show(!0),n&&x.window.showErrorMessage("Failed to run script or exited with error (see output for details)")})}"use strict";async function Nt(e){e.subscriptions.push(m.commands.registerTextEditorCommand("extension.applescript.run",async()=>await ge())),e.subscriptions.push(m.commands.registerTextEditorCommand("extension.applescript.compile",async()=>await P("scpt"))),e.subscriptions.push(m.commands.registerTextEditorCommand("extension.applescript.compileBundle",async()=>await P("scptd"))),e.subscriptions.push(m.commands.registerTextEditorCommand("extension.applescript.compileApp",async()=>await P("app"))),e.subscriptions.push(m.commands.registerTextEditorCommand("extension.applescript.createBuildTask",async()=>await fe())),e.subscriptions.push(m.commands.registerTextEditorCommand("extension.jxa.run",async()=>await ge({isJXA:!0}))),e.subscriptions.push(m.commands.registerTextEditorCommand("extension.jxa.compile",async()=>await P("scpt",{isJXA:!0}))),e.subscriptions.push(m.commands.registerTextEditorCommand("extension.jxa.compileBundle",async()=>await P("scptd",{isJXA:!0}))),e.subscriptions.push(m.commands.registerTextEditorCommand("extension.jxa.compileApp",async()=>await P("app",{isJXA:!0}))),e.subscriptions.push(m.commands.registerTextEditorCommand("extension.jxa.createBuildTask",async()=>await fe(!0)))}
/*!
 * isobject <https://github.com/jonschlinkert/isobject>
 *
 * Copyright (c) 2014-2015, Jon Schlinkert.
 * Licensed under the MIT License.
 */
/*! *****************************************************************************
Copyright (c) Microsoft Corporation.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
***************************************************************************** */
/**
 * line-column - Convert efficiently index to/from line-column in a string
 * @module  lineColumn
 * @license MIT
 */
//# sourceMappingURL=extension.js.map