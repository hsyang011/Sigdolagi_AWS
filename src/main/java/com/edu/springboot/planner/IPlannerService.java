package com.edu.springboot.planner;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.edu.springboot.member.MemberDTO;

@Mapper
public interface IPlannerService {
	
	// 다른 유저의 플래너들을 갖고온다.
	public List<PlannerDTO> getOtherUserPlanner(MemberDTO memberDTO);
	// 플래너를 최신 순으로 정렬
	public List<PlannerDTO> getPlannerByRecent(String email);
	// 플래너를 카테고리 별로 셀렉트
	public List<PlannerDTO> getPlannerByCate(String cate, String email);
	// 이전에 만든 플래너가 있는지 확인
	public int getPlanner(PlannerDTO plannerDTO);
	// 플래너 생성
	public int createPlanner(PlannerDTO plannerDTO);
	// 플래너의 식별번호를 취득
	public String getPlannerIdx(PlannerDTO plannerDTO);
	// 플래너에 등록된 모든 장소들을 가져온다.
	public List<PlaceDTO> getAllPlaces(PlannerDTO plannerDTO);
	// 플래너를 저장한다. 단 insert가 아닌 null값들을 채워주는 작업이므로 update이다.
	public int savePlanner(PlannerDTO plannerDTO);
	
}
