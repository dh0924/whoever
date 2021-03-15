package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ProductDAO {
	
	private static SqlSessionFactory sqlSessionFactory1;
	static 
	{
		String myxml = "/META-INF/mybatis/Mybatis-config.xml";
		InputStream istream=null;
		
		try {
			istream = Resources.getResourceAsStream(myxml);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//마이바티스 configuration file(구성파일)을 읽어
		//SqlSessionFactory객체가 생성된다
		sqlSessionFactory1 = new SqlSessionFactoryBuilder().build(istream);
	}
	
	public static int productSearchNum(String searchProduct)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int totalnum = 0;
		if(searchProduct.equals("")) {
			totalnum = sqlsession1.selectOne("productAllNum");
		}
		else {
			System.out.println(searchProduct);
			totalnum = sqlsession1.selectOne("productSearchNum",searchProduct);
		}
		sqlsession1.close();
		return totalnum;
	}

public static List <ProductVO> productSearchPaging(Map <String,Object> map1)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <ProductVO> list1 = sqlsession1.selectList("productSearchPaging",map1);
	      sqlsession1.close();
	      return list1;
	     
	   }
	public static List <ProductVO> productgenderPaging(Map <String,Object> map1)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <ProductVO> list1 = sqlsession1.selectList("productgenderPaging",map1);
	      sqlsession1.close();
	      return list1;
	     
	   }

	public static int productgenderNum(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int totalnum = sqlsession1.selectOne("productgenderNum",map1);
		sqlsession1.close();
		return totalnum;
	}
	
	public static void productUpdatePic(ProductVO pvo)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      sqlsession1.update("productUpdatePic",pvo);
	      sqlsession1.commit();
	      sqlsession1.close();
	   }
	
	public static List <ProductVO> productAllData()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ProductVO> list1 = sqlsession1.selectList("productAllData");
		sqlsession1.close();
		return list1;
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	
	public static ProductVO productViewData(String productcode)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		ProductVO pvo = sqlsession1.selectOne("productViewData",productcode);
		sqlsession1.close();
		return pvo;
	}
	
	public static int productNum2(String searchProduct)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int totalnum = 0;
		if(searchProduct.equals("")) {
			totalnum = sqlsession1.selectOne("productAllNum2");
		}
		else {
			System.out.println(searchProduct);
			totalnum = sqlsession1.selectOne("productSearchNum2",searchProduct);
		}
		sqlsession1.close();
		return totalnum;
	}
	
	public static List <ProductVO> productPaging(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <ProductVO> list1= sqlsession1.selectList("productPaing",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static void productInsert(ProductVO pvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("productInsert",pvo);
		System.out.println("ㄱㄱ");
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void productUpdate(ProductVO pvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("productUpdate",pvo);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void productDelete(String productcode)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.delete("productDelete",productcode);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static int productMaxNum()
	{
	
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		
		
		int num = 0;
		
		if(sqlsession1.selectOne("productMaxNum")!=null)
			num = sqlsession1.selectOne("productMaxNum");
		
		
		sqlsession1.close();
		return num;
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	public static List <ProductVO> productSameData(String productsubject)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <ProductVO> list1 = sqlsession1.selectList("productSameData",productsubject);
	      sqlsession1.close();
	      return list1;
	      //여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
	      //전체 추출된 결과가 selectList()로 전부 보이게
	   }
	
	public static List <ProductVO> mainProductList(String categori)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <ProductVO> list1 = sqlsession1.selectList("mainProductList",categori);
	      sqlsession1.close();
	      return list1;
	     
	   }
	
	public static List <ProductVO> productNew()
	{
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <ProductVO> list1 = sqlsession1.selectList("productNew");
	      sqlsession1.close();
	      return list1;
	}
	
	public static String productMapping(ProductVO pvo)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      String productcode = sqlsession1.selectOne("productMapping",pvo);
	      sqlsession1.close();
	      return productcode;
	   }
	
	
}
