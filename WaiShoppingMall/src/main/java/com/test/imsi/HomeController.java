package com.test.imsi;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public ModelAndView home1(ModelAndView mv) {
	      
	      
/*	      List <ProductVO> list1 = ProductDAO.mainProductList("상의");
	      List <ProductVO> list2 = ProductDAO.mainProductList("하의");
	      List <ProductVO> list3 = ProductDAO.mainProductList("신발");
	      List <ProductVO> list4 = ProductDAO.mainProductList("가방");
	      List <ProductVO> list5 = ProductDAO.mainProductList("액세서리");*/
	      
	      List <ProductVO> list = ProductDAO.productNew(); 
	      
/*	      mv.addObject("mlist1", list1);
	      mv.addObject("mlist2", list2);
	      mv.addObject("mlist3", list3);
	      mv.addObject("mlist4", list4);
	      mv.addObject("mlist5", list5);*/
	      
	      mv.addObject("mlist",list);
	      
	      
	      mv.setViewName("User_Main");
	      
	      
	      
	      
	      return mv;
	   }
	
	@RequestMapping(value = "/goaboutcompany" , method = RequestMethod.GET)
	public ModelAndView goaboutcompany(ModelAndView mv,HttpServletRequest req)
	{
		mv.setViewName("about_company");
		return mv;
	}
	//회사 소개
	
	/*@RequestMapping(value = "/admin_Main", method = RequestMethod.GET)
	public ModelAndView home2(ModelAndView mv) {
		 List <ProductVO> list1 = ProductDAO.mainProductList("상의");
	      List <ProductVO> list2 = ProductDAO.mainProductList("하의");
	      List <ProductVO> list3 = ProductDAO.mainProductList("신발");
	      List <ProductVO> list4 = ProductDAO.mainProductList("가방");
	      List <ProductVO> list5 = ProductDAO.mainProductList("액세서리");
	      
	      mv.addObject("mlist1", list1);
	      mv.addObject("mlist2", list2);
	      mv.addObject("mlist3", list3);
	      mv.addObject("mlist4", list4);
	      mv.addObject("mlist5", list5);
		mv.setViewName("admin_Main");
		return mv;
	} 
	*/
	//-------------------------카테고리------------------------------
	@RequestMapping(value = "/M_Top", method = RequestMethod.GET)
	public ModelAndView M_Top(ModelAndView mv , HttpServletRequest req) 
	{
       int page = 1;
        
       if(req.getParameter("page")!=null)
       {
          page = Integer.parseInt(req.getParameter("page"));
       }
       
       Map <String,Object> map1 = new HashMap <String,Object>();
       map1.put("productcategory", "상의");
       map1.put("productgender", "남");
       
       int totalnum = ProductDAO.productgenderNum(map1);
       
       int totalnum2 = ((totalnum-1)/6)+1;
       
       Map <String,Object> map2 = new HashMap <String,Object>();
       List <ProductVO> list = new ArrayList <ProductVO>();
       
       if(req.getParameter("viewmethod")!=null)
       {
    	   String view = req.getParameter("viewmethod");
    	   mv.addObject("viewmethod",view);
    	   System.out.println(view);
    	   
    	   switch(view)
    	   {
    	   case "productdate" : 
    	       map2.put("page", page);
    	       map2.put("totalnum", totalnum);
    	       map2.put("productcategory", "상의");
    	       map2.put("productgender", "남");
    	       map2.put("viewmethod","productdate");
    			
    	       list = ProductDAO.productgenderPaging(map2);
    		   break;
    		   
    	   case "productpriceup" :
    	       map2.put("page", page);
    	       map2.put("totalnum", totalnum);
    	       map2.put("productcategory", "상의");
    	       map2.put("productgender", "남");
    	       map2.put("viewmethod","productpriceup");

    			
    	       list = ProductDAO.productgenderPaging(map2);
    	       break;
    	       
    	   case "productpricedown" : 
    	       map2.put("page", page);
    	       map2.put("totalnum", totalnum);
    	       map2.put("productcategory", "상의");
    	       map2.put("productgender", "남");
    	       map2.put("viewmethod","productpricedown");
    			
    	       list = ProductDAO.productgenderPaging(map2);
    	       break;
    	   }
       }
       else
       {
           map2.put("page", page);
           map2.put("totalnum", totalnum);
           map2.put("productcategory", "상의");
           map2.put("productgender", "남");
           map2.put("viewmethod","productdate");

           
    		
           list = ProductDAO.productgenderPaging(map2);
       }
       
       
       mv.addObject("mlist", list);
       mv.addObject("totalnum2",totalnum2);
       mv.setViewName("category/M_Top");
		
		return mv;
	}
	
	@RequestMapping(value = "/M_Bottom", method = RequestMethod.GET)
	public ModelAndView M_Bottom(ModelAndView mv , HttpServletRequest req) {
		
		
	       int page = 1;
	        
	       if(req.getParameter("page")!=null)
	       {
	          page = Integer.parseInt(req.getParameter("page"));
	       }
	       
	       Map <String,Object> map1 = new HashMap <String,Object>();
	       map1.put("productcategory", "하의");
	       map1.put("productgender", "남");
	       
	       int totalnum = ProductDAO.productgenderNum(map1);
	       
	       int totalnum2 = ((totalnum-1)/6)+1;
	       
	       Map <String,Object> map2 = new HashMap <String,Object>();
	       List <ProductVO> list = new ArrayList <ProductVO>();
	       
	       if(req.getParameter("viewmethod")!=null)
	       {
	    	   String view = req.getParameter("viewmethod");
	    	   mv.addObject("viewmethod",view);
	    	   System.out.println(view);
	    	   
	    	   switch(view)
	    	   {
	    	   case "productdate" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "하의");
	    	       map2.put("productgender", "남");
	    	       map2.put("viewmethod","productdate");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    		   break;
	    		   
	    	   case "productpriceup" :
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "하의");
	    	       map2.put("productgender", "남");
	    	       map2.put("viewmethod","productpriceup");

	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	       
	    	   case "productpricedown" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "하의");
	    	       map2.put("productgender", "남");
	    	       map2.put("viewmethod","productpricedown");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	   }
	       }
	       else
	       {
	           map2.put("page", page);
	           map2.put("totalnum", totalnum);
	           map2.put("productcategory", "하의");
	           map2.put("productgender", "남");
	           map2.put("viewmethod","productdate");

	           
	    		
	           list = ProductDAO.productgenderPaging(map2);
	       }
	       
	       
		
		mv.addObject("mlist", list);
		mv.addObject("totalnum2",totalnum2);
		mv.setViewName("category/M_Bottom");
		
		return mv;
	}
	
	
	@RequestMapping(value = "/W_Top", method = RequestMethod.GET)
	public ModelAndView W_Top(ModelAndView mv , HttpServletRequest req) 
	{
	       int page = 1;
	        
	       if(req.getParameter("page")!=null)
	       {
	          page = Integer.parseInt(req.getParameter("page"));
	       }
	       
	       Map <String,Object> map1 = new HashMap <String,Object>();
	       map1.put("productcategory", "상의");
	       map1.put("productgender", "여");
	       
	       int totalnum = ProductDAO.productgenderNum(map1);
	       
	       int totalnum2 = ((totalnum-1)/6)+1;
	       
	       Map <String,Object> map2 = new HashMap <String,Object>();
	       List <ProductVO> list = new ArrayList <ProductVO>();
	       
	       if(req.getParameter("viewmethod")!=null)
	       {
	    	   String view = req.getParameter("viewmethod");
	    	   mv.addObject("viewmethod",view);
	    	   System.out.println(view);
	    	   
	    	   switch(view)
	    	   {
	    	   case "productdate" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "상의");
	    	       map2.put("productgender", "여");
	    	       map2.put("viewmethod","productdate");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    		   break;
	    		   
	    	   case "productpriceup" :
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "상의");
	    	       map2.put("productgender", "여");
	    	       map2.put("viewmethod","productpriceup");

	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	       
	    	   case "productpricedown" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "상의");
	    	       map2.put("productgender", "여");
	    	       map2.put("viewmethod","productpricedown");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	   }
	       }
	       else
	       {
	           map2.put("page", page);
	           map2.put("totalnum", totalnum);
	           map2.put("productcategory", "상의");
	           map2.put("productgender", "여");
	           map2.put("viewmethod","productdate");

	           
	    		
	           list = ProductDAO.productgenderPaging(map2);
	       }
	       
	       
		
		mv.addObject("mlist", list);
		mv.addObject("totalnum2",totalnum2);
		mv.setViewName("category/M_Top");
		
		return mv;
	}
	
	@RequestMapping(value = "/W_Bottom", method = RequestMethod.GET)
	public ModelAndView W_Bottom(ModelAndView mv , HttpServletRequest req) {
		
		
	       int page = 1;
	        
	       if(req.getParameter("page")!=null)
	       {
	          page = Integer.parseInt(req.getParameter("page"));
	       }
	       
	       Map <String,Object> map1 = new HashMap <String,Object>();
	       map1.put("productcategory", "하의");
	       map1.put("productgender", "여");
	       
	       int totalnum = ProductDAO.productgenderNum(map1);
	       
	       int totalnum2 = ((totalnum-1)/6)+1;
	       
	       Map <String,Object> map2 = new HashMap <String,Object>();
	       List <ProductVO> list = new ArrayList <ProductVO>();
	       
	       if(req.getParameter("viewmethod")!=null)
	       {
	    	   String view = req.getParameter("viewmethod");
	    	   mv.addObject("viewmethod",view);
	    	   System.out.println(view);
	    	   
	    	   switch(view)
	    	   {
	    	   case "productdate" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "하의");
	    	       map2.put("productgender", "여");
	    	       map2.put("viewmethod","productdate");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    		   break;
	    		   
	    	   case "productpriceup" :
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "하의");
	    	       map2.put("productgender", "여");
	    	       map2.put("viewmethod","productpriceup");

	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	       
	    	   case "productpricedown" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "하의");
	    	       map2.put("productgender", "여");
	    	       map2.put("viewmethod","productpricedown");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	   }
	       }
	       else
	       {
	           map2.put("page", page);
	           map2.put("totalnum", totalnum);
	           map2.put("productcategory", "하의");
	           map2.put("productgender", "여");
	           map2.put("viewmethod","productdate");

	           
	    		
	           list = ProductDAO.productgenderPaging(map2);
	       }
	       
	       
		
		mv.addObject("mlist", list);
		mv.addObject("totalnum2",totalnum2);
		mv.setViewName("category/M_Bottom");
		
		return mv;
	}
	
	@RequestMapping(value = "/shoes", method = RequestMethod.GET)
	public ModelAndView shoes(ModelAndView mv,HttpServletRequest req) {
		
		
	       int page = 1;
	        
	       if(req.getParameter("page")!=null)
	       {
	          page = Integer.parseInt(req.getParameter("page"));
	       }
	       
	       Map <String,Object> map1 = new HashMap <String,Object>();
	       map1.put("productcategory", "신발");
	       map1.put("productgender", "unisex");
	       
	       int totalnum = ProductDAO.productgenderNum(map1);
	       
	       int totalnum2 = ((totalnum-1)/6)+1;
	       
	       Map <String,Object> map2 = new HashMap <String,Object>();
	       List <ProductVO> list = new ArrayList <ProductVO>();
	       
	       if(req.getParameter("viewmethod")!=null)
	       {
	    	   String view = req.getParameter("viewmethod");
	    	   mv.addObject("viewmethod",view);
	    	   System.out.println(view);
	    	   
	    	   switch(view)
	    	   {
	    	   case "productdate" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "신발");
	    	       map2.put("productgender", "unisex");
	    	       map2.put("viewmethod","productdate");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    		   break;
	    		   
	    	   case "productpriceup" :
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "신발");
	    	       map2.put("productgender", "unisex");
	    	       map2.put("viewmethod","productpriceup");

	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	       
	    	   case "productpricedown" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "신발");
	    	       map2.put("productgender", "unisex");
	    	       map2.put("viewmethod","productpricedown");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	   }
	       }
	       else
	       {
	           map2.put("page", page);
	           map2.put("totalnum", totalnum);
	           map2.put("productcategory", "신발");
	           map2.put("productgender", "unisex");
	           map2.put("viewmethod","productdate");

	           
	    		
	           list = ProductDAO.productgenderPaging(map2);
	       }
	       
	       
		
		mv.addObject("mlist", list);
		mv.addObject("totalnum2",totalnum2);
		mv.setViewName("category/shoes");
		
		return mv;
	}
	
	@RequestMapping(value = "/bag", method = RequestMethod.GET)
	public ModelAndView bag(ModelAndView mv , HttpServletRequest req) {
		
		
	       int page = 1;
	        
	       if(req.getParameter("page")!=null)
	       {
	          page = Integer.parseInt(req.getParameter("page"));
	       }
	       
	       Map <String,Object> map1 = new HashMap <String,Object>();
	       map1.put("productcategory", "가방");
	       map1.put("productgender", "unisex");
	       
	       int totalnum = ProductDAO.productgenderNum(map1);
	       
	       int totalnum2 = ((totalnum-1)/6)+1;
	       
	       Map <String,Object> map2 = new HashMap <String,Object>();
	       List <ProductVO> list = new ArrayList <ProductVO>();
	       
	       if(req.getParameter("viewmethod")!=null)
	       {
	    	   String view = req.getParameter("viewmethod");
	    	   mv.addObject("viewmethod",view);
	    	   System.out.println(view);
	    	   
	    	   switch(view)
	    	   {
	    	   case "productdate" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "가방");
	    	       map2.put("productgender", "unisex");
	    	       map2.put("viewmethod","productdate");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    		   break;
	    		   
	    	   case "productpriceup" :
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "가방");
	    	       map2.put("productgender", "unisex");
	    	       map2.put("viewmethod","productpriceup");

	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	       
	    	   case "productpricedown" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "가방");
	    	       map2.put("productgender", "unisex");
	    	       map2.put("viewmethod","productpricedown");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	   }
	       }
	       else
	       {
	           map2.put("page", page);
	           map2.put("totalnum", totalnum);
	           map2.put("productcategory", "가방");
	           map2.put("productgender", "unisex");
	           map2.put("viewmethod","productdate");

	           
	    		
	           list = ProductDAO.productgenderPaging(map2);
	       }
	       
	       
		
		mv.addObject("mlist", list);
		mv.addObject("totalnum2",totalnum2);
		mv.setViewName("category/bag");
		
		return mv;
	}
	
	@RequestMapping(value = "/Accessories", method = RequestMethod.GET)
	public ModelAndView Accessories(ModelAndView mv , HttpServletRequest req) {
		
		
	       int page = 1;
	        
	       if(req.getParameter("page")!=null)
	       {
	          page = Integer.parseInt(req.getParameter("page"));
	       }
	       
	       Map <String,Object> map1 = new HashMap <String,Object>();
	       map1.put("productcategory", "액세서리");
	       map1.put("productgender", "unisex");
	       
	       int totalnum = ProductDAO.productgenderNum(map1);
	       
	       int totalnum2 = ((totalnum-1)/6)+1;
	       
	       Map <String,Object> map2 = new HashMap <String,Object>();
	       List <ProductVO> list = new ArrayList <ProductVO>();
	       
	       if(req.getParameter("viewmethod")!=null)
	       {
	    	   String view = req.getParameter("viewmethod");
	    	   mv.addObject("viewmethod",view);
	    	   System.out.println(view);
	    	   
	    	   switch(view)
	    	   {
	    	   case "productdate" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "액세서리");
	    	       map2.put("productgender", "unisex");
	    	       map2.put("viewmethod","productdate");
	    	    	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    		   break;
	    		   
	    	   case "productpriceup" :
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "액세서리");
	    	       map2.put("productgender", "unisex");
	    	       map2.put("viewmethod","productpriceup");

	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	       
	    	   case "productpricedown" : 
	    	       map2.put("page", page);
	    	       map2.put("totalnum", totalnum);
	    	       map2.put("productcategory", "액세서리");
	    	       map2.put("productgender", "unisex");
	    	       map2.put("viewmethod","productpricedown");
	    			
	    	       list = ProductDAO.productgenderPaging(map2);
	    	       break;
	    	   }
	       }
	       else
	       {
	           map2.put("page", page);
	           map2.put("totalnum", totalnum);
	           map2.put("productcategory", "액세서리");
	           map2.put("productgender", "unisex");
	           map2.put("viewmethod","productdate");

	           
	    		
	           list = ProductDAO.productgenderPaging(map2);
	       }
	       
	       
		
		mv.addObject("mlist", list);
		mv.addObject("totalnum2",totalnum2);
		mv.setViewName("category/Accessories");
		
		return mv;
	}
	
	@RequestMapping(value = "/gohome" , method = RequestMethod.GET)
	   public String gohome(ModelAndView mv,HttpServletRequest req)
	   {   
	      String id = req.getParameter("id");
	      HttpSession hs = req.getSession();
	      
	      if(id!=null)
	         hs.setAttribute("loginid", id);
	      
	      return "redirect:/";
	   }   
	   
    @RequestMapping(value = "/mypage", method = RequestMethod.GET)
    public ModelAndView mypage(Locale locale, HttpServletRequest req, ModelAndView mv ) {
     
       HttpSession hs = req.getSession();
        String id = (String) hs.getAttribute("loginid");
       
       if(id!=null)
          hs.setAttribute("loginid", id);

       MemberVO loginvo =  (MemberVO) hs.getAttribute("loginvo");
       
       List <OrderhistoryVO> list1 = OrderhistoryDAO.orderhistoryMyList(id);
       
       
       mv.addObject("list1", list1);
       mv.addObject("mloginvo", loginvo);
       mv.setViewName("mypage");
       return mv;
    }
	   
	   @RequestMapping(value = "/gomyinfo", method = RequestMethod.GET)
	   public ModelAndView myinfo(ModelAndView mv, Locale locale, HttpServletRequest req) {
		 
		   	String id = req.getParameter("id");
		      HttpSession hs = req.getSession();
		      
		      if(id!=null)
		         hs.setAttribute("loginid", id);
	      
	      return mv;
	   }

	   @RequestMapping(value = "/myPoint", method = RequestMethod.GET)
	   public ModelAndView myPoint(ModelAndView mv, Locale locale, HttpServletRequest req) {
	      
		   HttpSession hs = req.getSession();   
	          String user = (String) hs.getAttribute("loginid");
	          MemberVO loginvo =  (MemberVO) hs.getAttribute("loginvo");
		      
			  mv.addObject("mloginvo", loginvo);
	         
			  int check = 0;
	          int page = 1;
	         
	         if(req.getParameter("page")!=null)
	         {
	            page = Integer.parseInt(req.getParameter("page"));
	         }
	         
	         int totalnum = PointDAO.MyPointNum(user);
	         
	         int totalnum2 = ((totalnum-1)/10)+1;
	         
	         Map <String,Object> map1 = new HashMap <String,Object>();
	         map1.put("page", page);
	         map1.put("totalnum", totalnum);
	         map1.put("id", user);
	         
	         List <PointVO> list1 = PointDAO.myPointPaging(map1);
	         if(list1.size() != 0) {
				   check=1;
			  }
	         mv.addObject("list1",list1);
	         
	         mv.addObject("totalnum2" , totalnum2);   
	         mv.addObject("page",page);
	         mv.addObject("check",check);
	         
	         mv.setViewName("myPoint");
	         
	         return mv;
	   }
	   
	   @RequestMapping(value = "/myQnA", method = RequestMethod.GET)
	      public ModelAndView myQnA(ModelAndView mv, HttpServletRequest req) 
	      {
	          HttpSession hs = req.getSession();   
	          String user = (String) hs.getAttribute("loginid");
	          MemberVO loginvo =  (MemberVO) hs.getAttribute("loginvo");
		      
			  mv.addObject("mloginvo", loginvo);
	         
			  int check = 0;
	          int page = 1;
	         
	         if(req.getParameter("page")!=null)
	         {
	            page = Integer.parseInt(req.getParameter("page"));
	         }
	         
	         int totalnum = QnaboardDAO.qnaboardMyNum(user);
	         
	         int totalnum2 = ((totalnum-1)/15)+1;
	         
	         Map <String,Object> map1 = new HashMap <String,Object>();
	         map1.put("page", page);
	         map1.put("totalnum", totalnum);
	         map1.put("memberid", user);
	         
	         List <QnaboardVO> list1 = QnaboardDAO.qnaboardMyPaging(map1);
	         if(list1.size() != 0) {
				   check=1;
			  }
	         mv.addObject("list1",list1);
	         
	         mv.addObject("totalnum2" , totalnum2);   
	         mv.addObject("page",page);
	         mv.addObject("check",check);
	         
	         mv.setViewName("myQnA");
	         
	         return mv;
	      }
	      
	      @RequestMapping(value = "/contents3" , produces = "application/json")
	      public @ResponseBody Map<String,Object> contents3(@RequestBody Map<String, Object> params , HttpServletRequest req)
	      {
	         int number =(Integer) params.get("number");
	         int page =(Integer) params.get("page");
	         
	         QnaboardVO qvo = QnaboardDAO.qnaboardSearchData(number);
	         
	         HttpSession hs = req.getSession();   
	         String user = (String) hs.getAttribute("loginid");
	         
	         int totalnum = QnaboardDAO.qnaboardMyNum(user);
	         
	         Map <String,Object> map2 = new HashMap <String,Object>();
	         map2.put("page", page);
	         map2.put("totalnum", totalnum);
	         map2.put("memberid", user);
	         
	         List <QnaboardVO> list1 = QnaboardDAO.qnaboardMyPaging(map2);
	         
	         Map <String,Object> map1 = new HashMap <String,Object>();
	         
	         map1.put("number1", number);
	         
	         map1.put("content1", qvo.getQnacontents());
	         
	         map1.put("list2" , list1);
	         
	         map1.put("qnaanswercontent", qvo.getQnaanswercontents());
	         
	         map1.put("page", page);
	      
	         return map1;
	      }
	      
	   
	   
	      @RequestMapping(value = "/myreview" , method = RequestMethod.GET)
		   public ModelAndView myreivew(ModelAndView mv,HttpServletRequest req){
		      
			   HttpSession session = req.getSession();
			   String user=(String)session.getAttribute("loginid");
			   MemberVO loginvo =  (MemberVO) session.getAttribute("loginvo");
			      
			   mv.addObject("mloginvo", loginvo);
			   System.out.println(user);
			   int check = 0;
			   int page = 1;
			   			
			   if(req.getParameter("page") != null) {
				   page = Integer.parseInt(req.getParameter("page"));
			   }
			   
			   int totalnum = ReviewDAO.mypageNum(user);
			   System.out.println(totalnum);
			   int totalnum2 = ((totalnum-1)/10)+1;
			   System.out.println(totalnum2);

			   Map <String,Object> map1 = new HashMap <String,Object>();
			   			map1.put("page", page);
			   			map1.put("totalnum", totalnum);
			   			map1.put("user", user);
			   			

			   List <ReviewVO> reviewList = ReviewDAO.reviewPaging(map1);
			   if(reviewList.size() != 0) {
				   check=1;
			   }
			   mv.addObject("r_list", reviewList);
			   mv.addObject("totalnum2",totalnum2);
			   mv.addObject("user",user);
			   mv.addObject("check",check);
		      
			   mv.setViewName("myreview");
			   
			   return mv;
		   }
	   @RequestMapping(value = "/myReviewpage" , produces = "application/json")
		public @ResponseBody Map<String,Object> myReviewpage(@RequestBody Map<String, Object> params , HttpServletRequest req)
		{
			int page =(Integer) params.get("page");
			String user = (String) params.get("user");
			
			int totalnum = ReviewDAO.mypageNum(user);
			int totalnum2 = ((totalnum-1)/10)+1;

			Map <String,Object> map = new HashMap <String,Object>();
				map.put("page", page);
				map.put("totalnum", totalnum);
				map.put("user", user);

			List <ReviewVO> reviewList = ReviewDAO.reviewPaging(map);
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			
			map1.put("r_list" , reviewList);
			
			map1.put("user", user);
			
			map1.put("totalnum2",totalnum2);

			return map1;
		}
	   //------------------------주문 내역 관련--------------------------------------------------------
       @RequestMapping(value = "/gomemberprequest" , method = RequestMethod.GET)
       public ModelAndView gomemberprequest(ModelAndView mv,HttpServletRequest req)
       {
          int page = Integer.parseInt(req.getParameter("page"));
          
          int totalnum = OrderhistoryDAO.orderhistoryNum();
          
          int totalnum2 = ((totalnum-1)/10)+1;
          
          Map <String,Object> map1 = new HashMap <String,Object>();
          map1.put("page", page);
          map1.put("totalnum", totalnum);
          
          List <OrderhistoryVO> list1 = OrderhistoryDAO.orderhistoryPaging(map1);
          List <MemberVO> list2 = new ArrayList <MemberVO>();
          
          for(OrderhistoryVO temp : list1)
          {
             MemberVO mvo = MemberDAO.getInfo(temp.getId());
             list2.add(mvo);
          }
          
          mv.addObject("list1",list1);
          mv.addObject("list2",list2);
          mv.addObject("totalnum2" , totalnum2);

          
          mv.setViewName("memberprequest");
          return mv;
       }
       
       @RequestMapping(value = "/orderupdate"  ,method = RequestMethod.GET)
       public String orderupdate(HttpServletRequest req)
       {
    	  String DATA = req.getParameter("DATA");
    	  String [] aa = DATA.split(",");
    	  
    	  for(int i=0;i<aa.length;i++)
    	  {
    		  OrderhistoryDAO.orderhistoryUpdate(Integer.parseInt(aa[i]));
    	  }
          
          return "redirect:/gomemberpresponse?page=1";
       }
       
       
       @RequestMapping(value = "/gomemberpresponse" , method = RequestMethod.GET)
       public ModelAndView gomemberpresponse(ModelAndView mv,HttpServletRequest req)
       {
    	   int page = 1;
			
			if(req.getParameter("page")!=null)
	           {
	              page = Integer.parseInt(req.getParameter("page"));
	           }
			
			String searchID = "";
			if(req.getParameter("searchID") != null) {
				searchID = req.getParameter("searchID");
			}

			int totalnum = OrderhistoryDAO.orderhistoryCheckNum(searchID);
			System.out.println(totalnum);
			System.out.println(searchID);
	         
			int totalnum2 = ((totalnum-1)/10)+1;
	         
			Map <String,Object> map1 = new HashMap <String,Object>();
			map1.put("page", page);
			map1.put("totalnum", totalnum);
			map1.put("searchID", searchID);
	         
			List <OrderhistoryVO> list1 = OrderhistoryDAO.orderhistoryCheckPaging(map1);
			System.out.println("완료");
	          List <MemberVO> list2 = new ArrayList <MemberVO>();
	          
	          for(OrderhistoryVO temp : list1)
	          {
	             MemberVO mvo = MemberDAO.getInfo(temp.getId());
	             list2.add(mvo);
	          }
	         
	          mv.addObject("list1",list1);
	          mv.addObject("list2",list2);
	          mv.addObject("totalnum2" , totalnum2);
	          mv.addObject("searchID",searchID);
	          
	          mv.setViewName("memberpresponse");
	          
	          return mv;
       }

       @RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	   public ModelAndView myProfile(Locale locale, HttpServletRequest req, ModelAndView mv ) {
	      
	      HttpSession hs = req.getSession();
	      
	      MemberVO loginvo =  (MemberVO) hs.getAttribute("loginvo");
	      MemberDAO.getInfo(loginvo.getId());
	      
	      mv.addObject("mloginvo", loginvo);
	      mv.setViewName("myProfile");
	      return mv;
	   }
	   @RequestMapping(value = "/myOrder" , method = RequestMethod.GET)
	   public ModelAndView goorderhis(ModelAndView mv,HttpServletRequest req)
	   {
	        HttpSession hs = req.getSession();   
	        String user = (String) hs.getAttribute("loginid");
	        MemberVO loginvo =  (MemberVO) hs.getAttribute("loginvo");
		      
	        mv.addObject("mloginvo", loginvo);
	        int check = 0;
	        int page = 1;
	       
	       if(req.getParameter("page")!=null)
	       {
	          page = Integer.parseInt(req.getParameter("page"));
	       }
	       
	       int totalnum = 1;
	       
	       if(OrderhistoryDAO.orderhistoryMyNum(user) != 0)
	       {
	          totalnum = OrderhistoryDAO.orderhistoryMyNum(user);
	       }

	       int totalnum2 = ((totalnum-1)/10)+1;
	       
	       Map <String,Object> map1 = new HashMap <String,Object>();
	       map1.put("page", page);
	       map1.put("totalnum", totalnum);
	       map1.put("id", user);
	       
	       List <OrderhistoryVO> list1 = OrderhistoryDAO.orderhistoryMyPaging(map1);
	       if(list1.size() != 0) {
			   check=1;
		   }
	       mv.addObject("list1",list1);
	       
	       mv.addObject("totalnum2" , totalnum2);   
	       mv.addObject("page",page);
	       
	       mv.setViewName("myOrder");
	       
	       return mv;
	   }
	    @RequestMapping(value = "/orderdel"  ,method = RequestMethod.GET)
	    public String orderdelete(HttpServletRequest req)
	    {
	       int orderno = Integer.parseInt(req.getParameter("orderno"));
	       
	       OrderhistoryDAO.orderhistoryDelete(orderno);
	       
	       return "redirect:/myOrder";   
	    }
	    
        @RequestMapping(value = "/cartdelete", method = RequestMethod.GET)
        public String cartdelete(ModelAndView mv, HttpServletRequest req) 
        {
           HttpSession hs = req.getSession();   
           String user = (String) hs.getAttribute("loginid");
           
          String DATA = req.getParameter("DATA");        
          String[] aa = DATA.split(",");
          
          CartDAO.cartDelete(user,aa);
          
           return "redirect:/myCart";
        }
	   //------------------------결제 관련-----------------------------------------------------------
       
        @RequestMapping(value = "/payment")
        public ModelAndView payment(ModelAndView mv , HttpServletRequest req)
        {   
           HttpSession hs = req.getSession();   
           String user = (String) hs.getAttribute("loginid");
           
           List <CartVO> list1 = new ArrayList<CartVO>();
           
           if(req.getParameter("hid") != null)
           {
              String subject = req.getParameter("subject");
              String size = req.getParameter("size");
              String color = req.getParameter("color");
              
        /*      ProductVO pvo = new ProductVO();
              pvo.setProductsubject(subject);
              pvo.setProductsize(size);
              pvo.setProductcolor(color);
                  
              String productcode = ProductDAO.productMapping(pvo);*/
              
              int price = Integer.parseInt(req.getParameter("price"));
              /*String total = req.getParameter("total");*/
              
              String file = req.getParameter("file");
              int amount = Integer.parseInt(req.getParameter("amount"));
              
              CartVO cvo = new CartVO(9999999,user,subject,color,size,price,amount,file);
                     
              list1.add(cvo);
              mv.addObject("hid",1);
           }
           else
           {
             String DATA = req.getParameter("DATA");
             List <CartVO> list2 = CartDAO.cartView(user);
             
              
              String[] aa = DATA.split(",");
                
              for(CartVO list3 : list2)
              {
                 for(int i=0;i<aa.length;i++)
                 {
                    if(list3.getCartno() == Integer.parseInt(aa[i]))
                    {         
                       list1.add(list3);
                    }
                 }
              }
              mv.addObject("DATA",DATA);
           }
           MemberVO loginvo =  (MemberVO) hs.getAttribute("loginvo");
           mv.addObject("mloginvo", loginvo);
           mv.addObject("list1",list1);
           mv.setViewName("payment");
                  
           return mv;
        }
        
	   
        @RequestMapping(value = "/paycomple")
        public ModelAndView paycomple(ModelAndView mv , HttpServletRequest req)
        { 
           System.out.println("여기까지는 되겠지");
           
           String recipient = req.getParameter("recipient");
           String name = req.getParameter("name");
           String phone_number = req.getParameter("phone_number");
           String email = req.getParameter("email");
           String ad1 = req.getParameter("ad1");
           String ad2 = req.getParameter("ad2");
           String ad3 = req.getParameter("ad3");
           String myphone_number = req.getParameter("myphone_number");
           String message = req.getParameter("message");
           String point = req.getParameter("point");
           String paymethod = req.getParameter("paymethod");
           String total = req.getParameter("total");
           
           HashMap <String, Object> hashMap = new HashMap<String, Object>();
           
           hashMap.put("recipient", recipient);
           hashMap.put("name", name);
           hashMap.put("phone_number", phone_number);
           hashMap.put("email", email);
           hashMap.put("ad1", ad1);
           hashMap.put("ad2", ad2);
           hashMap.put("ad3", ad3);
           hashMap.put("myphone_number", myphone_number);
           hashMap.put("message", message);
           hashMap.put("point", point);
           hashMap.put("paymethod", paymethod);
           hashMap.put("total", total);
           
           mv.addObject("map",hashMap);
           
           int temp , maxnum;
           
             HttpSession hs = req.getSession();   
             String user = (String) hs.getAttribute("loginid");
             
           Date date = new Date();
           SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
           String todate = transFormat.format(date);
           
           if(req.getParameter("hid") != null)
           {
              temp = OrderhistoryDAO.orderhistoryMaxNum();
              maxnum = temp+1;
              OrderhistoryVO ovo = new OrderhistoryVO(maxnum,user,req.getParameter("productsubject"),req.getParameter("productcolor"),req.getParameter("productsize"),Integer.parseInt(req.getParameter("totalprice")),Integer.parseInt(req.getParameter("productamount")),req.getParameter("stored_fname"),"배송 준비 중",todate);
              OrderhistoryDAO.orderhistoryInsert(ovo);
           }
           else
           {
              List <CartVO> list1 = new ArrayList<CartVO>();
              
              String DATA = req.getParameter("DATA");
              List <CartVO> list2 = CartDAO.cartView(user);
                
              String[] aa = DATA.split(",");
                   
              for(CartVO list3 : list2)
              {
                 for(int temp1=0;temp1<aa.length;temp1++)
                 {
                    if(list3.getCartno() == Integer.parseInt(aa[temp1]))
                    {         
                       list1.add(list3);
                    }
                 }
              }   
                 
              for(CartVO list3 : list1)
              {
                 temp = OrderhistoryDAO.orderhistoryMaxNum();
                 maxnum = temp+1;
                 OrderhistoryVO ovo = new OrderhistoryVO(maxnum,user,list3.getProductsubject(),list3.getProductcolor(),list3.getProductsize(),list3.getProductprice()*list3.getProductamount(),list3.getProductamount(),list3.getStored_fname(),"배송 준비 중",todate);
                 OrderhistoryDAO.orderhistoryInsert(ovo);
              }
              
              CartDAO.cartDelete(user,aa);
           }
 // 적립금 사용
           System.out.println("1111111111111111111111111111111111");
           MemberVO vo = new MemberVO();
           vo.setId(user);  // 보낼 vo에 적립될 아이디 입력
           
           HttpSession session = req.getSession();
           MemberVO loginvo = (MemberVO) session.getAttribute("loginvo"); 
         
           int nowpoint = loginvo.getPoint();  // 현재 적립금 담아오기
           
           int repoint = nowpoint - Integer.parseInt(point);  // 새로운 적립금 입력

           System.out.println(repoint); 
           
      
          // 적립금 사용 내역 기록
           System.out.println("2222222222222222222222222222222222222"); 
      PointVO Pvo = new PointVO();
            
      Date now = new Date(); // java.util.Date, NOT java.sql.Date or java.sql.Timestamp!
      String time = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(now);   

      if(!point.equals("0")) {
    	  System.out.println("3333333333333333333333333333333333");
         Pvo.setId(user);
         Pvo.setPoint("-"+point);
         Pvo.setContents("적립금 사용");
         Pvo.setTime(time);
         
         PointDAO.signuppoint(Pvo);
      }
      
      System.out.println("7777777777777777777777777777777777");
      
      
           

   // 결제금액 2% 적립금 적립

      System.out.println("444444444444444444444444444444444444");

      int newpoint = Integer.parseInt(total)/50;
      
      int nujeokPoint = loginvo.getA_point();
      nujeokPoint += newpoint;
      loginvo.setA_point(nujeokPoint);
      MemberDAO.nujeok(loginvo);

      int repoint2 = repoint + newpoint;

      vo.setPoint(repoint2);

      MemberDAO.newpoint(vo);


   // 적립금 적립 내역 기록
    
   	if(newpoint != 0) {
   		System.out.println("5555555555555555555555555555555555");
         Pvo.setId(user);
         Pvo.setPoint("+"+ newpoint);
         Pvo.setContents("적립금 적립");
         Pvo.setTime(time);    
         PointDAO.signuppoint(Pvo);
         
   	}
          // 등업할지 확인
   	System.out.println("666666666666666666666666666666666666");
         
         MemberVO loginvo1 = MemberDAO.getInfo(user);
         String grade = loginvo1.getGrade();
              
              if(repoint2 >= 10000 && grade.equals("bronze") ) {
                 loginvo1.setGrade("silver");
                 MemberDAO.upgrade(loginvo1);
              } 
              else if(repoint2 >= 30000 && grade.equals("silver")) {
                 loginvo1.setGrade("gold");
                 MemberDAO.upgrade(loginvo1);
              }


            // loginvo 세션에 재입력
            
            loginvo.setPoint(repoint2);
            session.setAttribute("loginvo", loginvo1);
           

           mv.setViewName("paycomplete");
           
           return mv;
        }
	//-----------------------------------장바구니---------------------------------------
	   @RequestMapping(value = "/myCart", method = RequestMethod.GET)
       public ModelAndView myCary(ModelAndView mv, HttpServletRequest req) 
       {
          HttpSession hs = req.getSession();   
          String user = (String) hs.getAttribute("loginid");
          MemberVO loginvo =  (MemberVO) hs.getAttribute("loginvo");
	      
		  mv.addObject("mloginvo", loginvo);
          
          List <CartVO> list1 = CartDAO.cartView(user);
          
          mv.addObject("list1",list1);
          mv.setViewName("myCart");
         
          return mv;
       }
	    @RequestMapping(value = "/cartinsert" , produces = "application/json")
	    public @ResponseBody Map<String,Object> cartinsert(@RequestBody Map<String, Object> params , HttpServletRequest req)
	    {            
	       String productsubject = (String) params.get("productsubject");
	       String wancolor = (String) params.get("wancolor");
	       String wansize = (String) params.get("wansize");
	       int price = (int) params.get("productprice");
	       int amount = (int) params.get("amount");
	       String stored_fname = (String) params.get("stored_fname");
	       
	/*       ProductVO pvo = new ProductVO();
	       pvo.setProductsubject(productsubject);
	       pvo.setProductsize(wansize);
	       pvo.setProductcolor(wancolor);
	       
	       String productcode = ProductDAO.productMapping(pvo);*/
	       
	       int temp = CartDAO.cartMaxNum();
	       int maxnum = temp+1;
	       
	       HttpSession hs = req.getSession();   
	       String user = (String) hs.getAttribute("loginid");
	       
	       CartVO cvo = new CartVO(maxnum,user,productsubject,wancolor,wansize,price,amount,stored_fname);
	       
	       CartDAO.cartInsert(cvo);
	       
	       Map<String , Object> map1 = new HashMap<String , Object>();
	       
	     return map1;
	    }
	

	//--------------------------------------로그인/회원가입-----------------------------------

	@RequestMapping(value = "/check_member" , method = RequestMethod.GET)
	public ModelAndView checkmemeber(ModelAndView mv,HttpServletRequest req)
	{
		mv.setViewName("check_member");
		return mv;
	}
	//회원 확인 창으로
	
	/*@RequestMapping(value = "/loginwai", method = RequestMethod.GET)
	public String home(Model model,HttpServletRequest req) {
		
		MemberDAO dao = new MemberDAO();
		String aa = dao.hello();
		
		model.addAttribute("maa", aa);
		
		String oldurl = req.getHeader("referer");
	    model.addAttribute("oldurl",oldurl);
		
		return "login";	
	}*/
	@RequestMapping(value = "/loginchk" , method = RequestMethod.POST , produces="application/json")
    public @ResponseBody Map<String,Object> loginchk(@RequestBody Map<String, Object> params) {
	 
	 String id = (String) params.get("id");
	 String pw = (String) params.get("pw");

	 System.out.println(id);
	 System.out.println(pw);
	 
	 MemberVO vo = new MemberVO();
	 vo.setId(id);
	 vo.setPw(pw);
	 
	 Map <String,Object> map1 = new HashMap <String,Object>();
	 
	 MemberVO loginvo = MemberDAO.login(vo);
	 
	 if(loginvo != null) {
		 
		 int rs = 1;
		 map1.put("rs", rs);
		 
	 } else {
		  
		 int rs = 0;
		 map1.put("rs", rs);
	 }
	 
     return  map1;
    }
	
	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String hello(Model model) {
		
		return "login";	
	}
	
	
	

@RequestMapping(value = "/memberAllData", method = RequestMethod.GET)
  	public ModelAndView home(ModelAndView mv,HttpServletRequest req) {
  		
    	int page = 1;
    	String searchID = "";
    	System.out.println("2");
    	
    	if(req.getParameter("searchID") != null) {
    		searchID = req.getParameter("searchID");
    	}
			
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		
		int totalnum = MemberDAO.memberNum1(searchID);
		System.out.println(totalnum);
		
		int totalnum2 = ((totalnum-1)/10)+1;
		
		Map <String,Object> map1 = new HashMap <String,Object>();
		
			map1.put("page", page);
			map1.put("totalnum", totalnum);
			map1.put("searchID", searchID);

			List <MemberVO> list = MemberDAO.memberAllData(map1);
			System.out.println(list.size());

			mv.addObject("mlist", list);
			mv.addObject("totalnum2",totalnum2);
			mv.addObject("page",page);
			mv.addObject("search",searchID);

			mv.setViewName("memberlist");

			return mv;	
  	}
      
    @RequestMapping(value = "/search_member" , method = RequestMethod.GET)
	public ModelAndView search_member(ModelAndView mv , HttpServletRequest req)
	{
		int page = 1;
		String searchID ="";
		if(req.getParameter("searchID") != null) {
			searchID = req.getParameter("searchID");
		}
		System.out.println("아이디: "+searchID);

		int totalnum = MemberDAO.memberNum1(searchID);
		System.out.println("사이즈"+totalnum);
			
		int totalnum2 = ((totalnum-1)/10)+1;
			
		Map <String,Object> map1 = new HashMap <String,Object>();
		map1.put("page", page);
		map1.put("totalnum", totalnum);
		map1.put("searchID", searchID);
			
		List <MemberVO> list = MemberDAO.memberAllData(map1);
		System.out.println("사이즈"+list.size());
		
		
		mv.addObject("mlist", list);
		mv.addObject("totalnum2",totalnum2);
		mv.addObject("searchID",searchID);
		mv.addObject("page",page);
	      
		mv.setViewName("memberlist");
		   
		return mv;
	}
	 
	 
	 @RequestMapping(value = "/findid", method = RequestMethod.GET)
		public ModelAndView findid(ModelAndView mv) {
				
			mv.setViewName("findid");
			
			return mv;
		}
			

		 @RequestMapping(value = "/dofindid" , method = RequestMethod.POST , produces="application/json")
		    public @ResponseBody Map<String,Object> dofindid(@RequestBody Map<String, Object> params) {
			 
			 String name = (String) params.get("name");
			 String r_num1 = (String) params.get("rnum1");
			 String r_num2 = (String) params.get("rnum2");
			 

			 System.out.println(name);
			 System.out.println(r_num1+"-"+r_num2);
			 
			 MemberVO vo = new MemberVO();
			 vo.setName(name);
			 vo.setR_num1(r_num1);
			 vo.setR_num2(r_num2);
			 
			 Map <String,Object> map1 = new HashMap <String,Object>();
			 
			 String rs = MemberDAO.findid(vo);
			 
			 map1.put("rs", rs);
			 
		     return  map1;
		    }
		 
		 @RequestMapping(value = "/dofindpw" , method = RequestMethod.POST , produces="application/json")
		    public @ResponseBody Map<String,Object> dofindpw(@RequestBody Map<String, Object> params) {
			 
			 String id = (String) params.get("id");
			 String name = (String) params.get("name");

			 System.out.println(id);
			 System.out.println(name);
			 
			 MemberVO vo = new MemberVO();
			 vo.setId(id);
			 vo.setName(name);
			 
			 Map <String,Object> map1 = new HashMap <String,Object>();
			 
			 String rs = MemberDAO.findpw(vo);
			 
			 map1.put("rs", rs);
			 
		     return  map1;
		    }
		  
		
		
		@RequestMapping(value = "/findpw", method = RequestMethod.GET)
		public ModelAndView findpw(ModelAndView mv) {
				
			mv.setViewName("findpw");
			
			return mv;
		}
		
		
		@RequestMapping(value = "/gologin", method = RequestMethod.GET)
		public ModelAndView gologin2(ModelAndView mv, Model model,HttpServletRequest req) {
			
			 HttpSession Session = req.getSession(true);
			
			if(Session.getAttribute("oldUrlRe")!=null) {
				
				System.out.println(Session.getAttribute("oldUrlRE") + " <---- 이게 원래 oldurl이여야 됨");
				model.addAttribute("oldurl",Session.getAttribute("oldUrlRe"));
				mv.setViewName("login");
				
			} else if (Session.getAttribute("new")!=null) {
				
				model.addAttribute("oldurl","/imsi/");
				mv.setViewName("login");
			} 
			
			else {

				String oldurl = req.getHeader("referer");
			    model.addAttribute("oldurl",oldurl);
				mv.setViewName("login");
				
			}
			
			return mv;
			
		}
	 
		@RequestMapping(value = "/login", method = RequestMethod.POST)
	      public ModelAndView login(HttpServletRequest req, ModelAndView mv) {
	         
	         String id = req.getParameter("id");
	         String pw = req.getParameter("pw");
	         
	         String url1 = "redirect:/";
	        /* String url2 = "redirect:/goadminmain";*/
	         String oldurl = req.getParameter("oldurl");
	         String oldurl2 = req.getParameter("oldurl");
	         System.out.println(oldurl.indexOf("imsi/"));
	         int a = oldurl.indexOf("imsi/")+5;
	         oldurl = oldurl.substring(a);
	         /*oldurl = oldurl.substring(beginIndex)*/
	         
	         System.out.println(oldurl+ "<--- 본래 oldurl");
	         
	         url1 += oldurl;
	         
	         System.out.println(url1);
	               
	         System.out.println(id);
	         System.out.println(pw);
	         
	         MemberVO vo = new MemberVO();
	         vo.setId(id);
	         vo.setPw(pw);   
	         
	          if (MemberDAO.login(vo)!=null) 
	            {      
	               vo = MemberDAO.login(vo);
	               mv.addObject("mvo", vo);
	               HttpSession Session = req.getSession(true);
	               Session.setAttribute("loginid",id);
	               Session.setAttribute("loginvo",vo);
	               
	               if (vo.getAdmin().equals("0")) 
	               {  
	                  mv.setViewName(url1);
	                  Session.setAttribute("admin", 0);
	               } 
	               else 
	               {
	            	  /*List <ProductVO> list1 = ProductDAO.mainProductList("상의");
	         	      List <ProductVO> list2 = ProductDAO.mainProductList("하의");
	         	      List <ProductVO> list3 = ProductDAO.mainProductList("신발");
	         	      List <ProductVO> list4 = ProductDAO.mainProductList("가방");
	         	      List <ProductVO> list5 = ProductDAO.mainProductList("액세서리");
	         	      
	         	      mv.addObject("mlist1", list1);
	         	      mv.addObject("mlist2", list2);
	         	      mv.addObject("mlist3", list3);
	         	      mv.addObject("mlist4", list4);
	         	      mv.addObject("mlist5", list5);
	         	      
	    				mv.setViewName("admin_Main");*/
	            	   mv.setViewName(url1);
	                  Session.setAttribute("admin", 1);
	               }   
	            }
	            else 
	            {

	               HttpSession Session = req.getSession(true);
	               Session.setAttribute("oldUrlRe", oldurl2);
	               mv.setViewName("redirect:/gologin");	               
	               
	            }
	         
	         return mv;
	         
	      }
	    
	 
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
		public String logout(HttpServletRequest req) {
			
			 HttpSession Session = req.getSession(true);
			 Session.setAttribute("login", "");
			
			return "login";
	}
	
	@RequestMapping(value = "/logout" , method = RequestMethod.GET)
    public String logout(Locale locale, HttpServletRequest req)
    {   
       HttpSession hs = req.getSession();
       hs.invalidate();
       
       return "redirect:/";
    }
	 

@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(HttpServletRequest req, ModelAndView mv) throws UnsupportedEncodingException {

			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			String hp1 = req.getParameter("hp1");
			String hp2 = req.getParameter("hp2");
			String hp3 = req.getParameter("hp3");
			String ad1 = req.getParameter("ad1");
			String ad2 = req.getParameter("ad2");
			String ad3 = req.getParameter("ad3");
			String email = req.getParameter("email");
		
		      ad2 = new String(ad2.getBytes("8859_1"),"utf-8");
		      ad3 = new String(ad3.getBytes("8859_1"),"utf-8");
			

		System.out.println(pw);
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setHp1(hp1);
		vo.setHp2(hp2);
		vo.setHp3(hp3);
		vo.setAd1(ad1);
		vo.setAd2(ad2);
		vo.setAd3(ad3);
		vo.setEmail(email);
		
		MemberDAO.update(vo);		
		
		MemberVO loginvo = MemberDAO.getInfo(id);
		loginvo.setPw(pw);
		
		
		HttpSession session = req.getSession();
		session.setAttribute("loginvo", loginvo);
		
		mv.addObject("mloginvo", loginvo);
		mv.setViewName("myProfile");
				
		return mv;
		
	} 

@RequestMapping(value = "/bye", method = RequestMethod.POST)
public ModelAndView bye(HttpServletRequest req, ModelAndView mv) throws UnsupportedEncodingException {

		String id = req.getParameter("id");
		String name ="";
		String pw = "";
		String hp1 = "";
		String hp2 = "";
		String hp3 = "";
		String ad1 = "";
		String ad2 = "";
		String ad3 = "";
		String email = "";
			MemberVO vo = new MemberVO();
	vo.setId(id);
	vo.setPw(pw);
	vo.setHp1(hp1);
	vo.setHp2(hp2);
	vo.setHp3(hp3);
	vo.setAd1(ad1);
	vo.setAd2(ad2);
	vo.setAd3(ad3);
	vo.setEmail(email);
	vo.setName(name);
	
	MemberDAO.update(vo);		
	
	mv.setViewName("redirect:/logout");
			
	return mv;
	
} 

	 
	 
	 
	 @RequestMapping(value = "/idchk" , method = RequestMethod.POST , produces="application/json")
	    public @ResponseBody Map<String,Object> idchk(@RequestBody Map<String, Object> params) {
		 
		 String id = (String) params.get("id");

		 System.out.println(id);
		 
		 Map <String,Object> map1 = new HashMap <String,Object>();
		 int rs = MemberDAO.idchk(id);
		 
		 map1.put("rs", rs);
		 
	     return  map1;
	    }
	 

	 @RequestMapping(value = "/admin" , method = RequestMethod.POST, produces="application/json")
	    public 	@ResponseBody Map<String,Object> admin(@RequestBody Map<String, Object> params) {

		 String id = (String) params.get("userid");
		 String admin = (String) params.get("useradmin");
		 
		 System.out.println(id);
		 System.out.println(admin);
		 
		 Map <String,Object> map1 = new HashMap <String,Object>();
		 
		 if(id.equals("adm")) {
			 int rs = 2;
			 map1.put("rs", rs);
		 } else if(admin.equals("0")) {
			 int rs = MemberDAO.adminset(id);
			 map1.put("rs", rs);
		 } else if (admin.equals("1")){
			 int rs = MemberDAO.admindel(id);
			 map1.put("rs", rs);
		 }
			return map1;
		 
	    }
	 
	 
		@RequestMapping(value = "/chkmem", method = RequestMethod.POST)
		public String chkmem() {
			
			return "check_member";
		}

			
	 
		 @RequestMapping(value = "/chkrnum", method = RequestMethod.POST, produces="application/json")
			public @ResponseBody Map<String,Object> chkrnum(@RequestBody Map<String, Object> params) {
				
			 String name = (String) params.get("name");
			 String r_num1 = (String) params.get("rnum1");
			 String r_num2 = (String) params.get("rnum2");
			 
				System.out.println("주민번호 확인");
				 	
				System.out.println(r_num1);
				System.out.println(r_num2);
				
				MemberVO vo = new MemberVO();
				vo.setName(name);
				vo.setR_num1(r_num1);
				vo.setR_num2(r_num2);			
				
				Map <String,Object> map1 = new HashMap <String,Object>();
				 
				if (MemberDAO.chkrnum(vo)!=null) {
					 
				
					int rs = 1;
					map1.put("rs", rs);
					
						
				} else {
					
					int rs = 2;
					map1.put("rs", rs);

				
				 }
				
				return map1;
				
			}
	 
	
			@RequestMapping(value = "/goshop", method = RequestMethod.POST)
			public ModelAndView goshop(ModelAndView mv) {
				
				
				  List <ProductVO> list1 = ProductDAO.mainProductList("상의");
			      List <ProductVO> list2 = ProductDAO.mainProductList("하의");
			      List <ProductVO> list3 = ProductDAO.mainProductList("신발");
			      List <ProductVO> list4 = ProductDAO.mainProductList("가방");
			      List <ProductVO> list5 = ProductDAO.mainProductList("액세서리");
			      
			      mv.addObject("mlist1", list1);
			      mv.addObject("mlist2", list2);
			      mv.addObject("mlist3", list3);
			      mv.addObject("mlist4", list4);
			      mv.addObject("mlist5", list5);
			
				mv.setViewName("User_Main");
				
				
				return mv;
			}
			//내 정보 보기에서 쇼핑하러 가기
			 

			 @RequestMapping(value = "/gosignup", method = RequestMethod.POST)
			public ModelAndView gosignup(HttpServletRequest req, ModelAndView mv) throws UnsupportedEncodingException {
						
						String name = req.getParameter("name");
						String r_num1 = req.getParameter("rnum1");
						String r_num2 = req.getParameter("rnum2");
							
						  name = new String(name.getBytes("8859_1"),"utf-8");
						 	
							System.out.println(r_num1);
							System.out.println(r_num2);
						
							mv.addObject("name",  name);
							mv.addObject("r_num1",  r_num1);
							mv.addObject("r_num2",  r_num2);
							 
							 SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy/MM/dd");
							 Date date = new Date();
							 String time = format1.format(date);
							 
							 mv.addObject("m_date", time);
							
							 
							 if(req.getParameter("rnum2").substring(0,1).equals("1") || req.getParameter("rnum2").substring(0,1).equals("3")) {
								 
								 mv.addObject("gender", "male");
								 
							 } else {mv.addObject("gender", "female");}
							 
							mv.setViewName("signup");		
						
						return mv;
						
					} 
			 
			 @RequestMapping(value = "/signup", method = RequestMethod.POST)
			   public ModelAndView member(HttpServletRequest req, ModelAndView mv) throws UnsupportedEncodingException {
			      
			      String name = req.getParameter("name");
			      String id = req.getParameter("id");
			      String pw = req.getParameter("pw");
			      String hp1 = req.getParameter("hp1");
			      String hp2 = req.getParameter("hp2");
			      String hp3 = req.getParameter("hp3");
			      String ad1 = req.getParameter("ad1");
			      String ad2 = req.getParameter("ad2");
			      String ad3 = req.getParameter("ad3");   
			      System.out.println("ad3이 뭐냐1"+ad3);
			      String email = req.getParameter("email");
			      String r_num1 = req.getParameter("r_num1");
			      String r_num2 = req.getParameter("r_num2");
			      String s_date = req.getParameter("m_date");
			      
			      int year = Integer.parseInt(s_date.substring(0,4));
			      int month = Integer.parseInt(s_date.substring(5,7));
			      int day = Integer.parseInt(s_date.substring(8,10));
			      
			      Date m_date = new Date();
			      m_date.setYear(year);
			      m_date.setMonth(month);
			      m_date.setDate(day);
			      
			      String gender = req.getParameter("gender");
			      String admin = req.getParameter("admin");
			      String grade = req.getParameter("grade");
			      
			      name = new String(name.getBytes("8859_1"),"utf-8");
			      ad2 = new String(ad2.getBytes("8859_1"),"utf-8");
			      ad3 = new String(ad3.getBytes("8859_1"),"utf-8");
			      System.out.println("ad3이 뭐냐2"+ad3);
			      gender = new String(gender.getBytes("8859_1"),"utf-8");
			      grade = new String(grade.getBytes("8859_1"),"utf-8");
			      
			      System.out.println(id);
			      System.out.println(pw);
			      if(MemberDAO.memberNum() ==0) {
			    	  admin = "2";
			      }
			      MemberVO vo = new MemberVO();
			      vo.setName(name);
			      vo.setId(id);
			      vo.setPw(pw);
			      vo.setHp1(hp1);
			      vo.setHp2(hp2);
			      vo.setHp3(hp3);
			      vo.setAd1(ad1);
			      vo.setAd2(ad2);
			      vo.setAd3(ad3);
			      System.out.println("ad3이 뭐냐3"+vo.getAd3());
			      vo.setEmail(email);
			      vo.setR_num1(r_num1);
			      vo.setR_num2(r_num2);
			      vo.setM_date(m_date);
			      vo.setGender(gender);
			      vo.setAdmin(admin);
			      vo.setGrade(grade);
			      vo.setPoint(5000);
			      vo.setA_point(5000);
			      
			      MemberDAO.signup(vo);
			       
			      
			      // 적립금 내역 기록
			      
			      PointVO Pvo = new PointVO();
					
					Date now = new Date(); // java.util.Date, NOT java.sql.Date or java.sql.Timestamp!
					String time = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(now);	
					
					Pvo.setId(id);
					Pvo.setPoint("+5000");
					Pvo.setContents("회원가입");
					Pvo.setTime(time);
					
					PointDAO.signuppoint(Pvo);
					
					
					
			    // 회원가입후 login으로 돌아갈 시 이전페이지를 첫화면으로 전환 
					
			  	HttpSession Session = req.getSession();
				Session.setAttribute("new", "new");
					      
				mv.setViewName("redirect:/gologin");
			      
			      
			      return mv;
			      
			   }
	//----------------------------Q&A게시판-------------------------------------
	 @RequestMapping(value = "/goqnaboard" , method = RequestMethod.GET)
		public ModelAndView qnapaging(ModelAndView mv , HttpServletRequest req)
		{
			int page = 1;
			
			String productcode = req.getParameter("productcode");
			ProductVO pvo = ProductDAO.productViewData(productcode);
			
			if(req.getParameter("page")!=null)
			{
				page = Integer.parseInt(req.getParameter("page"));
			}
			
			int totalnum = QnaboardDAO.qnaboardNum(productcode);
			
			int totalnum2 = ((totalnum-1)/10)+1;
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			map1.put("page", page);
			map1.put("totalnum", totalnum);
			map1.put("productcode", productcode);
			
			List <QnaboardVO> list1 = QnaboardDAO.qnaboardPaging(map1);
			
			System.out.println("아니면 여긴가");
			
			mv.addObject("list1",list1);
			mv.setViewName("qnaboard");
			mv.addObject("totalnum2" , totalnum2);
			mv.addObject("productcode",productcode);
			mv.addObject("productsubject",pvo.getProductsubject());
			
			mv.addObject("page",page);
			
			String user = req.getParameter("user");
			
			HttpSession hs = req.getSession();
			
			if(user!=null)
				hs.setAttribute("user", user);
			
			return mv;
		}
		
	 @RequestMapping(value = "/goqnaboard1" , method = RequestMethod.GET)
		public ModelAndView qnapaging1(ModelAndView mv , HttpServletRequest req)
		{
			int page = 1;
			
			if(req.getParameter("page")!=null)
			{
				page = Integer.parseInt(req.getParameter("page"));
			}
			
			String searchID = "";
			if(req.getParameter("searchID") != null) {
				searchID = req.getParameter("searchID");
			}
			
			int totalnum = QnaboardDAO.qnaboardNum2(searchID);
			System.out.println("qna :"+totalnum);
			
			int totalnum2 = ((totalnum-1)/10)+1;
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			map1.put("page", page);
			map1.put("totalnum", totalnum);
			map1.put("searchID", searchID);
			
			List <QnaboardVO> list1 = QnaboardDAO.qnaboardPaging2(map1);
			System.out.println(list1.size());
			for(int i=0;i<list1.size();i++) {
				System.out.println(list1.get(i).getQnano());
			}
			
			mv.addObject("list1",list1);
			mv.setViewName("qnaboard1");
			mv.addObject("totalnum2" , totalnum2);
			mv.addObject("searchID",searchID);
			
			mv.addObject("page",page);
			
			String user = req.getParameter("user");
			
			HttpSession hs = req.getSession();
			
			if(user!=null)
				hs.setAttribute("user", user);
			
			return mv;
		}
		
		@RequestMapping(value = "/qnapage" , produces = "application/json")
		public @ResponseBody Map<String,Object> qnapage(@RequestBody Map<String, Object> params , HttpServletRequest req)
		{
			int page =(Integer) params.get("page");
			String productcode = (String) params.get("productcode");
			
			int totalnum = QnaboardDAO.qnaboardNum(productcode);
			
			Map <String,Object> map2 = new HashMap <String,Object>();
			map2.put("page", page);
			map2.put("totalnum", totalnum);
			map2.put("productcode", productcode);
			
			List <QnaboardVO> list1 = QnaboardDAO.qnaboardPaging(map2);
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			
			map1.put("list2" , list1);
			
			map1.put("page", page);
			
			map1.put("productcode", productcode);
			
			System.out.println("--------------");

			return map1;
		}
		
		@RequestMapping(value = "/qnapage1" , produces = "application/json")
		public @ResponseBody Map<String,Object> qnapage1(@RequestBody Map<String, Object> params , HttpServletRequest req)
		{
			int page =(Integer) params.get("page");
			
			int totalnum = QnaboardDAO.qnaboardNum1();
			
			Map <String,Object> map2 = new HashMap <String,Object>();
			map2.put("page", page);
			map2.put("totalnum", totalnum);
			
			List <QnaboardVO> list1 = QnaboardDAO.qnaboardPaging1(map2);
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			
			map1.put("list2" , list1);
			
			map1.put("page", page);
			
			System.out.println("--------------");

			return map1;
		}
		
		@RequestMapping(value = "/contents1" , produces = "application/json")
		public @ResponseBody Map<String,Object> contents(@RequestBody Map<String, Object> params , HttpServletRequest req)
		{
			int number =(Integer) params.get("number");
			int page =(Integer) params.get("page");
			String productcode = (String) params.get("productcode");
			
			System.out.println("상품 코드는 : " + productcode);
			
			QnaboardVO qvo = QnaboardDAO.qnaboardSearchData(number);
			
			int totalnum = QnaboardDAO.qnaboardNum(productcode);
			
			Map <String,Object> map2 = new HashMap <String,Object>();
			map2.put("page", page);
			map2.put("totalnum", totalnum);
			map2.put("productcode", productcode);
			
			List <QnaboardVO> list1 = QnaboardDAO.qnaboardPaging(map2);
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			
			map1.put("number1", number);
			
			map1.put("content1", qvo.getQnacontents());
			
			map1.put("list2" , list1);
			
			map1.put("procode", qvo.getProductcode());
			
			map1.put("qnaanswercontent", qvo.getQnaanswercontents());
			
			map1.put("page", page);
			
			map1.put("productcode", productcode);
			
			System.out.println("--------------");

			return map1;
		}
		
		@RequestMapping(value = "/contents2" , produces = "application/json")
		public @ResponseBody Map<String,Object> contents2(@RequestBody Map<String, Object> params , HttpServletRequest req)
		{
			int number =(Integer) params.get("number");
			int page =(Integer) params.get("page");
			
			QnaboardVO qvo = QnaboardDAO.qnaboardSearchData(number);
			
			int totalnum = QnaboardDAO.qnaboardNum1();
			
			Map <String,Object> map2 = new HashMap <String,Object>();
			map2.put("page", page);
			map2.put("totalnum", totalnum);
			
			List <QnaboardVO> list1 = QnaboardDAO.qnaboardPaging1(map2);
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			
			map1.put("number1", number);
			
			map1.put("content1", qvo.getQnacontents());
			
			map1.put("list2" , list1);
			
			map1.put("procode", qvo.getProductcode());
			
			map1.put("qnaanswercontent", qvo.getQnaanswercontents());
			
			map1.put("page", page);
			
			System.out.println("--------------");

			return map1;
		}
		
	      @RequestMapping(value = "/goqnainsert" , method = RequestMethod.GET)
	      public ModelAndView goqnainsert(ModelAndView mv,HttpServletRequest req)
	      {
	         if(req.getParameter("number1") != null)
	         {
	            int qnano = Integer.parseInt(req.getParameter("number1"));
	            QnaboardVO qvo = QnaboardDAO.qnaboardSearchData(qnano);
	            mv.addObject("qvo",qvo);
	            
	            System.out.println(qvo.getQnasubject());
	         }
	         else
	         {
	            String productcode = req.getParameter("productcode");
	            mv.addObject("productcode",productcode);
	         
	            String productsubject = req.getParameter("productsubject");
	            mv.addObject("productsubject",productsubject);
	         }
	         
	         mv.setViewName("qnainsert");

	         return mv;
	      }
		
	      @RequestMapping(value = "/qnains" , method = RequestMethod.GET)
	      public String qnainsert(HttpServletRequest req)
	      {
	         String productcode = req.getParameter("productcode");
	         String qnakind = req.getParameter("kind");
	         String qnasubject = req.getParameter("qnasubject");
	         String qnacontents = req.getParameter("qnacontents");
	         int qnalock;
	         
	         if(req.getParameter("qnalock") == null)
	            qnalock = 0;
	         else
	            qnalock = 1;

	         
	         if(req.getParameter("edit") != null)
	         {
	            int qnano = Integer.parseInt(req.getParameter("qnano"));
	            
	            QnaboardVO qvo = new QnaboardVO();
	            qvo.setQnakind(qnakind);
	            qvo.setQnasubject(qnasubject);
	            qvo.setQnacontents(qnacontents);
	            qvo.setQnalock(qnalock);
	            qvo.setQnano(qnano);
	            
	            
	            
	            QnaboardDAO.qnaboardModify(qvo);
	            
	            System.out.println(qvo.getQnakind());
	            System.out.println(qvo.getQnasubject());
	            System.out.println(qvo.getQnacontents());
	            System.out.println(qvo.getQnalock());
	            System.out.println(qvo.getQnano());
	            
	            return "redirect:/myQnA";
	         }
	         else
	         {
	            int temp;
	            temp = QnaboardDAO.qnaboardMaxNum();
	            
	            int maxnum = temp+1;
	            
	            Date date = new Date();
	            SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	            String todate = transFormat.format(date);
	            
	            HttpSession hs = req.getSession();   
	            String user = (String) hs.getAttribute("loginid");
	            
	            QnaboardVO qvo = new QnaboardVO(maxnum,qnakind,qnasubject,qnacontents,todate,qnalock,0,user,productcode,"");
	            
	            QnaboardDAO.qnaboardInsert(qvo);
	         }
	         
	          return "redirect:/goproductdetail?productcode="+productcode;
	      }
		
	      @RequestMapping(value = "/qnadel"  ,method = RequestMethod.GET)
	         public String qnadelete(HttpServletRequest req)
	         {
	            int number = Integer.parseInt(req.getParameter("number1"));
	            
	            HttpSession hs = req.getSession();   
	            int admin = (int) hs.getAttribute("admin");
	            
	            QnaboardDAO.qnaboardDelete(number);
	            
	            if(admin == 1)
	               return "redirect:/goqnaboard1";
	            
	            return "redirect:/myQnA";   
	         }
	      
	      @RequestMapping(value = "/myqnapage" , produces = "application/json")
	      public @ResponseBody Map<String,Object> myqnapage(@RequestBody Map<String, Object> params , HttpServletRequest req)
	      {
	         int page =(Integer) params.get("page");
	         
	         HttpSession hs = req.getSession();   
	         String user = (String) hs.getAttribute("loginid");
	         
	         int totalnum = QnaboardDAO.qnaboardMyNum(user);
	         
	         Map <String,Object> map2 = new HashMap <String,Object>();
	         map2.put("page", page);
	         map2.put("totalnum", totalnum);
	         map2.put("memberid", user);
	         
	         List <QnaboardVO> list1 = QnaboardDAO.qnaboardMyPaging(map2);
	         
	         Map <String,Object> map1 = new HashMap <String,Object>();
	         
	         map1.put("list2" , list1);
	         
	         map1.put("page", page);
	         
	         System.out.println("--------------");

	         return map1;
	      }

		@RequestMapping(value = "/qnaanscon"  ,method = RequestMethod.POST)
		public String qnaasncont(@RequestBody Map<String, Object> params)
		{
			int number = Integer.parseInt((String)params.get("qnano"));
			String qnaanswercontents = (String) params.get("qnaanswercontents");
			
			System.out.println("글번호 : " + number);
			System.out.println("답변 내용 : " + qnaanswercontents);
			
			QnaboardVO qvo = new QnaboardVO();
			
			qvo.setQnano(number);
			qvo.setQnaanswercontents(qnaanswercontents);
			
			System.out.println(qvo.getQnano());
			System.out.println(qvo.getQnaanswercontents());
			
			QnaboardDAO.qnaboardUpdate(qvo);
			
			String a = "redirect:/goqnaans?number1="+number;
			
			return a;
		}
		   @RequestMapping(value = "/goqnaans" , method = RequestMethod.GET)
		   public ModelAndView goqnaans(ModelAndView mv,HttpServletRequest req)
		   {
		      int number = Integer.parseInt(req.getParameter("number1"));
		      
		      mv.addObject("number",number);
		      mv.setViewName("popup");
		      
		      return mv;
		   }
		
	//--------------------------------------------공지사항게시판--------------------------------------------------------
	
		   @RequestMapping(value = "/gonoticeboard" , method = RequestMethod.GET)
			public ModelAndView noticepaging(ModelAndView mv , HttpServletRequest req)
			{
				int page = Integer.parseInt(req.getParameter("page"));
				
				int totalnum = NoticeboardDAO.noticeboardNum();
				int currentpage = page;
				int totalnum2 = ((totalnum-1)/10)+1;
				
				Map <String,Object> map1 = new HashMap <String,Object>();
				map1.put("page", page);
				map1.put("totalnum", totalnum);
				
				System.out.println(page);
				System.out.println(totalnum);
				
				List <NoticeboardVO> list1 = NoticeboardDAO.noticeboardPaging(map1);
				
				mv.addObject("list1",list1);
				mv.setViewName("noticeboard");
				mv.addObject("totalnum2" , totalnum2);
				mv.addObject("p", currentpage);
				
				String user = req.getParameter("user");
				
				HttpSession hs = req.getSession();
				
				if(user!=null)
					hs.setAttribute("user", user);
				
				return mv;
			}
		
		@RequestMapping(value = "/noticeview" , method = RequestMethod.GET)
		public ModelAndView noticeview(ModelAndView mv,HttpServletRequest req)
		{
			int noticeno = Integer.parseInt(req.getParameter("noticeno"));
			
			System.out.println("글번호 : " + noticeno);
			
			NoticeboardVO nvo = NoticeboardDAO.noticeboardViewData(noticeno);
			
			mv.addObject("nvo",nvo);
			mv.setViewName("noticeview");
			
			return mv;
		}
		
		@RequestMapping(value = "/gonoticeinsert" , method = RequestMethod.GET)
		public ModelAndView gonoticeinsert(ModelAndView mv,HttpServletRequest req)
		{
			if(req.getParameter("edit")!=null)
			{
				String noticesubject = req.getParameter("noticesubject");
				String noticecontents = req.getParameter("noticecontents");
				int noticeno = Integer.parseInt(req.getParameter("noticeno"));
				String noticedate = req.getParameter("noticedate");
				
				mv.addObject("noticesubject",noticesubject);
				mv.addObject("noticecontents",noticecontents);
				mv.addObject("noticeno",noticeno);
				mv.addObject("noticedate",noticedate);
			}	
			mv.setViewName("noticeinsert");
			return mv;
		}
		
		@RequestMapping(value = "/noticeboarddelete" , method = RequestMethod.GET)
		public String noticeboarddelete(HttpServletRequest req)
		{
			int noticeno = Integer.parseInt(req.getParameter("noticeno"));
			
			NoticeboardDAO.noticeboardDeleteData(noticeno);
			
			return "redirect:/gonoticeboard?page=1";
		}
		
		@RequestMapping(value = "/noticeboardinsert" , method = RequestMethod.GET)
		public String noticeinsert(HttpServletRequest req)
		{	
			String noticesubject = req.getParameter("noticesubject");
			String noticecontents = req.getParameter("noticecontents");
			HttpSession Session = req.getSession();
            String noticeid = (String) Session.getAttribute("loginid");
			
			if(req.getParameter("edit")!=null)
			{
				int maxnum = Integer.parseInt(req.getParameter("noticeno"));
				
				NoticeboardVO nvo = new NoticeboardVO();
				nvo.setNoticesubject(noticesubject);
				nvo.setNoticecontents(noticecontents);
				nvo.setNoticeno(maxnum);
				
				NoticeboardDAO.noticeboardUpdate(nvo);
			}
			else
			{
				int temp;
				temp = NoticeboardDAO.noticeboardMaxNum();
				
				System.out.println("사이즈 안 후");
				int maxnum = temp+1;
				
				Date date = new Date();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String todate = transFormat.format(date);
				
				NoticeboardVO nvo = new NoticeboardVO(maxnum,noticesubject,noticecontents, noticeid, todate);
				
				NoticeboardDAO.noticeboardInsert(nvo);
				System.out.println("작성자" + noticeid);
			}	
			return "redirect:/gonoticeboard?page=1";
		}
	
		
		//-------------------------------상품리스트관련----------------------------------------
		@RequestMapping(value = "/search_product" , method = RequestMethod.GET)
		public ModelAndView search_product(ModelAndView mv , HttpServletRequest req)
		{
			int page = 1;
			
			if(req.getParameter("page")!=null)
	           {
	              page = Integer.parseInt(req.getParameter("page"));
	           }
			
			String searchProduct = req.getParameter("searchProduct");
			System.out.println(searchProduct);
			int totalnum=0;
			int totalnum2=0;
			List <ProductVO> productList=null;
			
			totalnum = ProductDAO.productSearchNum(searchProduct);
			System.out.println("전체상품개수: "+totalnum);
			totalnum2 = ((totalnum-1)/6)+1;
			Map <String,Object> map1 = new HashMap <String,Object>();
			
			map1.put("page", page);
 	       	map1.put("totalnum", totalnum);
 	       	map1.put("searchProduct", searchProduct);
			
			if(req.getParameter("viewmethod")!=null)
		    {
			    String view = req.getParameter("viewmethod");
			    mv.addObject("viewmethod",view);
			    System.out.println(view);
		    	   
		    switch(view)
		    {
		    case "productdate" :    
		    	map1.put("viewmethod","productdate");
			    break;	   
			case "productpriceup" :
			    map1.put("viewmethod","productpriceup");
			    break; 
			case "productpricedown" : 
			    map1.put("viewmethod","productpricedown");
			    break;
			    }
		    }
		    else
		    {
		    	map1.put("viewmethod","productdate");
		    }
			productList = ProductDAO.productSearchPaging(map1);

			mv.addObject("p_list", productList);
			mv.addObject("totalnum",totalnum);
			mv.addObject("totalnum2",totalnum2);
			mv.addObject("search",searchProduct);
			mv.addObject("page",page);
		    
			mv.setViewName("category/searchProduct");
			   
			return mv;
		}

		@RequestMapping(value = "/goproductinsert" , method = RequestMethod.GET)
		public ModelAndView goproductinsert(ModelAndView mv,HttpServletRequest req)
		{	
			if(req.getParameter("productcode") != null)
			{
				String productcode = req.getParameter("productcode");
				ProductVO pvo = ProductDAO.productViewData(productcode);
				mv.addObject("pvo",pvo);
			}
				
			mv.setViewName("productinsert");
			
			return mv;
		}
		
		public static String getUuid() { 
			return UUID.randomUUID().toString().replaceAll("-", ""); 
		}
		
		@RequestMapping(value = "/goproductlistpage" ,method = RequestMethod.GET)
	      public ModelAndView productlistpage(ModelAndView mv , HttpServletRequest req)
	      {     
	         int page = 1;
	         
	         if(req.getParameter("page")!=null)
	              {
	                 page = Integer.parseInt(req.getParameter("page"));
	              }
	         
	         String searchProduct = "";
	         if(req.getParameter("searchProduct") != null) {
	            searchProduct = req.getParameter("searchProduct");
	         }

	         int totalnum = ProductDAO.productNum2(searchProduct);
	         System.out.println(totalnum);
	            
	         int totalnum2 = ((totalnum-1)/10)+1;
	            
	         Map <String,Object> map2 = new HashMap <String,Object>();
	         map2.put("page", page);
	         map2.put("totalnum", totalnum);
	         map2.put("searchProduct", searchProduct);
	            
	         List <ProductVO> list1 = ProductDAO.productPaging(map2);
	            
	         mv.addObject("list1",list1);
	         mv.addObject("searchProduct",searchProduct);
	            
	         mv.setViewName("productlist");
	         mv.addObject("totalnum2",totalnum2);

	         return mv;
	      }
		@RequestMapping(value = "/goproductlist" , method = RequestMethod.GET)
		public ModelAndView goproductlist(ModelAndView mv,HttpServletRequest req)
		{	
			List <ProductVO> list1 = ProductDAO.productAllData();
			
			mv.addObject("list1", list1);
			mv.setViewName("productlist");
			
			String user = req.getParameter("user");
			
			HttpSession hs = req.getSession();
			
			if(user!=null)
				hs.setAttribute("user", user);
			
			
			return mv;
		}
		
		@RequestMapping(value = "/productins" , method = RequestMethod.POST)
        public String productinsert(HttpServletRequest req,MultipartHttpServletRequest mre) throws UnsupportedEncodingException
        {         
           String productsubject = mre.getParameter("productsubject");
           productsubject = new String(productsubject.getBytes("8859_1"),"utf-8");
           
           String productcontents = mre.getParameter("productcontents");
           productcontents = new String(productcontents.getBytes("8859_1"),"utf-8");
           
           String productgender = mre.getParameter("gender");
           productgender = new String(productgender.getBytes("8859_1"),"utf-8");
           
           int productstock = Integer.parseInt(mre.getParameter("productstock"));
           int productprice = Integer.parseInt(mre.getParameter("productprice"));
           
           if(mre.getParameter("edit") != null)
           {
              String productcode = req.getParameter("productcode");
              
              ProductVO pvo = new ProductVO();
              
              pvo.setProductsubject(productsubject);
              pvo.setProductcontents(productcontents);
              pvo.setProductstock(productstock);
              pvo.setProductprice(productprice);
              pvo.setProductgender(productgender);
              pvo.setProductcode(productcode);
              
              List<MultipartFile> mf2 = mre.getFiles("file");
              String uploadPath = "";
              
              if(!mf2.get(0).getOriginalFilename().equals(""))
              {     
                 String path = "C:/"+"upload/"+"test/"; // 파일 업로드 경로
                 System.out.println("1");
                 if(mre.getFileNames()==null) 
                 {
                    System.out.println("2");
                 }
                 else System.out.println("3");
                 
                 UploadDAO.uploadDelete(productcode);
                 
                 int sw = 0;
                 
                 for(MultipartFile mf : mf2)
                 {
                    String original = mf.getOriginalFilename();
                    int size = (int) mf.getSize();
                    String ext = original.substring(original.lastIndexOf('.'));
                    String saveFileName = getUuid() + ext;
                    uploadPath = path+File.separator+saveFileName;
                    try {
                       mf.transferTo(new File(uploadPath));
                    } catch (IllegalStateException e) {
                       // TODO Auto-generated catch block
                       e.printStackTrace();
                    } catch (IOException e) {
                       // TODO Auto-generated catch block
                       e.printStackTrace();
                    }
                   
                    int temp2;
                    temp2 = UploadDAO.uploadMaxNum();
                    int maxnum2 = temp2+1;
                    
                    UploadVO uvo = new UploadVO(maxnum2,productcode,original,saveFileName);
                    UploadDAO.uploadInsert(uvo);
                    
                    
                    if(sw == 0)
                    {
                       pvo.setOriginal_fname(original);
                       pvo.setStored_fname(saveFileName);
                       sw = 1;
                    }

                 }
                 
                 ProductDAO.productUpdatePic(pvo);
              }
              else
              {
                 ProductDAO.productUpdate(pvo);
              }
              
           }
           else
           {
              Date date = new Date();
              SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
              String todate = transFormat.format(date);
              
              String productsize = mre.getParameter("productsize");
              productsize = new String(productsize.getBytes("8859_1"),"utf-8");
              
              String productcolor = mre.getParameter("productcolor");
              
              String productcategory = mre.getParameter("category");
              productcategory = new String(productcategory.getBytes("8859_1"),"utf-8");

              int temp;
              temp = ProductDAO.productMaxNum();
              int maxnum = temp+1;
              
              String productcode = "";
              
              switch(productcategory)
              {
              case "상의" : productcode += "T"; break;
              case "하의" : productcode += "P"; break;
              case "가방" : productcode += "B"; break;
              case "신발" : productcode += "S"; break;
              case "액세서리" : productcode += "A"; break;
              }
              
              switch(productcolor)
              {
              case "RED" : productcode += "R"; break;
              case "ORANGE" : productcode += "O"; break;
              case "YELLOW" : productcode += "Y"; break;
              case "GREEN" : productcode += "G"; break;
              case "BLUE" : productcode += "B"; break;
              }
              
              switch(productsize)
              {
              case "S" : productcode += "S"; break;
              case "M" : productcode += "M"; break;
              case "L" : productcode += "L"; break;
              case "XL" : productcode += "X"; break;
              case "210" : productcode += "21"; break;
              case "220" : productcode += "22"; break;
              case "230" : productcode += "23"; break;
              case "240" : productcode += "24"; break;
              case "250" : productcode += "25"; break;
              case "260" : productcode += "26"; break;
              case "270" : productcode += "27"; break;
              case "280" : productcode += "28"; break;
              }
              
              if(maxnum<10)
                 productcode += ("00"+maxnum);
              else if(maxnum<100)
                 productcode += ("0"+maxnum);
              else
                 productcode += maxnum;

              
              double productstar = 0.0;
              
              ProductVO pvo = new ProductVO(maxnum,productcode,productcolor,productsize,productstock,productcategory,productgender,productsubject,productcontents,"noFile","noFile",todate,productstar,productprice);
              
              /*MultipartFile mf = mre.getFile("file"); // jsp file name mapping*/
              List<MultipartFile> mf2 = mre.getFiles("file");
              String uploadPath = "";
              
              if(!mf2.get(0).getOriginalFilename().equals(""))
              {
                 
                 String path = "C:/"+"upload/"+"test/"; // 파일 업로드 경로
                 System.out.println("1");
                 if(mre.getFileNames()==null) 
                 {
                    System.out.println("2");
                 }
                 else System.out.println("3");
                 
                 
                 for(MultipartFile mf : mf2)
                 {
                    String original = mf.getOriginalFilename();
                    int size = (int) mf.getSize();
                    String ext = original.substring(original.lastIndexOf('.'));
                    String saveFileName = getUuid() + ext;
                    uploadPath = path+File.separator+saveFileName;
                    try {
                       mf.transferTo(new File(uploadPath));
                    } catch (IllegalStateException e) {
                       // TODO Auto-generated catch block
                       e.printStackTrace();
                    } catch (IOException e) {
                       // TODO Auto-generated catch block
                       e.printStackTrace();
                    }
                    
                    int temp2;
                    temp2 = UploadDAO.uploadMaxNum();
                    int maxnum2 = temp2+1;
                    
                    UploadVO uvo = new UploadVO(maxnum2,productcode,original,saveFileName);
                    UploadDAO.uploadInsert(uvo);
                    
                    if(pvo.getOriginal_fname().equals("noFile"))
                    {
                       pvo.setOriginal_fname(original);
                       pvo.setStored_fname(saveFileName);
                    }
                 }
                 /*String original = mf.getOriginalFilename(); // 업로드하는 파일 name
                 System.out.println(original);
                 int size = (int) mf.getSize();
                 String ext = original.substring(original.lastIndexOf('.')); // 확장자 
                 String saveFileName = getUuid() + ext;
                    
                 System.out.println("!!!!!!!!!!"+original);   // file original name
                 System.out.println("!!!!!!!!!!"+size);// file size
                 System.out.println("!!!!!!!!!!"+saveFileName);// fileName암호화   
                 
                 uploadPath = path+File.separator+saveFileName; // 파일 업로드 경로 + 파일 이름
                 
                 
                 try {
                    mf.transferTo(new File(uploadPath)); // 파일을 위에 지정 경로로 업로드
                 } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 }
                 System.out.println("업로드완료");
                 pvo.setOriginal_fname(original);
                 pvo.setStored_fname(saveFileName);*/
              }
                 
              System.out.println("인서트전");
                 
              ProductDAO.productInsert(pvo);
                 
              System.out.println("인서트후");
           }
           


           return "redirect:/goproductlist";
        }

		@RequestMapping(value = "/productdelete" , method = RequestMethod.GET)
		public String productelete(HttpServletRequest req)
		{
			String productcode = req.getParameter("productcode");
			
			ProductDAO.productDelete(productcode);
			
			return "redirect:/goproductlist";
		}
		
        @RequestMapping(value = "/goproductdetail" , method = RequestMethod.GET)
        public ModelAndView goproductdetail(ModelAndView mv,HttpServletRequest req)
        {   
        	
            
           String productcode = req.getParameter("productcode");
           String r_sangpum = ReviewDAO.getSangpum(productcode);
           double avg =0.0;
           if(ReviewDAO.reviewAllData(r_sangpum).size() !=0) {
              System.out.println("있음");
              avg = ReviewDAO.getavg(r_sangpum);
           }
           
           System.out.println(productcode);
           
           ProductVO pvo = ProductDAO.productViewData(productcode);
           mv.addObject("pvo",pvo);
           
           List <UploadVO> uploadlist = UploadDAO.uploadData(productcode);
           mv.addObject("uplist",uploadlist);
           
           String productsubject = pvo.getProductsubject();
           
           List <ProductVO> list1 = ProductDAO.productSameData(productsubject);
           String sizetemp ="";
           List <String> size = new ArrayList<String>();
           
           for(ProductVO list2 : list1)
           {
              if(sizetemp.equals(""))
              {   
                 sizetemp = list2.getProductsize();
                 size.add(sizetemp);
              }
              else if(!sizetemp.equals(list2.getProductsize()))
              {   
                 sizetemp = list2.getProductsize();
                 size.add(sizetemp);
              }
           }
           
           String [] aa = new String [size.size()];
           sizetemp = "";
           int i=0;
           
           for(ProductVO list2 : list1)
           {
              if(sizetemp.equals(""))
              {         
                 aa[i] = "\""+list2.getProductcolor()+"\"";
                 sizetemp = list2.getProductsize();
              }
              else if(sizetemp.equals(list2.getProductsize()))
              {
                 aa[i] += ","+"\""+list2.getProductcolor()+"\"";
              }
              else if(!sizetemp.equals(list2.getProductsize()))
              {   
                 mv.addObject("color"+sizetemp,aa[i]);
                 i++;
                 aa[i] = "\""+list2.getProductcolor()+"\"";
                 sizetemp = list2.getProductsize();
              }
           }
           
           mv.addObject("size",size);
           mv.addObject("color"+sizetemp,aa[i]);
           mv.addObject("avg",avg);
           mv.setViewName("productdetail");
           
           System.out.println(mv.getModel());
           
           return mv;
        }
		
		//-------------------------------리뷰관련----------------------------------------
				
        @RequestMapping(value = "/search_id" , method = RequestMethod.GET)
		public ModelAndView search_id(ModelAndView mv , HttpServletRequest req)
		{
			int page = 1;
			
			String user = req.getParameter("user");
			
			String searchID = req.getParameter("searchID");
			System.out.println("정보찾을때 아이디 ="+searchID);
			int totalnum=0;
			int totalnum2=0;
			List <ReviewVO> reviewList=null;
			if(searchID.equals("")) {
				totalnum = ReviewDAO.reviewNum1();
				
				totalnum2 = ((totalnum-1)/10)+1;
				
				Map <String,Object> map1 = new HashMap <String,Object>();
				map1.put("page", page);
				map1.put("totalnum", totalnum);
				
				reviewList = ReviewDAO.reviewPaging10(map1);
			}else {
				totalnum = ReviewDAO.mypageNum(searchID);
				
				totalnum2 = ((totalnum-1)/10)+1;
				
				Map <String,Object> map1 = new HashMap <String,Object>();
				map1.put("page", page);
				map1.put("totalnum", totalnum);
				map1.put("user", searchID);
				
				reviewList = ReviewDAO.reviewPaging(map1);
			}
			
			mv.addObject("r_list", reviewList);
			mv.addObject("totalnum2",totalnum2);
			mv.addObject("user",user);
			mv.addObject("search",searchID);
			mv.addObject("page",page);
		      
			mv.setViewName("reviewboard1");
			   
			return mv;
		}
		
		@RequestMapping(value = "/reviewDel" , produces = "application/json")
		public @ResponseBody Map<String,Object> reviewDel(@RequestBody Map<String, Object> params , HttpServletRequest req)
		{
			int page =(Integer) params.get("page");
			String searchID = (String)params.get("search");
			int r_num = (Integer)params.get("num");
			System.out.println(r_num);
			System.out.println("ID="+searchID);
			ReviewDAO.delReview(r_num);

			int totalnum=0;
			int totalnum2=0;
			List <ReviewVO> reviewList=null;
			if(searchID.equals("")) {
				totalnum = ReviewDAO.reviewNum1();
				
				totalnum2 = ((totalnum-1)/10)+1;
				
				Map <String,Object> map1 = new HashMap <String,Object>();
				map1.put("page", page);
				map1.put("totalnum", totalnum);
				
				if(ReviewDAO.reviewPaging10(map1).size()==0) {
					map1.put("page", (Integer)map1.get("page") - 1);
				}
				reviewList = ReviewDAO.reviewPaging10(map1);
			}else {
				totalnum = ReviewDAO.mypageNum(searchID);
				
				totalnum2 = ((totalnum-1)/10)+1;
				
				Map <String,Object> map1 = new HashMap <String,Object>();
				map1.put("page", page);
				map1.put("totalnum", totalnum);
				map1.put("user", searchID);
				
				if(ReviewDAO.reviewPaging(map1).size()==0) {
					map1.put("page", (Integer)map1.get("page") - 1);
					if((Integer)map1.get("page")<1) {
						map1.put("page", (Integer)map1.get("page")+1);
						map1.put("totalnum", ReviewDAO.reviewNum1());
						reviewList = ReviewDAO.reviewPaging10(map1);
					}
				}
				else
					reviewList = ReviewDAO.reviewPaging(map1);
			}
			
			Map <String,Object> map2 = new HashMap <String,Object>();
			map2.put("r_list", reviewList);
			map2.put("page", page);
			map2.put("totalnum2",totalnum2);
			map2.put("search", searchID);

			return map2;
		}
		
		@RequestMapping(value = "/goreviewboard1" , method = RequestMethod.GET)
		public ModelAndView goreviewboard1(ModelAndView mv , HttpServletRequest req)
		{
			int page = 1;
			String searchID ="";
			
			if(req.getParameter("page")!=null)
			{
				page = Integer.parseInt(req.getParameter("page"));
			}
			
			int totalnum = ReviewDAO.reviewNum1();
			
			int totalnum2 = ((totalnum-1)/10)+1;
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			map1.put("page", page);
			map1.put("totalnum", totalnum);
			
			List <ReviewVO> list1 = ReviewDAO.reviewPaging10(map1);
			
			mv.addObject("r_list",list1);
			mv.addObject("totalnum2" , totalnum2);
			mv.addObject("page",page);
			mv.addObject("search",searchID);
			mv.setViewName("reviewboard1");
			
			String user = req.getParameter("user");
			
			HttpSession hs = req.getSession();
			
			if(user!=null)
				hs.setAttribute("user", user);
			
			mv.addObject("user",user);
			
			return mv;
		}
		
		
		@RequestMapping(value = "/goreviewpage1" , produces = "application/json")
		public @ResponseBody Map<String,Object> goreviewpage1(@RequestBody Map<String, Object> params , HttpServletRequest req)
		{
			int page =(Integer) params.get("page");
			String searchID = (String)params.get("search");
			System.out.println("id="+searchID);
			
			int totalnum=0;
			int totalnum2=0;
			List <ReviewVO> reviewList=null;
			if(searchID.equals("")) {
				System.out.println("zero일때");
				totalnum = ReviewDAO.reviewNum1();
				System.out.println(totalnum);
				
				totalnum2 = ((totalnum-1)/10)+1;
				
				Map <String,Object> map1 = new HashMap <String,Object>();
				map1.put("page", page);
				map1.put("totalnum", totalnum);
				System.out.println("다옴다옴");
				reviewList = ReviewDAO.reviewPaging10(map1);
			}else {
				System.out.println("아이디 있을때");
				totalnum = ReviewDAO.mypageNum(searchID);
				
				totalnum2 = ((totalnum-1)/10)+1;
				
				Map <String,Object> map1 = new HashMap <String,Object>();
				map1.put("page", page);
				map1.put("totalnum", totalnum);
				map1.put("user", searchID);
				
				reviewList = ReviewDAO.reviewPaging(map1);
			}

			Map <String,Object> map2 = new HashMap <String,Object>();
			map2.put("r_list", reviewList);
			map2.put("page", page);
			map2.put("totalnum2",totalnum2);
			map2.put("search", searchID);

			return map2;
		}
		
		@RequestMapping(value = "/goreviewinsert" , method = RequestMethod.GET)
		public ModelAndView goreviewinsert(ModelAndView mv,HttpServletRequest req)
		{	
		      HttpSession Session = req.getSession();
		      
		      String loginid = (String) Session.getAttribute("loginid");
		      
		      String r_sangpum=req.getParameter("r_sangpum");
		      System.out.println("인서트"+r_sangpum);
		      String r_color=req.getParameter("r_color");
		      String r_size = req.getParameter("r_size");
		      int orderno = Integer.parseInt(req.getParameter("orderno"));
		      
		      mv.addObject("r_sangpum",r_sangpum);
		      mv.addObject("r_size",r_size);
		      mv.addObject("r_color",r_color);
		      mv.addObject("orderno",orderno);
		      mv.setViewName("reviewinsert");
			
			return mv;
		}
		
		@RequestMapping(value = "/reviewboard" , method = RequestMethod.GET)
		public ModelAndView reviewboard(ModelAndView mv,HttpServletRequest req)
		{
			int page = 1;
			int choice = 0;
			String productcode = req.getParameter("productcode");
			System.out.println(productcode);
			String r_sangpum = ReviewDAO.getSangpum(productcode);
			System.out.println(r_sangpum);
			
			if(req.getParameter("page") != null) {
				page = Integer.parseInt(req.getParameter("page"));
			}
			
			int totalnum = ReviewDAO.reviewNum(r_sangpum);
			int totalnum2 = ((totalnum-1)/10)+1;
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			map1.put("page", page);
			map1.put("totalnum", totalnum);
			map1.put("r_sangpum", r_sangpum);
			
			String user=null;
			HttpSession session = req.getSession(true);
			if(session.getAttribute("loginid") != null) {
				user = (String)session.getAttribute("loginid");
			}else {
				user = "123";
			}
			
			ReviewDAO.setZero();
			ReviewDAO.setCheck(user); 		

			List <ReviewVO> reviewList = ReviewDAO.reviewPaging1(map1);
			
			List<ReviewVO> pic_list = ReviewDAO.collectpic(r_sangpum);
			String[] arr = new String[pic_list.size()];
			
			List <String> picurl = new ArrayList<String>();
			
			for(ReviewVO list2 : pic_list)
			{
				picurl.add("\"/imsi/C:/upload/test/"+list2.getStored_fname()+"\"");
			}
			
			mv.addObject("picarray2",picurl);
			
			List<ReviewVO> total_list = ReviewDAO.getTotal(r_sangpum);
			int five = 0;
			int four = 0;
			int three = 0;
			int two = 0;
			int one = 0;

			int total = total_list.size();
			
			for(int i=0;i<total;i++) {
				ReviewVO vo = total_list.get(i);
				if(vo.getR_star() ==1) one++;
				else if(vo.getR_star() ==2) two++;
				else if(vo.getR_star() ==3) three++;
				else if(vo.getR_star() ==4) four++;
				else five++;
			}
			
			double avg = ((one*1+two*2+three*3+four*4+five*5)*1.0)/total;
			avg = Math.round(avg*10)/10.0;
			
			
			mv.addObject("r_list", reviewList);
			mv.addObject("totalnum2",totalnum2);
			mv.addObject("r_sangpum",r_sangpum);
			mv.addObject("choice",choice);
			mv.addObject("page",page);
			mv.addObject("user",user);
			
			mv.addObject("one",one);
			mv.addObject("two",two);
			mv.addObject("three",three);
			mv.addObject("four",four);
			mv.addObject("five",five);
			mv.addObject("total",total);
			mv.addObject("avg",avg);
			
			mv.addObject("pic_list",pic_list);
			
			System.out.println("1");
			mv.setViewName("reviewboard");
			return mv;
		}
		@RequestMapping(value = "/reviewpage" , produces = "application/json")
		public @ResponseBody Map<String,Object> reviewpage(@RequestBody Map<String, Object> params , HttpServletRequest req)
		{
			int choice = (Integer)params.get("choice");
			int page =(Integer) params.get("page");
			String r_sangpum = (String) params.get("r_sangpum");
			String user = (String) params.get("user");
			System.out.println(choice);
			int totalnum = ReviewDAO.reviewNum(r_sangpum);
			int totalnum2 = ((totalnum-1)/10)+1;
			
			Map <String,Object> map2 = new HashMap <String,Object>();
			map2.put("page", page);
			map2.put("totalnum", totalnum);
			map2.put("r_sangpum", r_sangpum);
			
			ReviewDAO.setZero();
			ReviewDAO.setCheck(user);
			List <ReviewVO> list1 = null;
			
			if(choice ==0) {
				list1 = ReviewDAO.reviewPaging1(map2);
			}else if(choice ==1) {
				list1 = ReviewDAO.reviewPaging2(map2);
			}else if(choice ==2) {
				list1 = ReviewDAO.reviewPaging3(map2);
			}else if(choice ==3) {
				list1 = ReviewDAO.reviewPaging4(map2);
			}
			
			Map <String,Object> map1 = new HashMap <String,Object>();
			
			map1.put("r_list" , list1);
			
			map1.put("choice", choice);

			map1.put("page", page);
			
			map1.put("r_sangpum", r_sangpum);
			
			map1.put("user", user);
			
			map1.put("totalnum2",totalnum2);

			return map1;
		}
	
	
		
	      @RequestMapping(value = "/goreview", method = RequestMethod.POST)
	        public String uploadTest(ModelAndView mv,MultipartHttpServletRequest mre,HttpServletRequest req) throws UnsupportedEncodingException{
	           
	           
	           ReviewVO reviewvo = new ReviewVO();
	           
	           
	           int temp = ReviewDAO.reviewMaxNum();
	           int maxnum = temp+1;
	           
	           String sangpum = mre.getParameter("r_sangpum");
	           sangpum = new String(sangpum.getBytes("8859_1"),"utf-8");
	           
	           String title = mre.getParameter("title");
	           title = new String(title.getBytes("8859_1"),"utf-8");
	           
	           
	           String naeyong = mre.getParameter("naeyong");
	           
	           naeyong = new String(naeyong.getBytes("8859_1"),"utf-8");
	           System.out.println("후기내용2123123123211 " + naeyong);
	           System.out.println("!!!!!!!!@#@!#@!#@!#@!#!@#");
	           
	           String color = mre.getParameter("r_color");
	           color = new String(color.getBytes("8859_1"),"utf-8");
	           
	           String r_size = mre.getParameter("r_size");
	           r_size = new String(r_size.getBytes("8859_1"),"utf-8");
	           
	           
	           HttpSession Session = mre.getSession();
	           String name = (String) Session.getAttribute("loginid");
	           System.out.println("=====");
	           System.out.println(name);
	           
	           
	           MemberVO loginvo =  (MemberVO) Session.getAttribute("loginvo");
	           System.out.println(loginvo.getGrade());
	           
	           String grade = loginvo.getGrade();
	           r_size = r_size+"-"+color;

	           
	           
	           
	           Date date = new Date();
	           SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	           String todate = transFormat.format(date);
	           
	           double r_star = Double.parseDouble(mre.getParameter("star1"));
	           
	           reviewvo.setR_num(maxnum);
	           reviewvo.setR_grade(grade);
	           reviewvo.setR_sangpum(sangpum);
	           reviewvo.setR_size(r_size);
	           reviewvo.setR_title(title);
	           reviewvo.setR_text(naeyong);
	           reviewvo.setR_writer(name);///////////////////
	           reviewvo.setR_date(todate);
	           reviewvo.setR_star(r_star);
	           
	           reviewvo.setOriginal_fname("noFile");
	           reviewvo.setStored_fname("noFile");
	           
	           
	           System.out.println("후기내용3131232 " + naeyong);
	           
	           MultipartFile mf = mre.getFile("file"); // jsp file name mapping
	           String uploadPath = "";
	           
	           if(!mf.isEmpty()) {
	              
	              String path = "C:/"+"upload/"+"test/"; // 파일 업로드 경로
	              System.out.println(1);
	              if(mre.getFileNames()==null) {
	                 System.out.println(2);
	              }
	              else System.out.println(3);
	              String original = mf.getOriginalFilename(); // 업로드하는 파일 name
	              System.out.println(original);
	              int size = (int) mf.getSize();
	              String ext = original.substring(original.lastIndexOf('.')); // 확장자 
	              String saveFileName = getUuid() + ext;
	                 
	              System.out.println("!!!!!!!!!!"+original);   // file original name
	              System.out.println("!!!!!!!!!!"+size);// file size
	              System.out.println("!!!!!!!!!!"+saveFileName);// fileName암호화   
	              
	              uploadPath = path+File.separator+saveFileName; // 파일 업로드 경로 + 파일 이름
	              
	              
	              try {
	                 mf.transferTo(new File(uploadPath)); // 파일을 위에 지정 경로로 업로드
	              } catch (IllegalStateException e) {
	                 // TODO Auto-generated catch block
	                 e.printStackTrace();
	              } catch (IOException e) {
	                 // TODO Auto-generated catch block
	                 e.printStackTrace();
	              }
	              System.out.println("업로드완료");
	              reviewvo.setOriginal_fname(original);
	              reviewvo.setStored_fname(saveFileName);
	           }
	           
	           ReviewDAO.insertReview(reviewvo);
	           ReviewDAO.insertPoint(name);
	           
	           int orderno = Integer.parseInt(mre.getParameter("orderno")); 
	           OrderhistoryDAO.uploadReview(orderno);
	           
	           
	           // 적립금 내역 기록
	           
	           PointVO Pvo = new PointVO();
	           
	           Date now = new Date(); // java.util.Date, NOT java.sql.Date or java.sql.Timestamp!
	           String time = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(now);   
	           
	           HttpSession session = mre.getSession();
	           String id = (String) session.getAttribute("loginid");
	           
	           Pvo.setId(id);
	           Pvo.setPoint("+100");
	           Pvo.setContents("후기작성");
	           Pvo.setTime(time);
	           
	           PointDAO.signuppoint(Pvo);



	          // 등업할지 확인


	            MemberVO loginvo1 = MemberDAO.getInfo(name);  // 현재의 적립금과 등급을 불러옴
	                int repoint2 = loginvo1.getPoint();
	               

	          
	             if(repoint2 >= 10000 && grade.equals("bronze") ) {
	                loginvo1.setGrade("silver");
	             } 
	             else if(repoint2 >= 30000 && grade.equals("silver")) {
	                loginvo1.setGrade("gold");
	             }
	       
	           
	        session.setAttribute("loginvo", loginvo1);
	           
	        return "redirect:/myreview";
	        }

		
		@RequestMapping(value="/check_like", method=RequestMethod.POST, produces="application/json")
		  public @ResponseBody Map<String,Object> like(@RequestBody Map<String, Object> params, HttpSession session){
			
			Map <String,Object> map1 = new HashMap <String,Object>();

			int r_num = (Integer) params.get("number");
			
			ReviewDAO reviewdao = new ReviewDAO();

			String user = (String)params.get("user");
			String writer = ReviewDAO.checkWriter(r_num);
			
			HashMap <String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("id", user);
			hashMap.put("r_num", r_num);
			
			String msg="본인 게시물에 좋아요를 할 수 없습니다.";
			
			if(!writer.equals(user)) {
				int like_check = reviewdao.check(hashMap);
				
				if(like_check == 0) {
			    	msg="좋아요!";
			    	reviewdao.like_inc(r_num);
			    	reviewdao.like_insert(user, r_num);
			    	if(reviewdao.like_cnt(r_num)>=reviewdao.getStandard(r_num)) {
			    		reviewdao.insertPoint(writer);
			    		reviewdao.standard_inc(r_num);
			    		
			    		// 적립금 내역 기록
					      
					      PointVO Pvo = new PointVO();
							
							Date now = new Date(); // java.util.Date, NOT java.sql.Date or java.sql.Timestamp!
							String time = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(now);	
							
							Pvo.setId(writer);
							Pvo.setPoint("+100");
							Pvo.setContents("좋아요 10회 추천");
							Pvo.setTime(time);
													
							PointDAO.signuppoint(Pvo);

							
							System.out.println("여기까지가 적립내역 완료");
					
							
							
		   		 			 // 등업할지 확인

							 MemberVO loginvo = MemberDAO.getInfo(writer);  // 현재의 적립금과 등급을 불러옴
							 int repoint2 = loginvo.getPoint();
							 String grade = loginvo.getGrade();
							 System.out.println("현재 점수 출력 : "+repoint2);
					
		       
		       		    	if(repoint2 >= 10000 && grade.equals("bronze") ) {
		       		    		MemberVO loginvo2 = new MemberVO();
								loginvo2.setId(writer);
								loginvo2.setGrade("silver");
		        	   		MemberDAO.upgrade(loginvo2);
		         		  	} 
		       			   	else if(repoint2 >= 30000 && grade.equals("silver")) {
		       			 	MemberVO loginvo2 = new MemberVO();
							loginvo2.setId(writer);
							loginvo2.setGrade("gold");
							MemberDAO.upgrade(loginvo2);
		          		 	}
		           

			    	}
			    }else if(like_check==1) {
			    	msg="좋아요 취소";
			    	reviewdao.like_dec(r_num);
			    	reviewdao.like_delete(hashMap);
			    }else {
			    	msg="이미 싫어요를 누르셨습니다.";
			    }
			}
			int check = reviewdao.check(hashMap);
		    int like_cnt = reviewdao.like_cnt(r_num);
		    
		    map1.put("like_check", check);
		    map1.put("like_cnt", like_cnt);
		    map1.put("msg", msg);
		    
		    return map1;
		  }
		  
		  @RequestMapping(value="/check_dislike", method=RequestMethod.POST, produces="application/json")
		  public @ResponseBody Map<String,Object> dislike(@RequestBody Map<String, Object> params, HttpSession session){
			
			Map <String,Object> map1 = new HashMap <String,Object>();





			
			int r_num = (Integer) params.get("number");

			ReviewDAO reviewdao = new ReviewDAO();
			
			String user = (String)params.get("user");
			String writer = ReviewDAO.checkWriter(r_num);
			
			HashMap <String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("id", user);
			hashMap.put("r_num", r_num);
			
			String msg="본인 게시물에 싫어요를 할 수 없습니다.";
			
			if(!writer.equals(user)) {
				int like_check = reviewdao.check(hashMap);
				
				if(like_check == 0) {
			    	msg="싫어요..";
			    	reviewdao.dislike_inc(r_num);
			    	reviewdao.dislike_insert(user, r_num);
			    }else if(like_check==-1) {
			    	msg="싫어요 취소";
			    	reviewdao.dislike_dec(r_num);
			    	reviewdao.like_delete(hashMap);
			    }else {
			    	msg="이미 좋아요를 누르셨습니다.";
			    }
			}
		    int check = reviewdao.check(hashMap);
		    int dislike_cnt = reviewdao.dislike_cnt(r_num);
		    
		    map1.put("like_check", check);
		    map1.put("dislike_cnt", dislike_cnt);
		    map1.put("msg", msg);
		    
		    return map1;
		  }
}
