/***********************************************
* new �앹뾽 20210913
************************************************/
;(function ($) {
    $new_ui = {
        layerOpen : function (id, callback){
			var $id = $('#' + id);
            $('.ly-dim').remove();
            $id.before('<div class="ly-dim"></div>');
			$id.show();
            callback ? callback() : '';
        },
        layerClose : function (id){
            var $id = $('#' + id);
            $('.ly-dim').remove();
            $id.hide().removeClass('open').attr('tabindex', '');
        }
    }
})(jQuery);