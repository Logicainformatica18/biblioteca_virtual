/**
 * Super simple wysiwyg editor v@VERSION
 * http://materialnote.org/
 *
 * materialnote.js
 * Copyright 2017 CK and other contributors
 * based on summernote.js, copyright 2013- Alan Hong. and other contributors
 * materialnote may be freely distributed under the MIT license./
 *
 * Date: @DATE
 */
(function (factory) {
  /* global define */
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module.
    define(['jquery'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // Node/CommonJS
    module.exports = factory(require('jquery'));
  } else {
    // Browser globals
    factory(window.jQuery);
  }
}(function ($) {
  'use strict';
