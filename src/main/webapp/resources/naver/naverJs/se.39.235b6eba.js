webpackJsonpSmartEditorViewer([39], {
    584: function(t, e, n) {
        "use strict";
        /*! hammerjs-compatible - v0.0.2
         * Copyright (c) 2015 ; Licensed MIT */
        /**
         * @license addEventListener polyfill 1.0 / Eirik Backer / MIT Licence
         * https://gist.github.com/2864711/946225eb3822c203e8d6218095d888aac5e1748e
         * modified by egjs
         */
        /*! hammerjs-compatible - v0.0.2
         * Copyright (c) 2015 ; Licensed MIT */
        /**
         * @license addEventListener polyfill 1.0 / Eirik Backer / MIT Licence
         * https://gist.github.com/2864711/946225eb3822c203e8d6218095d888aac5e1748e
         * modified by egjs
         */
        (function(t, e, n) {
            if ((!t.addEventListener || !t.removeEventListener) && t.attachEvent && t.detachEvent) {
                var r = function(t) {
                    return typeof t === "function"
                };
                var o = function(t, e) {
                    var r = e[n];
                    if (r) {
                        var o;
                        var i = r.length;
                        while (i--) {
                            o = r[i];
                            if (o[0] === t) {
                                return o[1]
                            }
                        }
                    }
                };
                var i = function(t, e, r) {
                    var i = e[n] || (e[n] = []);
                    return o(t, e) || (i[i.length] = [t, r], r)
                };
                var a = function(t) {
                    var n = e[t];
                    e[t] = function(t) {
                        return f(n(t))
                    }
                };
                var c = function(n, o, a) {
                    a;
                    if (r(o)) {
                        var c = typeof this === "object" && "setInterval" in this ? this.document.body : this;
                        c.attachEvent("on" + n, i(c, o, function(n) {
                            n = n || t.event;
                            var r = {};
                            for (var i in n) {
                                r[i] = n[i]
                            }
                            r.preventDefault = function() {
                                n.returnValue = false
                            };
                            r.stopPropagation = function() {
                                n.cancelBubble = true
                            };
                            r.target = n.target || n.srcElement || e.documentElement;
                            r.currentTarget = n.currentTarget || c;
                            r.timeStamp = n.timeStamp || (new Date).getTime();
                            r.which = n.button === 0 ? 1 : n.button;
                            r.button = n.button === 1 ? 0 : n.button;
                            o.call(c, r)
                        }))
                    }
                };
                var u = function(t, e, n) {
                    n;
                    if (r(e)) {
                        var i = typeof this === "object" && "setInterval" in this ? this.document : this;
                        var a = o(i, e);
                        if (a) {
                            i.detachEvent("on" + t, a)
                        }
                    }
                };
                var f = function(t) {
                    var e = t.length;
                    if (e) {
                        while (e--) {
                            t[e].addEventListener = c;
                            t[e].removeEventListener = u
                        }
                    } else {
                        t.addEventListener = c;
                        t.removeEventListener = u
                    }
                    return t
                };
                f([e, t]);
                if ("Element" in t) {
                    var l = t.Element;
                    l.prototype.addEventListener = c;
                    l.prototype.removeEventListener = u
                } else {
                    e.attachEvent("onreadystatechange", function() {
                        f(e.all)
                    });
                    a("getElementsByTagName");
                    a("getElementById");
                    a("createElement");
                    f(e.all)
                }
            }
        })(window, document, "x-ms-event-listeners");
        if (!Array.isArray) {
            Array.isArray = function(t) {
                return Object.prototype.toString.call(t) === "[object Array]"
            }
        }
        if (!Date.now) {
            Date.now = function t() {
                return (new Date).getTime()
            }
        }
        if (typeof Object.create !== "function") {
            Object.create = function() {
                function t() {}
                var e = Object.prototype.hasOwnProperty;
                return function(n) {
                    if (typeof n !== "object") {
                        throw TypeError("Object prototype may only be an Object or null")
                    }
                    t.prototype = n;
                    var r = new t;
                    t.prototype = null;
                    if (arguments.length > 1) {
                        var o = Object(arguments[1]);
                        for (var i in o) {
                            if (e.call(o, i)) {
                                r[i] = o[i]
                            }
                        }
                    }
                    return r
                }
            }()
        }
        if (!Object.keys) {
            Object.keys = function() {
                var t = Object.prototype.hasOwnProperty,
                    e = !{
                        toString: null
                    }.propertyIsEnumerable("toString"),
                    n = ["toString", "toLocaleString", "valueOf", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "constructor"],
                    r = n.length;
                return function(o) {
                    if (typeof o !== "object" && (typeof o !== "function" || o === null)) {
                        throw new TypeError("Object.keys called on non-object")
                    }
                    var i = [],
                        a, c;
                    for (a in o) {
                        if (t.call(o, a)) {
                            i.push(a)
                        }
                    }
                    if (e) {
                        for (c = 0; c < r; c++) {
                            if (t.call(o, n[c])) {
                                i.push(n[c])
                            }
                        }
                    }
                    return i
                }
            }()
        }
        if (!String.prototype.trim) {
            String.prototype.trim = function() {
                return this.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, "")
            }
        }
    }
});