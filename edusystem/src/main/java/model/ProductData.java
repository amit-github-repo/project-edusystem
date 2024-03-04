package model;
public class ProductData{
	private String prodid;
	private String prodrate;
	private String prodqty;

	public String getProdId(){
		return prodid;
	}
	public void setProdId(String prodid){
		this.prodid = prodid;
	}

	public String getProdRate(){
		return prodrate;
	}
	public void setProdRate(String prodrate){
		this.prodrate = prodrate;
	}
	public String getProdQty(){
		return prodqty;
	}
	public void setProdQty(String prodqty){
		this.prodqty = prodqty;
	}
}