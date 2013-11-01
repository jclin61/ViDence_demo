$(document).on('page:change ready', function(){
	video_map()
	video_index_comment()
	welcome_page_scroll()
	scroll_to_position()

		function video_map(){
		$(".vid_map").gmap3({
			marker:{
				address: $(".vid_loc").val()
			},
			map:{
				options:{
					zoom:13
				}
			}
		});
		}

		function video_index_comment(){
			$(".video_index_comment_button").click(function(){
				var num = $(this).attr('data-switch');
				$(".com" + num).fadeToggle();
				$(this).toggleClass('btn-danger');
			});
		}

		function welcome_page_scroll(){
			$('section[data-type="background"]').each(function(){
				var $back_object = $(this);  //To Assign the object of section
				$(window).scroll(function(){
					var $window = $(window)
					var yPos = - ($window.scrollTop()/$back_object.data('speed'));
					
					// final background position here
					var coords = '50%' + yPos + 'px';

					// to move the background
					$back_object.css({backgroundPosition: coords});
				});
			});

		}

		function scroll_to_position(){
			$("#welcome_arrow").click(function(){
				$('html, body').animate({
					scrollTop: $("#welcome_home").offset().top
				}, 2000);
				});
			
		}

});