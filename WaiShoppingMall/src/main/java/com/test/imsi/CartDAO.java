package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CartDAO {
	
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
	   public static List <CartVO> cartView(String id)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <CartVO> list1 = sqlsession1.selectList("cartView",id);
	      sqlsession1.close();
	      return list1;
	   }
	   
	   public static void cartDelete(String id,String [] DATA)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      
	      Map <String,Object> map1 = new HashMap <String,Object>();
	      map1.put("id", id);
	      for(int i=0;i<DATA.length;i++)
	      {
	    	  map1.put("cartno", DATA[i]);
	    	  sqlsession1.delete("cartDelete",map1);
	      }
	      
	      sqlsession1.commit();
	      sqlsession1.close();
	   }
	public static void cartInsert(CartVO cvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("cartInsert",cvo);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static int cartMaxNum()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		
		int num = 0;
		
		if(sqlsession1.selectOne("cartMaxNum")!=null)
			num = sqlsession1.selectOne("cartMaxNum");
		
		sqlsession1.close();
		return num;
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	
}
