package com.mrc.board.service;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.mrc.board.controller.BoardVO;

public interface BoardService {

	public List<BoardVO> starListData();
}
