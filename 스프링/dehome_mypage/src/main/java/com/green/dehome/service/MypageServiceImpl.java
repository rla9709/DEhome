package com.green.dehome.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.dehome.dao.MypageDao;
import com.green.dehome.dto.MypageDTO;


@Service
public class MypageServiceImpl implements MypageService {
	@Inject
	private MypageDao dao;
	
	@Override
	public MypageDTO getUser(String user_nick) throws Exception {
		return dao.getUser(user_nick);
	}

	@Override
	public void editUser(MypageDTO dto) throws Exception {
		dao.editUser(dto);
	}

	@Override
	public String getPw(String user_nick) throws Exception {
		return dao.getPw(user_nick);
	}

}
