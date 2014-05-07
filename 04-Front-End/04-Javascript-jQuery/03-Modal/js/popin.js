(function($){
    $.extend($.fn, {
        popin: function() {
            var images = this;

            this.css('cursor', 'pointer');

            images.on('click', function() {
                var self = $(this);
                createPopin(self);
            });

            var createPopin = (function(img) {
                var self  = this,
                    image = img.clone().css('opacity', 0),
                    popin = $('<div class="popin"></div>'),
                    bg    = $('<div class="background"></div>'),
                    imgContainer = $('<div class="container"></div>');

                bg.on('click', function() { $(this).parent('.popin').remove(); });

                popin.prepend(bg);
                popin.append(imgContainer);

                $('body').prepend(popin);

                displayImage(imgContainer, image);
            });

            var displayImage = (function(container, image) {
                var width = image.attr('data-modal-width');
                var height = image.attr('data-modal-height');

                container.empty();
                container.append(image);

                image.css({ width: width, height: height });
                image.animate({ opacity: 1 }, "fast");
            });

            return this;
        }
    })
})(jQuery);
