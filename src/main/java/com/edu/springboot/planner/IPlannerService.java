package com.edu.springboot.planner;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IPlannerService {
	
	// 이전에 만든 플래너가 있는지 확인
	public int getPlanner(PlannerDTO plannerDTO);
	// 플래너 생성
	public int createPlanner(PlannerDTO plannerDTO);
	// 플래너의 식별번호를 취득
	public String getPlannerIdx(PlannerDTO plannerDTO);
	// 플래너에 등록된 모든 장소들을 가져온다.
	public List<PlaceDTO> getAllPlaces(PlannerDTO plannerDTO);
	
}
