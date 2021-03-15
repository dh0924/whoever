package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class QnaboardDAO {

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
	
	public static int qnaboardNum2(String searchID)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int totalnum = 0;
		if(searchID.equals("")) {
			totalnum = sqlsession1.selectOne("qnaboardNum1");
		}
		else {
			totalnum = sqlsession1.selectOne("qnaboardSearchNum",searchID);
		}
		sqlsession1.close();
		return totalnum;
	}

public static List <QnaboardVO> qnaboardPaging2(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <QnaboardVO> list1= sqlsession1.selectList("qnaboardPaging2",map1);
		sqlsession1.close();
		return list1;
	}
	   public static List <QnaboardVO> qnaboardMyPaging(Map <String,Object> map1)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      List <QnaboardVO> list1= sqlsession1.selectList("qnaboardMyPaing",map1);
	      sqlsession1.close();
	      return list1;
	   }
	   public static void qnaboardModify(QnaboardVO qvo)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      sqlsession1.update("qnaboardModify",qvo);
	      sqlsession1.commit();
	      sqlsession1.close();
	   }
	   
	   public static int qnaboardMyNum(String memberid)
	   {
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      int totalnum = sqlsession1.selectOne("qnaboardMyNum",memberid);
	      sqlsession1.close();
	      return totalnum;
	   }
	   
	public static List <QnaboardVO> qnaboardAllData()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <QnaboardVO> list1 = sqlsession1.selectList("qnaboardAllData");
		sqlsession1.close();
		return list1;
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	
	public static int qnaboardNum(String productcode)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int totalnum = sqlsession1.selectOne("qnaboardNum",productcode);
		sqlsession1.close();
		return totalnum;
	}
	
	public static int qnaboardNum1()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int totalnum = sqlsession1.selectOne("qnaboardNum1");
		sqlsession1.close();
		return totalnum;
	}
	
	public static List <QnaboardVO> qnaboardPaging(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <QnaboardVO> list1= sqlsession1.selectList("qnaboardPaing",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static List <QnaboardVO> qnaboardPaging1(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <QnaboardVO> list1= sqlsession1.selectList("qnaboardPaing1",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static QnaboardVO qnaboardSearchData(int qnano)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		QnaboardVO qvo = sqlsession1.selectOne("qnaboardSearchData",qnano);
		sqlsession1.close();
		return qvo;
	}
	
	public static int qnaboardMaxNum()
	{
		System.out.println("사이즈 계산중");
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		System.out.println("왜 안나옴?");
		
		int num = 0;
		
		if(sqlsession1.selectOne("qnaboardMaxNum")!=null)
			num = sqlsession1.selectOne("qnaboardMaxNum");
		
		System.out.println("어이가없네");
		sqlsession1.close();
		return num;
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	
	public static void qnaboardInsert(QnaboardVO qvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("qnaboardInsert",qvo);
		System.out.println("ㄱㄱ");
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void qnaboardDelete(int qnano)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.delete("qnaboardDelete",qnano);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void qnaboardUpdate(QnaboardVO qvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("qnaboardUpdate",qvo);
		sqlsession1.commit();
		sqlsession1.close();
	}
	/*
	public static EmployeeVO employeeDetailData(EmployeeVO vo1)
	{
		return (EmployeeVO) sqlSessionFactory1.openSession().selectOne("employeeDetailData",vo1);
	}*/
	
//	public static EmployeeVO employeeDetailData(int employee_id,String last_name)
//	{
//		HashMap hm1 = new HashMap();
//		hm1.put("employee_id", employee_id);
//		hm1.put("last_name", last_name);
//		return (EmployeeVO) sqlSessionFactory1.openSession().selectOne("employeeDetailData",hm1)
//	}
	
//	
//	public static int employeeInsertData(EmployeeVO employeeVO)
//	{
//		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
//		sqlsession1.insert("employeeInsertData",employeeVO);
//		sqlsession1.commit();
//		
////		return sqlsession1.insert("employeeInsertData",employeeVO);
//		return 1;
//		
////		HashMap hm1 = new HashMap();
////		hm1.put("employee_id", employee_id);
////		hm1.put("first_name", first_name);
////		hm1.put("last_name", last_name);
////		hm1.put("email", email);
////		hm1.put("phone_number", phone_number);
////		hm1.put("hire_date", hire_date);
////		hm1.put("salary", salary);
////		hm1.put("job_id", value);
//		
////		sqlSessionFactory1.openSession().selectOne("employeeInsertData",hm1);
//	}
//	
//	public static int employeeUpdateData(EmployeeVO employeeVO)
//	{
//		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
//		sqlsession1.update("employeeUpdateData",employeeVO);
//		sqlsession1.commit();	
//		
//		return 1;
//	}
//	
//	public static int employeeDeleteData(int employee_id)
//	{
//		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
//		sqlsession1.delete("employeeDeleteData",employee_id);
//		sqlsession1.commit();	
//		
//		return 1;
//	}
	
	
}
