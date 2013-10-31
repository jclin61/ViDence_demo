$(document).on('page:change ready', function(){
	video_map()
	video_index_comment()

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
				$(".video_index_description").fadeToggle();
				$(".video_index_comment_button").toggleClass('btn-danger');
			});
		}

});