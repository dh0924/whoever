package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class PointDAO {

private static SqlSessionFactory sqlSessionFactory1;
	
	static {
		String myxml="/META-INF/mybatis/Mybatis-config.xml"; // Mybatis-config.xml ȯ�漳�� ������ �޾Ƽ� 
		InputStream istream=null;
		
		try {
			istream=Resources.getResourceAsStream(myxml);  // Mybatis-config.xml�� �о����
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		// Mybatis-configuration file(��������)�� �о� SqlSessionFactory ��ü�� �����ȴ�. 
		
		sqlSessionFactory1 = new SqlSessionFactoryBuilder().build(istream);
	}
	public static List <PointVO> myPointPaging(Map <String,Object> map1)
    {
       SqlSession sqlsession1 = sqlSessionFactory1.openSession();
       List <PointVO> list1= sqlsession1.selectList("myPointPaging",map1);
       sqlsession1.close();
       return list1;
    }
 
  public static int MyPointNum(String id)
    {
       SqlSession sqlsession1 = sqlSessionFactory1.openSession();
       int totalnum = sqlsession1.selectOne("MyPointNum", id);
       sqlsession1.close();
       return totalnum;
    }
	
	public static void signuppoint(PointVO vo) {
		System.out.println("�ٿ����� ���� ���� Ȯ��");
		System.out.println(vo.getId());
		System.out.println(vo.getPoint());
		System.out.println(vo.getContents());
		System.out.println(vo.getTime());
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("pointcontents", vo);
		sqlsession1.commit();
		sqlsession1.close();
				   
		}
	
}