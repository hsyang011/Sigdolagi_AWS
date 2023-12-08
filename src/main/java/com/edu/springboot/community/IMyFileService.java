package com.edu.springboot.community;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMyFileService {
	public int insertFile(PhotoBoardDTO photoBoardDTO);
}

