package com.green.dehome.dao;

import java.util.List;

import com.green.dehome.dto.MyPageUl2DTO;

public interface MyPageUl2DAO {
	// 내가 작성한 인테리어 팁 리스트 출력
	public List<MyPageUl2DTO> myTipList(MyPageUl2DTO dto) throws Exception;
	
	// 내가 북마크한 인테리어 팁 리스트 출력
	public List<MyPageUl2DTO> myBmTipList(MyPageUl2DTO dto) throws Exception;
}
