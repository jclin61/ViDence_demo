// Google Map Function using gmap3   
    // page change to load google map api + page load 
    $(document).on('page:change ready', function(){
        register_map()
        video_map()
        // note: autocomplete require on / off function so at least jQuery 1.7
        function register_map()
		{
            
            $("#reg_map").gmap3({
				map:{
					options:{
						zoom:0
				}}
			});
            
            $("#address").autocomplete({
                source: function() {
                    $("#reg_map").gmap3({
                        getaddress: {
                            address: $(this).val(),
                            callback: function(results){
                                if (!results) return;
                                $("#address").autocomplete("display", results, false);
                            }
                        }
                    });
                },
                cb:{
                    cast: function(item){
                        return item.formatted_address;
                    },
                    select: function(item) {
                        $("#reg_map").gmap3({
                            clear: "marker",
                            marker: {
                                latLng: item.geometry.location
                            },
                            map:{
                                options: {
                                    center: item.geometry.location,
                                    zoom: 10
                                }
                            }
                        });
                    }
                }
            })
            .focus();
        
        }

		function video_map(){

		$(".vid_map").gmap3({
			marker:{
				address: $(".vid_loc").val()
			},
			map:{
				options:{
					zoom:14
				}
			}
		});
		}

    });

