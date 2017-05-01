//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
    $('pre code').each(function(i, block) {
        hljs.highlightBlock(block);
    });
});