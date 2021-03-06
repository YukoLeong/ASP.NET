<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload01.aspx.cs" Inherits="upload01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <link rel="dns-prefetch" href="http://res.cloudinary.com/">
    <link rel="dns-prefetch" href="http://d2mdw063ttlqtq.cloudfront.net/" />
    <link rel="dns-prefetch" href="http://jwpsrv.com/" />


    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <script type="text/javascript">window.NREUM || (NREUM = {}); NREUM.info = { "beacon": "bam.nr-data.net", "errorBeacon": "bam.nr-data.net", "licenseKey": "fcf8d519de", "applicationID": "13909", "transactionName": "NTU0DRQNDwshOmIZBRM3dR8TDg84Nys/FRQYBSoLAxQKAjM=", "queueTime": 0, "applicationTime": 87, "agent": "js-agent.newrelic.com/nr-632.min.js", "atts": "DXgvW1wZQRQtPChSS1QZNR0DIQIJPScjUl1UKSkVRFgFBig7KFxTBD8rDAMRFzg0OiIEHhU1NltcQAsTMDh3X15UdngKDwUNAiAXJB4uAyk/C0RYQUR4BiQcMho7KQpYQE9FLThvSlNEamhXXlRNVnNxY0FDRHh2WxMRBhUbKSoVHwJ4YFsrDRkOKCQsX0VYb3pRBQ0OFyU8JBIdE2F6MTI2EQYnI21DX0YiYVkxCw0DKz8+UEhOc3hVRBAGES07JB8fVGB4HAQHUgJ2eREeUwsn" }</script>
    <script type="text/javascript">(window.NREUM || (NREUM = {})).loader_config = { xpid: "VQcGQldQAQMJ" }; window.NREUM || (NREUM = {}), __nr_require = function (t, e, n) { function r(n) { if (!e[n]) { var o = e[n] = { exports: {} }; t[n][0].call(o.exports, function (e) { var o = t[n][1][e]; return r(o ? o : e) }, o, o.exports) } return e[n].exports } if ("function" == typeof __nr_require) return __nr_require; for (var o = 0; o < n.length; o++) r(n[o]); return r }({ QJf3ax: [function (t, e) { function n(t) { function e(e, n, a) { t && t(e, n, a), a || (a = {}); for (var c = s(e), f = c.length, u = i(a, o, r), d = 0; f > d; d++) c[d].apply(u, n); return u } function a(t, e) { f[t] = s(t).concat(e) } function s(t) { return f[t] || [] } function c() { return n(e) } var f = {}; return { on: a, emit: e, create: c, listeners: s, _events: f } } function r() { return {} } var o = "nr@context", i = t("gos"); e.exports = n() }, { gos: "7eSDFh" }], ee: [function (t, e) { e.exports = t("QJf3ax") }, {}], 3: [function (t) { function e(t) { try { i.console && console.log(t) } catch (e) { } } var n, r = t("ee"), o = t(1), i = {}; try { n = localStorage.getItem("__nr_flags").split(","), console && "function" == typeof console.log && (i.console = !0, -1 !== n.indexOf("dev") && (i.dev = !0), -1 !== n.indexOf("nr_dev") && (i.nrDev = !0)) } catch (a) { } i.nrDev && r.on("internal-error", function (t) { e(t.stack) }), i.dev && r.on("fn-err", function (t, n, r) { e(r.stack) }), i.dev && (e("NR AGENT IN DEVELOPMENT MODE"), e("flags: " + o(i, function (t) { return t }).join(", "))) }, { 1: 23, ee: "QJf3ax" }], 4: [function (t) { function e(t, e, n, i, s) { try { c ? c -= 1 : r("err", [s || new UncaughtException(t, e, n)]) } catch (f) { try { r("ierr", [f, (new Date).getTime(), !0]) } catch (u) { } } return "function" == typeof a ? a.apply(this, o(arguments)) : !1 } function UncaughtException(t, e, n) { this.message = t || "Uncaught error with no additional information", this.sourceURL = e, this.line = n } function n(t) { r("err", [t, (new Date).getTime()]) } var r = t("handle"), o = t(6), i = t("ee"), a = window.onerror, s = !1, c = 0; t("loader").features.err = !0, t(5), window.onerror = e; try { throw new Error } catch (f) { "stack" in f && (t(1), t(2), "addEventListener" in window && t(3), window.XMLHttpRequest && XMLHttpRequest.prototype && XMLHttpRequest.prototype.addEventListener && window.XMLHttpRequest && XMLHttpRequest.prototype && XMLHttpRequest.prototype.addEventListener && !/CriOS/.test(navigator.userAgent) && t(4), s = !0) } i.on("fn-start", function () { s && (c += 1) }), i.on("fn-err", function (t, e, r) { s && (this.thrown = !0, n(r)) }), i.on("fn-end", function () { s && !this.thrown && c > 0 && (c -= 1) }), i.on("internal-error", function (t) { r("ierr", [t, (new Date).getTime(), !0]) }) }, { 1: 10, 2: 9, 3: 7, 4: 11, 5: 3, 6: 24, ee: "QJf3ax", handle: "D5DuLP", loader: "G9z0Bl" }], 5: [function (t) { t("loader").features.ins = !0 }, { loader: "G9z0Bl" }], 6: [function (t) { function e() { } if (window.performance && window.performance.timing && window.performance.getEntriesByType) { var n = t("ee"), r = t("handle"), o = t(1), i = t(2); t("loader").features.stn = !0, t(3), n.on("fn-start", function (t) { var e = t[0]; e instanceof Event && (this.bstStart = Date.now()) }), n.on("fn-end", function (t, e) { var n = t[0]; n instanceof Event && r("bst", [n, e, this.bstStart, Date.now()]) }), o.on("fn-start", function (t, e, n) { this.bstStart = Date.now(), this.bstType = n }), o.on("fn-end", function (t, e) { r("bstTimer", [e, this.bstStart, Date.now(), this.bstType]) }), i.on("fn-start", function () { this.bstStart = Date.now() }), i.on("fn-end", function (t, e) { r("bstTimer", [e, this.bstStart, Date.now(), "requestAnimationFrame"]) }), n.on("pushState-start", function () { this.time = Date.now(), this.startPath = location.pathname + location.hash }), n.on("pushState-end", function () { r("bstHist", [location.pathname + location.hash, this.startPath, this.time]) }), "addEventListener" in window.performance && (window.performance.addEventListener("webkitresourcetimingbufferfull", function () { r("bstResource", [window.performance.getEntriesByType("resource")]), window.performance.webkitClearResourceTimings() }, !1), window.performance.addEventListener("resourcetimingbufferfull", function () { r("bstResource", [window.performance.getEntriesByType("resource")]), window.performance.clearResourceTimings() }, !1)), document.addEventListener("scroll", e, !1), document.addEventListener("keypress", e, !1), document.addEventListener("click", e, !1) } }, { 1: 10, 2: 9, 3: 8, ee: "QJf3ax", handle: "D5DuLP", loader: "G9z0Bl" }], 7: [function (t, e) { function n(t) { i.inPlace(t, ["addEventListener", "removeEventListener"], "-", r) } function r(t) { return t[1] } var o = (t(1), t("ee").create()), i = t(2)(o), a = t("gos"); if (e.exports = o, n(window), "getPrototypeOf" in Object) { for (var s = document; s && !s.hasOwnProperty("addEventListener") ;) s = Object.getPrototypeOf(s); s && n(s); for (var c = XMLHttpRequest.prototype; c && !c.hasOwnProperty("addEventListener") ;) c = Object.getPrototypeOf(c); c && n(c) } else XMLHttpRequest.prototype.hasOwnProperty("addEventListener") && n(XMLHttpRequest.prototype); o.on("addEventListener-start", function (t) { if (t[1]) { var e = t[1]; "function" == typeof e ? this.wrapped = t[1] = a(e, "nr@wrapped", function () { return i(e, "fn-", null, e.name || "anonymous") }) : "function" == typeof e.handleEvent && i.inPlace(e, ["handleEvent"], "fn-") } }), o.on("removeEventListener-start", function (t) { var e = this.wrapped; e && (t[1] = e) }) }, { 1: 24, 2: 25, ee: "QJf3ax", gos: "7eSDFh" }], 8: [function (t, e) { var n = (t(2), t("ee").create()), r = t(1)(n); e.exports = n, r.inPlace(window.history, ["pushState"], "-") }, { 1: 25, 2: 24, ee: "QJf3ax" }], 9: [function (t, e) { var n = (t(2), t("ee").create()), r = t(1)(n); e.exports = n, r.inPlace(window, ["requestAnimationFrame", "mozRequestAnimationFrame", "webkitRequestAnimationFrame", "msRequestAnimationFrame"], "raf-"), n.on("raf-start", function (t) { t[0] = r(t[0], "fn-") }) }, { 1: 25, 2: 24, ee: "QJf3ax" }], 10: [function (t, e) { function n(t, e, n) { t[0] = o(t[0], "fn-", null, n) } var r = (t(2), t("ee").create()), o = t(1)(r); e.exports = r, o.inPlace(window, ["setTimeout", "setInterval", "setImmediate"], "setTimer-"), r.on("setTimer-start", n) }, { 1: 25, 2: 24, ee: "QJf3ax" }], 11: [function (t, e) { function n() { f.inPlace(this, p, "fn-") } function r(t, e) { f.inPlace(e, ["onreadystatechange"], "fn-") } function o(t, e) { return e } function i(t, e) { for (var n in t) e[n] = t[n]; return e } var a = t("ee").create(), s = t(1), c = t(2), f = c(a), u = c(s), d = window.XMLHttpRequest, p = ["onload", "onerror", "onabort", "onloadstart", "onloadend", "onprogress", "ontimeout"]; e.exports = a, window.XMLHttpRequest = function (t) { var e = new d(t); try { a.emit("new-xhr", [], e), u.inPlace(e, ["addEventListener", "removeEventListener"], "-", o), e.addEventListener("readystatechange", n, !1) } catch (r) { try { a.emit("internal-error", [r]) } catch (i) { } } return e }, i(d, XMLHttpRequest), XMLHttpRequest.prototype = d.prototype, f.inPlace(XMLHttpRequest.prototype, ["open", "send"], "-xhr-", o), a.on("send-xhr-start", r), a.on("open-xhr-start", r) }, { 1: 7, 2: 25, ee: "QJf3ax" }], 12: [function (t) { function e(t) { var e = this.params, r = this.metrics; if (!this.ended) { this.ended = !0; for (var i = 0; c > i; i++) t.removeEventListener(s[i], this.listener, !1); if (!e.aborted) { if (r.duration = (new Date).getTime() - this.startTime, 4 === t.readyState) { e.status = t.status; var a = t.responseType, f = "arraybuffer" === a || "blob" === a || "json" === a ? t.response : t.responseText, u = n(f); if (u && (r.rxSize = u), this.sameOrigin) { var d = t.getResponseHeader("X-NewRelic-App-Data"); d && (e.cat = d.split(", ").pop()) } } else e.status = 0; r.cbTime = this.cbTime, o("xhr", [e, r, this.startTime]) } } } function n(t) { if ("string" == typeof t && t.length) return t.length; if ("object" != typeof t) return void 0; if ("undefined" != typeof ArrayBuffer && t instanceof ArrayBuffer && t.byteLength) return t.byteLength; if ("undefined" != typeof Blob && t instanceof Blob && t.size) return t.size; if ("undefined" != typeof FormData && t instanceof FormData) return void 0; try { return JSON.stringify(t).length } catch (e) { return void 0 } } function r(t, e) { var n = i(e), r = t.params; r.host = n.hostname + ":" + n.port, r.pathname = n.pathname, t.sameOrigin = n.sameOrigin } if (window.XMLHttpRequest && XMLHttpRequest.prototype && XMLHttpRequest.prototype.addEventListener && !/CriOS/.test(navigator.userAgent)) { t("loader").features.xhr = !0; var o = t("handle"), i = t(2), a = t("ee"), s = ["load", "error", "abort", "timeout"], c = s.length, f = t(1); t(4), t(3), a.on("new-xhr", function () { this.totalCbs = 0, this.called = 0, this.cbTime = 0, this.end = e, this.ended = !1, this.xhrGuids = {} }), a.on("open-xhr-start", function (t) { this.params = { method: t[0] }, r(this, t[1]), this.metrics = {} }), a.on("open-xhr-end", function (t, e) { "loader_config" in NREUM && "xpid" in NREUM.loader_config && this.sameOrigin && e.setRequestHeader("X-NewRelic-ID", NREUM.loader_config.xpid) }), a.on("send-xhr-start", function (t, e) { var r = this.metrics, o = t[0], i = this; if (r && o) { var f = n(o); f && (r.txSize = f) } this.startTime = (new Date).getTime(), this.listener = function (t) { try { "abort" === t.type && (i.params.aborted = !0), ("load" !== t.type || i.called === i.totalCbs && (i.onloadCalled || "function" != typeof e.onload)) && i.end(e) } catch (n) { try { a.emit("internal-error", [n]) } catch (r) { } } }; for (var u = 0; c > u; u++) e.addEventListener(s[u], this.listener, !1) }), a.on("xhr-cb-time", function (t, e, n) { this.cbTime += t, e ? this.onloadCalled = !0 : this.called += 1, this.called !== this.totalCbs || !this.onloadCalled && "function" == typeof n.onload || this.end(n) }), a.on("xhr-load-added", function (t, e) { var n = "" + f(t) + !!e; this.xhrGuids && !this.xhrGuids[n] && (this.xhrGuids[n] = !0, this.totalCbs += 1) }), a.on("xhr-load-removed", function (t, e) { var n = "" + f(t) + !!e; this.xhrGuids && this.xhrGuids[n] && (delete this.xhrGuids[n], this.totalCbs -= 1) }), a.on("addEventListener-end", function (t, e) { e instanceof XMLHttpRequest && "load" === t[0] && a.emit("xhr-load-added", [t[1], t[2]], e) }), a.on("removeEventListener-end", function (t, e) { e instanceof XMLHttpRequest && "load" === t[0] && a.emit("xhr-load-removed", [t[1], t[2]], e) }), a.on("fn-start", function (t, e, n) { e instanceof XMLHttpRequest && ("onload" === n && (this.onload = !0), ("load" === (t[0] && t[0].type) || this.onload) && (this.xhrCbStart = (new Date).getTime())) }), a.on("fn-end", function (t, e) { this.xhrCbStart && a.emit("xhr-cb-time", [(new Date).getTime() - this.xhrCbStart, this.onload, e], e) }) } }, { 1: "XL7HBI", 2: 13, 3: 11, 4: 7, ee: "QJf3ax", handle: "D5DuLP", loader: "G9z0Bl" }], 13: [function (t, e) { e.exports = function (t) { var e = document.createElement("a"), n = window.location, r = {}; e.href = t, r.port = e.port; var o = e.href.split("://"); return !r.port && o[1] && (r.port = o[1].split("http://codecanyon.net/")[0].split("@").pop().split(":")[1]), r.port && "0" !== r.port || (r.port = "https" === o[0] ? "443" : "80"), r.hostname = e.hostname || n.hostname, r.pathname = e.pathname, r.protocol = o[0], "/" !== r.pathname.charAt(0) && (r.pathname = "/" + r.pathname), r.sameOrigin = !e.hostname || e.hostname === document.domain && e.port === n.port && e.protocol === n.protocol, r } }, {}], 14: [function (t, e) { function n(t) { return function () { r(t, [(new Date).getTime()].concat(i(arguments))) } } var r = t("handle"), o = t(1), i = t(2); "undefined" == typeof window.newrelic && (newrelic = window.NREUM); var a = ["setPageViewName", "addPageAction", "setCustomAttribute", "finished", "addToTrace", "inlineHit", "noticeError"]; o(a, function (t, e) { window.NREUM[e] = n("api-" + e) }), e.exports = window.NREUM }, { 1: 23, 2: 24, handle: "D5DuLP" }], "7eSDFh": [function (t, e) { function n(t, e, n) { if (r.call(t, e)) return t[e]; var o = n(); if (Object.defineProperty && Object.keys) try { return Object.defineProperty(t, e, { value: o, writable: !0, enumerable: !1 }), o } catch (i) { } return t[e] = o, o } var r = Object.prototype.hasOwnProperty; e.exports = n }, {}], gos: [function (t, e) { e.exports = t("7eSDFh") }, {}], handle: [function (t, e) { e.exports = t("D5DuLP") }, {}], D5DuLP: [function (t, e) { function n(t, e, n) { return r.listeners(t).length ? r.emit(t, e, n) : (o[t] || (o[t] = []), void o[t].push(e)) } var r = t("ee").create(), o = {}; e.exports = n, n.ee = r, r.q = o }, { ee: "QJf3ax" }], id: [function (t, e) { e.exports = t("XL7HBI") }, {}], XL7HBI: [function (t, e) { function n(t) { var e = typeof t; return !t || "object" !== e && "function" !== e ? -1 : t === window ? 0 : i(t, o, function () { return r++ }) } var r = 1, o = "nr@id", i = t("gos"); e.exports = n }, { gos: "7eSDFh" }], G9z0Bl: [function (t, e) { function n() { var t = p.info = NREUM.info, e = f.getElementsByTagName("script")[0]; if (t && t.licenseKey && t.applicationID && e) { s(d, function (e, n) { e in t || (t[e] = n) }); var n = "https" === u.split(":")[0] || t.sslForHttp; p.proto = n ? "https://" : "http://", a("mark", ["onload", i()]); var r = f.createElement("script"); r.src = p.proto + t.agent, e.parentNode.insertBefore(r, e) } } function r() { "complete" === f.readyState && o() } function o() { a("mark", ["domContent", i()]) } function i() { return (new Date).getTime() } var a = t("handle"), s = t(1), c = (t(2), window), f = c.document, u = ("" + location).split("?")[0], d = { beacon: "bam.nr-data.net", errorBeacon: "bam.nr-data.net", agent: "js-agent.newrelic.com/nr-632.min.js" }, p = e.exports = { offset: i(), origin: u, features: {} }; f.addEventListener ? (f.addEventListener("DOMContentLoaded", o, !1), c.addEventListener("load", n, !1)) : (f.attachEvent("onreadystatechange", r), c.attachEvent("onload", n)), a("mark", ["firstbyte", i()]) }, { 1: 23, 2: 14, handle: "D5DuLP" }], loader: [function (t, e) { e.exports = t("G9z0Bl") }, {}], 23: [function (t, e) { function n(t, e) { var n = [], o = "", i = 0; for (o in t) r.call(t, o) && (n[i] = e(o, t[o]), i += 1); return n } var r = Object.prototype.hasOwnProperty; e.exports = n }, {}], 24: [function (t, e) { function n(t, e, n) { e || (e = 0), "undefined" == typeof n && (n = t ? t.length : 0); for (var r = -1, o = n - e || 0, i = Array(0 > o ? 0 : o) ; ++r < o;) i[r] = t[e + r]; return i } e.exports = n }, {}], 25: [function (t, e) { function n(t) { return !(t && "function" == typeof t && t.apply && !t[i]) } var r = t("ee"), o = t(1), i = "nr@wrapper", a = Object.prototype.hasOwnProperty; e.exports = function (t) { function e(t, e, r, a) { function nrWrapper() { var n, i, s, f; try { i = this, n = o(arguments), s = r && r(n, i) || {} } catch (d) { u([d, "", [n, i, a], s]) } c(e + "start", [n, i, a], s); try { return f = t.apply(i, n) } catch (p) { throw c(e + "err", [n, i, p], s), p } finally { c(e + "end", [n, i, f], s) } } return n(t) ? t : (e || (e = ""), nrWrapper[i] = !0, f(t, nrWrapper), nrWrapper) } function s(t, r, o, i) { o || (o = ""); var a, s, c, f = "-" === o.charAt(0); for (c = 0; c < r.length; c++) s = r[c], a = t[s], n(a) || (t[s] = e(a, f ? s + o : o, i, s)) } function c(e, n, r) { try { t.emit(e, n, r) } catch (o) { u([o, e, n, r]) } } function f(t, e) { if (Object.defineProperty && Object.keys) try { var n = Object.keys(t); return n.forEach(function (n) { Object.defineProperty(e, n, { get: function () { return t[n] }, set: function (e) { return t[n] = e, e } }) }), e } catch (r) { u([r]) } for (var o in t) a.call(t, o) && (e[o] = t[o]); return e } function u(e) { try { t.emit("internal-error", e) } catch (n) { } } return t || (t = r), e.inPlace = s, e.flag = i, e } }, { 1: 24, ee: "QJf3ax" }] }, {}, ["G9z0Bl", 4, 12, 6, 5]);</script>
    <title>HTML5 File Upload Preview - CodeCanyon</title>
    <meta name="description" content="This is a HTML5 file uploader, for single or multiple files. You can add files easily by dragging...">
    <meta name="robots" content="noindex, follow" />
    <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1" />

    <link href="upload01style/index-60e2b2c5003057e1569951e16debba32.css" media="all" rel="stylesheet" type="text/css" />
    <link href="upload01style/index-c2fa260a0497ab20e7b435e63dad5f22.css" media="all" rel="stylesheet" type="text/css" />


    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="upload01style/icons/codecanyon.net/apple-touch-icon-144x144-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="upload01style/icons/codecanyon.net/apple-touch-icon-114x114-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="upload01style/icons/codecanyon.net/icons/codecanyon.net/apple-touch-icon-72x72-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" href="upload01style/icons/codecanyon.net/apple-touch-icon-precomposed.png" />
    <script src="upload01style/jquery-e5fa4249bb0e6cc68d065935e42c7612.js" type="text/javascript"></script>

    <script>
        //function to fix height of iframe!
        var calcHeight = function () {
            var headerDimensions = $('.preview__header').height();
            $('.full-screen-preview__frame').height($(window).height() - headerDimensions);
        }

        $(document).ready(function () {
            calcHeight();
        });

        $(window).resize(function () {
            calcHeight();
        }).load(function () {
            calcHeight();
        });
    </script>




</head>
<body class="full-screen-preview">
    <form id="form1" runat="server">
        <div class="preview__header">

<%--            <div class="preview__envato-logo">
                <a href="http://codecanyon.net/item/html5-file-upload/9254506">Envato Market</a>
            </div>

            <div class="preview__actions">
                <div class="preview__action--buy">
                    <a href="http://codecanyon.net/item/html5-file-upload/9254506" class="btn btn--primary">Buy now</a>
                </div>

                <div class="preview__action--close">

                    <a href="http://html5fileupload.stbeets.nl/">
                        <i class="e-icon -icon-cancel"></i><span>Remove Frame</span>
                    </a>
                </div>
            </div>--%>

        </div>

        <iframe class="full-screen-preview__frame" src="http://html5fileupload.stbeets.nl/" name="preview-frame" frameborder="0" noresize="noresize"></iframe>


        <script>
            // Google Analytics Tracking Code
            (function () {
                (function (i, s, o, g, r, a, m) {
                    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date(); a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
                })

                  (window, document, 'script', 'upload01style/analytics.js', 'ga');

                var ACCOUNTS = ["b", "m"];
                window._envGaTrackerNames = ACCOUNTS;

                ga("create", "UA-11834194-36", "auto", { "name": "b", "allowLinker": true });
                ga("create", "UA-11834194-12", { "name": "m", "allowLinker": true });

                for (var i = 0; i < ACCOUNTS.length; i++) {
                    t = ACCOUNTS[i];

                    ga(t + '.require', 'linker');
                    ga(t + '.linker:autoLink', ["activeden.net", "audiojungle.net", "themeforest.net", "videohive.net", "graphicriver.net", "3docean.net", "codecanyon.net", "photodune.net", "market.envato.com", "market.styleguide.envato.com"]);

                    ga(t + '.require', 'ec');

                    ga(t + '.require', 'displayfeatures');

                    ga(t + '.require', 'linkid', 'linkid.html');


                    if ('') {
                        ga(t + '.send', {
                            hitType: 'pageview',
                            page: ''
                        });
                    } else if ('') {
                        // append the analytics_suffix to the page path so the flash alert/error type can be tracked
                        var analyticsSuffix = $.trim('').replace(/([A-Z])/g, '$1').replace(/[-_\s]+/g, '-').toLowerCase();
                        var uri = URI(window.location.pathname + window.location.search);
                        uri.path(uri.path() + '/' + analyticsSuffix);
                        var tracking_path = uri.path() + uri.search();
                        ga(t + '.send', {
                            hitType: 'pageview',
                            page: tracking_path,
                        });
                    } else {
                        ga(t + '.send', 'pageview');
                    }
                }
            }());


</script>



        <script>
            // GA: universal analytics link wrapper
            (function () {
                window._envTrkrs = [["b", "UA-11834194-36"], ["m", "UA-11834194-12"]];

                var debug = false;
                var MAX_RETRIES = 10;

                /*
                   The script needs to wait until the Analytics script
                   has been downloaded from Google before initializing
                */
                var waitForAnalytics = function () {
                    this.count = this.count || 0;

                    if (window.ga && ga.getByName) {
                        e.init();
                    } else {
                        if (count < MAX_RETRIES) { setTimeout(waitForAnalytics, 250); }
                        count++;
                    }
                };

                var e = {
                    _envArray: [],
                    _envTrkrs: (window._envTrkrsCust && window._envTrkrsCust.length) ? window._envTrkrs.concat(window._envTrkrsCust) : window._envTrkrs,
                    init: function () {
                        for (var i = 0; i < _envTrkrs.length; i++) {
                            if (!ga.getByName(_envTrkrs[i][0])) {
                                ga("create", _envTrkrs[i][1], "auto", { name: _envTrkrs[i][0], allowLinker: true });
                            }
                        }

                        document.addEventListener('DOMContentLoaded', function () {
                            e.wrapperInit();
                        });

                        if (debug) { console.log('Initiated'); }
                    },
                    wrapperInit: function () {
                        if (typeof window._envIsRunning != 'undefined' || window._envIsRunning == true) {
                            return
                        }
                        window._envIsRunning = true;

                        if (document.addEventListener) {
                            document.addEventListener('click', function (event) {
                                var target = event.target;
                                if (target && target.tagName === 'A') {
                                    e._envLinksTracker(event);
                                }
                            });
                        }
                    },
                    isInArray: function (e, t) {
                        for (var n = 0; n < t.length; n++) {
                            var r = new RegExp(t[n], 'i');
                            if (r.test(e)) {
                                return n
                            }
                        }
                        return -1
                    },
                    _envTrackevent: function (e, t, n, r) {
                        for (var i = 0; i < this._envTrkrs.length; i++) {
                            var s = this._envTrkrs[i][0].length == 0 ? '' : this._envTrkrs[i][0] + '.';
                            r.length == 0 ? ga(s + 'send', 'event', e, t, n) : ga(s + 'send', 'event', e, t, n, r)
                        }
                    },
                    _envTrackpageview: function (e, t) {
                        t = t.charAt(0) == '/' ? t : '/' + t;
                        for (var n = 0; n < this._envTrkrs.length; n++) {
                            var r = this._envTrkrs[n][0].length == 0 ? '' : this._envTrkrs[n][0] + '.';
                            ga(r + 'send', 'pageview', e + t);
                        }
                    },
                    _envLinksTracker: function (t) {
                        var r = false;
                        var i = {
                            outbound: {
                                run: true,
                                useEvent: true
                            },
                            download: {
                                run: true,
                                useEvent: true,
                                reg: ''
                            },
                            self: {
                                run: false,
                                useEvent: true
                            },
                            mail: {
                                run: true,
                                useEvent: true
                            },
                            ext: /\.(doc.?|xls.?|ppt.?|exe|zip|rar|gz|tar|tgz|dmg|csv|pdf|xpi|txt|mp3)$/i
                        };
                        var s = t.srcElement ? t.srcElement : this;
                        if (t.srcElement) {
                            r = true
                        }
                        while (s.tagName != 'A') {
                            s = s.parentNode
                        }
                        if (s.href == undefined || s.href == null) {
                            return true
                        }
                        var o = s.href;
                        if (o.length == 0) return;
                        var u = s.hostname.toLowerCase();
                        var a = s.pathname;
                        if (a.length == 0) {
                            a = 'http://codecanyon.net/'
                        } else if (a.substr(0, 1) != 'http://codecanyon.net/') {
                            a = '/' + a
                        }
                        var f = s.protocol;
                        var l = s.search;
                        var c = location.hostname;
                        c = c.replace(/^www\./i, '').toLowerCase();
                        u = u.replace(/^www\./i, '').toLowerCase();
                        if (o.match(/^#/)) {
                            if (i.self.run) {
                                i.self.useEvent ? e._envTrackevent('self', 'click - ' + c, o, '') : e._envTrackpageview('/virtual/self', '/' + o);
                                return true
                            }
                        } else if (f.match(/^mailto:/i)) {
                            if (i.mail.run) {
                                o = o.replace(/^mailto:/i, '');
                                i.mail.useEvent ? e._envTrackevent('mailto', 'click - ' + c, o, '') : e._envTrackpageview('/virtual/mailto', o);
                                return true
                            }
                        } else if ((new RegExp(i.ext)).test(a)) {
                            if (i.download.run) {
                                o = o.replace(/^https?:\/\//i, '');
                                i.download.useEvent ? e._envTrackevent('download', 'click - ' + c, o, '') : e._envTrackpageview('/virtual/download', o);
                                return true
                            }
                        } else if (u == undefined || u.length == 0 || f.match(/^javascript:/i)) {
                            return
                        } else if ((new RegExp(c + '$', 'i')).test(u) || (new RegExp(u + '$', 'i')).test(c)) {
                            if (i.download.run && i.download.reg.length != 0) {
                                if ((new RegExp(i.download.reg, 'i')).test(a + l)) {
                                    o = o.replace(/^https?:\/\//i, '');
                                    i.download.useEvent ? e._envTrackevent('download', 'click - ' + c, o, '') : e._envTrackpageview('/virtual/download', o);
                                    return true
                                }
                            }
                        } else if (u != c) {
                            if (e.isInArray(u, e._envArray) == -1) {
                                if (i.outbound.run) {
                                    i.outbound.useEvent ? e._envTrackevent('outbound', 'click - ' + c, u + a + l, '') : e._envTrackpageview('/virtual/outbound', u + a);
                                    return true
                                }
                            } else if (e.isInArray(u, e._envArray) != -1) {
                                var h = s.target;
                                if (h != null && h == '_blank') {
                                    if ((new RegExp(/_utma=/)).test(l)) {
                                        return true
                                    }
                                    var p = e._envTrkrs[0][0].length == 0 ? '' : _envTrkrs[0][0] + '.';
                                    return true
                                } else {
                                    return false
                                }
                            }
                        }
                    }
                };

                waitForAnalytics();
            })()
</script>


        <script type="text/javascript">
            var $mcGoal = { 'settings': { 'uuid': '01a7104df9f31fd41e34ccbed', 'dc': 'us1' } };
            (function () {
                var sp = document.createElement('script'); sp.type = 'text/javascript'; sp.async = true; sp.defer = true;
                sp.src = ('https:' == document.location.protocol ? 'https://s3.amazonaws.com/downloads.mailchimp.com' : 'http://downloads.mailchimp.com') + '/js/goal.min.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(sp, s);
            })();
</script>


        <script type="text/javascript">
            // Google AdWords Remarketing
            /* <![CDATA[ */
            var google_conversion_id = 1065398951;
            var google_conversion_label = "bdtlCM3-uQMQp-WC_AM";
            var google_custom_params = window.google_tag_params;
            var google_remarketing_only = true;
            /* ]]> */
</script>
        <script src="upload01style/f.txt"></script>
        <noscript>
  <div style="display:inline;">
    <img height="1" width="1" style="border-style:none;" alt="" src="http://googleads.g.doubleclick.net/pagead/viewthroughconversion/1065398951/?value=0&amp;amp;label=bdtlCM3-uQMQp-WC_AM&amp;amp;guid=ON&amp;amp;script=0"/>
  </div>
</noscript>




    </form>
</body>
</html>
