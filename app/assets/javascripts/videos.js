$(document).on('page:change ready', function(){
	video_map()
	video_index_comment()
	welcome_page_scroll()
	scroll_to_position()
	locate_all_map()
	auto_complete_allmap()
	locate_tool_tip()

	// This needs to be repaired. bootstrap interferes with position
	// fixed_side_bar()

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


		function locate_all_map(){

		      var globalCluster;
		    
		      $(function(){
		        $('#map_all').gmap3({ 
		          map:{
		            options:{
		              center:[30.2500, -97.7500],
		              zoom: 8,
		              mapTypeId: google.maps.MapTypeId.TERRAIN
		            },
		            events:{
		              click: function(map, event){
		                addMarkerToCluster($(this), event.latLng);
		              },
		              rightclick: function(map, event){
		                addMarkersToCluster($(this), event.latLng);
		              }
		            },
		            callback: function(map){
		              waitForBounds(map);
		            }
		          }
		        });
		      });
		      
		      function waitForBounds(map){
		        var ne, sw, bounds = map.getBounds();
		        if (!bounds){
		          google.maps.event.addListenerOnce(map, 'bounds_changed', 
		            function() {
		              waitForBounds(map)
		            }
		          );
		          return;
		        }
		        ne = bounds.getNorthEast();
		        sw = bounds.getSouthWest();
		        randomMarkers(ne.lat(), sw.lng(), sw.lat(), ne.lng());
		      }
		      
		      function randomMarkers(lat1, lng1, lat2, lng2){
		        var i, list = [], rlat=lat2-lat1, rlng=lng2-lng1, lat, lng;
		        for(i=0; i<1000; i++){
		          lat = lat1 + rlat * Math.random();
		          lng = lng1 + rlng * Math.random();
		          list.push({latLng:[lat, lng]});
		        }
		        $('#map_all').gmap3({
		          marker:{
		            values: list,
		            cluster:{
		              radius: 100,
		              events:{
		            	 mouseover: function(cluster, event){
		            	   $(cluster.main.getDOMElement()).css('border', '1px solid #FF0000');
		            	 },
		            	 mouseout: function(cluster, event){
		            	   $(cluster.main.getDOMElement()).css('border', '0px');
		            	 }
		            	},
		          		// This style will be used for clusters with more than 0 markers
		          		0: {
		          		  content: '<div class="cluster cluster-1">CLUSTER_COUNT</div>',
		          			width: 53,
		          			height: 52
		          		},
		          		// This style will be used for clusters with more than 20 markers
		          		20: {
		          		  content: '<div class="cluster cluster-2">CLUSTER_COUNT</div>',
		          			width: 56,
		          			height: 55
		          		},
		          		// This style will be used for clusters with more than 50 markers
		          		50: {
		          		  content: '<div class="cluster cluster-3">CLUSTER_COUNT</div>',
		          			width: 66,
		          			height: 65
		          		}
		          	},
		          	callback: function(cluster){ // get the cluster and save it in global variable
		          	 globalCluster = cluster;
		          	}
		          }
		        });
		      }
		      
		      function addMarkerToCluster($this, latLng){
		        $this.gmap3({
		          marker:{
		            latLng:latLng,
		            cluster:globalCluster
		          }
		        });  
		      }
		      
		      function addMarkersToCluster($this, latLng){
		        var lat = latLng.lat(), 
		            lng = latLng.lng(),
		            dy = (1/60),
		            dx = 1/(60* Math.cos(Math.PI * lat / 180)),
		            miles = 15,
		            list = [];
		        list.push([lat, lng]);
		        list.push([lat+miles*dy, lng]);
		        list.push([lat-miles*dy, lng]);
		        list.push([lat, lng+miles*dx]);
		        list.push([lat, lng-miles*dx]);
		            
		      $this.gmap3({ 
		        marker:{
		          values: list,
		          cluster:globalCluster
		        }
		      });
		    }
		}

		

		function auto_complete_allmap(){

			$("#locate_all_address").autocomplete({
                source: function() {
                    $("#map_all").gmap3({
                        getaddress: {
                            address: $(this).val(),
                            callback: function(results){
                                if (!results) return;
                                $("#locate_all_address").autocomplete("display", results, false);
                            }
                        }
                    });
                },
                cb:{
                    cast: function(item){
                        return item.formatted_address;
                    },
                    select: function(item) {
                        $("#map_all").gmap3({
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

        function locate_tool_tip(){
			    $(function() {
			    $("#locate_all_address" ).tooltip();
			  });
        }

        function fixed_side_bar(){
		  jQuery(function($) {
		    function fixDiv() {
		      var $cache = $('.side_bar'); 
		      if ($(window).scrollTop() > 100) 
		        $cache.css({'position': 'fixed', 'top': '10px'}); 
		      else
		        $cache.css({'position': 'relative', 'top': 'auto'});
		    }
		    $(window).scroll(fixDiv);
		    fixDiv();
});
        }
});