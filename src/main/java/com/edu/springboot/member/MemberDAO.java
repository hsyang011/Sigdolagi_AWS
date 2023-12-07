package com.edu.springboot.member;



import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;


public class MemberDAO extends JDBConnect {
	
	// 아이디 중복확인을 위한 메소드 정의
	public boolean idOverlap(String nickname) {
		// 동적 쿼리문 작성
		String query = " SELECT nickname FROM member WHERE nickname=? ";
		try {
			psmt = con.prepareStatement(query);
			// 첫번째 인파라미터에 매개변수 id를 대입
			psmt.setString(1, nickname);
			// 쿼리 실행
			rs = psmt.executeQuery();
			
			// rs가 존재할 경우 false반환
			if (rs.next()) {
				return false;
			}
		} catch (Exception e) {
			System.out.println("아이디 중복확인 중 예외 발생");
			e.printStackTrace();
		}
		// if문에서 걸리지 않았다면 true반환
		return true;
		
	}

		
}
