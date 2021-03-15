package com.test.imsi;

public class CartVO {
   private int cartno;
   private String id;
   private String productsubject;
   private String productcolor;
   private String productsize;
   private int productprice;
   private int productamount;
   private String stored_fname;
   
   public CartVO()
   {   }

   public CartVO(int cartno, String id, String productsubject, String productcolor, String productsize,
         int productprice, int productamount, String stored_fname) {
      super();
      this.cartno = cartno;
      this.id = id;
      this.productsubject = productsubject;
      this.productcolor = productcolor;
      this.productsize = productsize;
      this.productprice = productprice;
      this.productamount = productamount;
      this.stored_fname = stored_fname;
   }

   public int getCartno() {
      return cartno;
   }

   public void setCartno(int cartno) {
      this.cartno = cartno;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getProductsubject() {
      return productsubject;
   }

   public void setProductsubject(String productsubject) {
      this.productsubject = productsubject;
   }

   public String getProductcolor() {
      return productcolor;
   }

   public void setProductcolor(String productcolor) {
      this.productcolor = productcolor;
   }

   public String getProductsize() {
      return productsize;
   }

   public void setProductsize(String productsize) {
      this.productsize = productsize;
   }

   public int getProductprice() {
      return productprice;
   }

   public void setProductprice(int productprice) {
      this.productprice = productprice;
   }

   public int getProductamount() {
      return productamount;
   }

   public void setProductamount(int productamount) {
      this.productamount = productamount;
   }

   public String getStored_fname() {
      return stored_fname;
   }

   public void setStored_fname(String stored_fname) {
      this.stored_fname = stored_fname;
   }
   
}