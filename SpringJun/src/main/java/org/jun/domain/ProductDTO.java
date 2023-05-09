package org.jun.domain;


public class ProductDTO {
	private int pno;
	private String pname;
	private String pimgname;
	private boolean pimage;
	private String pcontent;
	private int pprice;
	private int pbargain;
	private String pdate;
	private String pbrand;
	private int pstar;
	private int preveiw;
	private String puuid;
	private String puploadpath;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPimgname() {
		return pimgname;
	}
	public void setPimgname(String pimgname) {
		this.pimgname = pimgname;
	}
	public boolean isPimage() {
		return pimage;
	}
	public void setPimage(boolean pimage) {
		this.pimage = pimage;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPbargain() {
		return pbargain;
	}
	public void setPbargain(int pbargain) {
		this.pbargain = pbargain;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPbrand() {
		return pbrand;
	}
	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}
	public int getPstar() {
		return pstar;
	}
	public void setPstar(int pstar) {
		this.pstar = pstar;
	}
	public int getPreveiw() {
		return preveiw;
	}
	public void setPreveiw(int preveiw) {
		this.preveiw = preveiw;
	}
	public String getPuuid() {
		return puuid;
	}
	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}
	public String getPuploadpath() {
		return puploadpath;
	}
	public void setPuploadpath(String puploadpath) {
		this.puploadpath = puploadpath;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [pno=" + pno + ", pname=" + pname + ", pimgname=" + pimgname + ", pimage=" + pimage
				+ ", pcontent=" + pcontent + ", pprice=" + pprice + ", pbargain=" + pbargain + ", pdate=" + pdate
				+ ", pbrand=" + pbrand + ", pstar=" + pstar + ", preveiw=" + preveiw + ", puuid=" + puuid
				+ ", puploadpath=" + puploadpath + "]";
	}
	
	

	
	
	
	
}
