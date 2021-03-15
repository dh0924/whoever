package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class OrderhistoryDAO {

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
		//���̹�Ƽ�� configuration file(��������)�� �о�
		//SqlSessionFactory��ü�� �����ȴ�
		sqlSessionFactory1 = new SqlSessionFactoryBuilder().build(istream);
	}
	
	public static void orderhistoryInsert(OrderhistoryVO ovo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("orderhistoryInsert",ovo);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static int orderhistoryMaxNum()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		
		int num = 0;
		
		if(sqlsession1.selectOne("orderhistoryMaxNum")!=null)
			num = sqlsession1.selectOne("orderhistoryMaxNum");
		
		sqlsession1.close();
		return num;
		//���⼭ sqlSessionFactory�� query ���� --> mapper.xml�� select�� ����
		//��ü ����� ����� selectList()�� ���� ���̰�
	}
	
	public static List <OrderhistoryVO> orderhistoryMyPaging(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <OrderhistoryVO> list1= sqlsession1.selectList("orderhistoryMyPaing",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static int orderhistoryMyNum(String memberid)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int totalnum = 1;
		if(sqlsession1.selectOne("orderhistoryMyNum",memberid) != null)
		{
			totalnum = sqlsession1.selectOne("orderhistoryMyNum",memberid);
		}
		sqlsession1.close();
		return totalnum;
	}
	 public static void orderhistoryDelete(int orderno)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      sqlsession1.delete("orderhistoryDelete",orderno);
	      sqlsession1.commit();
	      sqlsession1.close();
	   }
	   public static List <OrderhistoryVO> orderhistoryPaging(Map <String,Object> map1)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <OrderhistoryVO> list1= sqlsession1.selectList("orderhistoryPaing",map1);
	      sqlsession1.close();
	      return list1;
	   }
	   
	   public static int orderhistoryNum()
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      int totalnum = sqlsession1.selectOne("orderhistoryNum");
	      sqlsession1.close();
	      return totalnum;
	   }

	    public static void orderhistoryUpdate(int orderno)
	      {
	         SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	         sqlsession1.update("orderhistoryUpdate",orderno);
	         sqlsession1.commit();
	         sqlsession1.close();
	      }
	    
	    public static void uploadReview(int orderno)
	      {
	         SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	         sqlsession1.update("uploadReview",orderno);
	         sqlsession1.commit();
	         sqlsession1.close();
	      }

	    public static int orderhistoryCheckNum(String searchID)
		{
			SqlSession sqlsession1 = sqlSessionFactory1.openSession();
			int totalnum = 0;
			if(searchID.equals("")) {
				totalnum = sqlsession1.selectOne("orderhistoryAllNum");
			}
			else {
				System.out.println("�˻�������");
				totalnum = sqlsession1.selectOne("orderhistorySearchNum",searchID);
			}
			sqlsession1.close();
			return totalnum;
		}

	   public static List <OrderhistoryVO> orderhistoryCheckPaging(Map <String,Object> map1)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <OrderhistoryVO> list1= sqlsession1.selectList("orderhistoryCheckPaing",map1);
	      sqlsession1.close();
	      return list1;
	   }
	   
	   public static List <OrderhistoryVO> orderhistoryMyList(String id)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <OrderhistoryVO> list1= sqlsession1.selectList("orderhistoryMyList",id);
	      sqlsession1.close();
	      return list1;
	   }
}
