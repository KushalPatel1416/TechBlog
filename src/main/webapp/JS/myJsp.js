
function doLike(pid,uid){
	
	
	console.log(pid+","+uid)
	
	const d={
		
		pid : pid,
		uid : uid,
		operation : 'like'
		}
		
		$.ajax({
			url : "LikeServlet",
			data : d,
			
			success :function(data , textStatus , jqXHR){
				console.log(data);
				if(data.trim()=="true"){
				
					let c = $(".like-counter-"+pid).html();
					c++;
					$('.like-counter-'+pid).html(c);
					
					}
		
				
				
			},
			 error : function(jqXHR ,textStatus , errorThrown){
				 console.log(data);
			 }
			
			
		})
		
		
	
	
}