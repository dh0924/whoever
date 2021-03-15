package com.test.imsi;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	

	 	public String hello() {
			
			String aa = "나와라ㅏㅏ";
			
			return aa;
		} 
	
	
	private static SqlSessionFactory sqlSessionFactory1;
	
	static {
		String myxml="/META-INF/mybatis/Mybatis-config.xml"; // Mybatis-config.xml 환경설정 파일을 받아서 
		InputStream istream=null;
		
		try {
			istream=Resources.getResourceAsStream(myxml);  // Mybatis-config.xml을 읽어들임
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		// Mybatis-configuration file(구성파일)을 읽어 SqlSessionFactory 객체가 생성된다. 
		
		sqlSessionFactory1 = new SqlSessionFactoryBuilder().build(istream);
	}
	public static void nujeok(MemberVO vo) {
        SqlSession sqlsession1 = sqlSessionFactory1.openSession();
        sqlsession1.update("nujeok", vo);
        sqlsession1.commit();
        sqlsession1.close();
     }
	public static int memberNum()
	   {   
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      int result = sqlsession1.selectOne("memberNum");
	      sqlsession1.close();
	      return result;
	   }
	
	public static void upgrade(MemberVO vo) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("upgrade", vo);
		sqlsession1.commit();
		sqlsession1.close();
				   
		}
	
	
public static List <MemberVO> memberAllData(Map <String,Object> map1) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		List <MemberVO> list1= sqlsession1.selectList("memberAllData",map1);
		sqlsession1.close();
		return list1; 
	}
public static int memberNum1(String searchID)
{   
   SqlSession sqlsession1 = sqlSessionFactory1.openSession();
   int result =0;
   if(searchID.equals("")) {
	   result = sqlsession1.selectOne("memberNum");
   }
   else {
	   result = sqlsession1.selectOne("memberNum1",searchID);
   }
   sqlsession1.close();
   return result;
}
public static List <MemberVO> memberAllData1(Map <String,Object> map1) {
	
	SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	List <MemberVO> list1= sqlsession1.selectList("memberAllData1",map1);
	sqlsession1.close();
	return list1; 
}

	
	public static String findid(MemberVO vo) {
		
		return sqlSessionFactory1.openSession().selectOne("findid", vo);
	}
	
	public static String findpw(MemberVO vo) {
		
		return sqlSessionFactory1.openSession().selectOne("findpw", vo);
	}
	

	public static MemberVO login(MemberVO vo) {
	
	  return (MemberVO) sqlSessionFactory1.openSession().selectOne("login",vo);
			   
	}
	

	public static MemberVO chkrnum(MemberVO vo) {
		
		  return (MemberVO) sqlSessionFactory1.openSession().selectOne("chkrnum",vo);
				   
		}
	
	public static int idchk(String id) {
		
		  return sqlSessionFactory1.openSession().selectOne("idchk",id);
				   
		}
	
	public static void signup(MemberVO vo) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.insert("signup", vo);
		sqlsession1.commit();
		sqlsession1.close();
				   
		}
	
	
	public static void update(MemberVO vo) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("update", vo);
		sqlsession1.commit();
		sqlsession1.close();
				   
		}
	
	
	public static int adminset(String id) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("adminset", id);
		sqlsession1.commit();
		sqlsession1.close();
		return 1;
				   
		}	
	
	public static int admindel(String id) {
		
		SqlSession sqlsession1 = sqlSessionFactory1.openSession();
		sqlsession1.update("admindel", id);
		sqlsession1.commit();
		sqlsession1.close();
		return 0;
				   
		}	


	   public static MemberVO getInfo(String id)
	   {   
	      SqlSession sqlsession1 = sqlSessionFactory1.openSession();
	      MemberVO mvo = sqlsession1.selectOne("getInfo",id);
	      sqlsession1.close();
	      return mvo;
	   }
	   public static void newpoint(MemberVO vo) {
		   
			SqlSession sqlsession1 = sqlSessionFactory1.openSession();
			sqlsession1.update("newpoint", vo);
			sqlsession1.commit();
			sqlsession1.close();
			
	   }

	
}
	
	
	
