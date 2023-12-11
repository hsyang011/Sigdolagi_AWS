package com.edu.springboot.market;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IOrderService {
	
	public int orderProcess(OrderDTO orderDTO);
	
}
