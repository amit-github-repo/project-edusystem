<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product Page</title>
	</head>
	<body>
		<form method="post" action="/PutData" onsubmit="return validate()">
		Product Name : <input type="text" id="prodname" name="prodname" />
		<br />
		Product Rate : <input type="text" id="prodrate" name="prodrate" />
		<br />
		 Product Qty : <input type="text" id="prodqty" name="prodqty" /> <!--<span id="pq"></span>  -->
		<br />
		<input type="hidden" id="prodid" name="prodid" />
		<input type="hidden" id="oldqty" name="oldqty" />
		<br />
		<input type="submit" value="AddCart" />

		<p id="demo" />	
	</form>

	<%--	Java Script code	--%>
	<script type="text/javascript" src="js/jqcdnlink.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#prodname").blur(function(){
				prodname=$("#prodname").val();
				//alert(prodname);
				$.ajax({
					url:"/GetProduct",
					type:"POST",
					dataType:"JSON",
					data:{prodname:prodname},
					success:function(res){
						//alert(res);
						json_text=JSON.stringify(res);
						obj=JSON.parse(json_text);
						//alert(obj.prodId);
						$("#prodrate").val(obj.prodRate);
						$("#prodqty").val(obj.prodQty);
						
						$("#prodid").val(obj.prodId);
						$("#oldqty").val(obj.prodQty);		
					}
				})
			
			})
		})	
	</script>
	<script type="text/javascript">
		function validate() {
			var userQty=parseInt(document.getElementById('prodqty').value);
			var realQty=+document.getElementById('oldqty').value;
			//alert(userQty+","+realQty);
			if(userQty < realQty){
				return true;
			}
			document.getElementById('demo').innerHTML="  Your Quantity must less than "+realQty;
			return false;
		} 
	</script>
	<%--	Java Script code	--%>
	</body>
</html>
