package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class NoticeboardDAO {

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
	
	public static List <NoticeboardVO> noticeboardAllData()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <NoticeboardVO> list1 = sqlsession1.selectList("noticeboardAllData");
		sqlsession1.close();
		return list1;
	}
	
	public static int noticeboardNum()
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		int totalnum = sqlsession1.selectOne("noticeboardNum");
		sqlsession1.close();
		return totalnum;
	}
	
	public static List <NoticeboardVO> noticeboardPaging(Map <String,Object> map1)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <NoticeboardVO> list1= sqlsession1.selectList("noticeboardPaing",map1);
		sqlsession1.close();
		return list1;
	}
	
	public static NoticeboardVO noticeboardViewData(int noticeno)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		NoticeboardVO nvo = sqlsession1.selectOne("noticeboardViewData",noticeno);
		sqlsession1.close();
		return nvo;
	}
	
	public static void noticeboardDeleteData(int noticeno)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.delete("noticeboardDeleteData",noticeno);
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static int noticeboardMaxNum()
	{
		System.out.println("사이즈 계산중");
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		System.out.println("왜 안나옴?");
		
		int num = 0;
		
		if(sqlsession1.selectOne("noticeboardMaxNum")!=null)
			num = sqlsession1.selectOne("noticeboardMaxNum");
		
		System.out.println("어이가없네");
		sqlsession1.close();
		return num;
		//여기서 sqlSessionFactory로 query 가동 --> mapper.xml의 select에 의해
		//전체 추출된 결과가 selectList()로 전부 보이게
	}
	
	public static void noticeboardInsert(NoticeboardVO nvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("noticeboardInsert",nvo);
		System.out.println("ㄱㄱ");
		sqlsession1.commit();
		sqlsession1.close();
	}
	
	public static void noticeboardUpdate(NoticeboardVO nvo)
	{
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("noticeboardUpdate",nvo);
		sqlsession1.commit();
		sqlsession1.close();
	}
/*	
	public static EmployeeVO employeeSearchData(int employee_id)
	{
		return (EmployeeVO) sqlSessionFactory1.openSession().selectOne("employeeSearchData",employee_id);
	}
	
	public static EmployeeVO employeeDetailData(EmployeeVO vo1)
	{
		return (EmployeeVO) sqlSessionFactory1.openSession().selectOne("employeeDetailData",vo1);
	}
	*/
	
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
