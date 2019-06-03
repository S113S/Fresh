package com.fresh.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fresh.dao.WordDao;
import com.fresh.entity.Word;
import com.fresh.service.WordService;

@Service
public class WordServiceImpl implements WordService {
	@Autowired
	WordDao dao;

	@Override
	public List<Word> getWordsByMap(Map<String, Object> map) {
		return dao.getWordsByMap(map);
	}

	@Override
	public int addWord(Map<String, Object> map) {
		return dao.addWord(map);
	}
}
