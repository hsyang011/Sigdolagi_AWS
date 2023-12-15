package com.edu.springboot.community;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface IMyFileService {
	public int insertMultiFile(PhotoBoardDTO photoBoardDTO);
	public int updateFIle(PhotoBoardDTO photoBoardDTO);
}


