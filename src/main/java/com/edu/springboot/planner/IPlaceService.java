package com.edu.springboot.planner;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IPlaceService {
	
	public int addPlaceToPlanner(PlaceDTO placeDTO);
	public int deleteFromPlanner(PlaceDTO placeDTO);
	
}
