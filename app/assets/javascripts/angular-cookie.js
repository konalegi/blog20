angular.module("ivpusic.cookie",["ng"]).factory("ipCookie",["$document",function(e){"use strict";return function(){function i(i,t,n){var r,o,s,p,u,a,c,x,d;if(n=n||{},void 0!==t)return t="object"==typeof t?JSON.stringify(t):t+"","number"==typeof n.expires&&(d=n.expires,n.expires=new Date,-1===d?n.expires=new Date("Thu, 01 Jan 1970 00:00:00 GMT"):void 0!==n.expirationUnit?"minutes"===n.expirationUnit?n.expires.setMinutes(n.expires.getMinutes()+d):n.expires.setDate(n.expires.getDate()+d):n.expires.setDate(n.expires.getDate()+d)),e[0].cookie=[encodeURIComponent(i),"=",encodeURIComponent(t),n.expires?"; expires="+n.expires.toUTCString():"",n.path?"; path="+n.path:"",n.domain?"; domain="+n.domain:"",n.secure?"; secure":""].join("");for(o=[],x=e[0].cookie,x&&(o=x.split("; ")),r={},c=!1,s=0;o.length>s;++s)if(o[s]&&(p=o[s],u=p.indexOf("="),a=p.substring(0,u),t=decodeURIComponent(p.substring(u+1)),void 0===i||i===a)){try{r[a]=JSON.parse(t)}catch(f){r[a]=t}if(i===a)return r[a];c=!0}return c&&void 0===i?r:void 0}return i.remove=function(e,t){var n=void 0!==i(e);return n&&(t||(t={}),t.expires=-1,i(e,"",t)),n},i}()}]);