package com.edu.springboot.photoboard;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface IMyFileService {
	public int insertMultiFile(PhotoBoardDTO PhotoBoardDTO);
}

