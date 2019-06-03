package com.fresh.service;

import java.util.List;
import java.util.Map;

import com.fresh.entity.Word;

public interface WordService {
	public List<Word> getWordsByMap(Map<String,Object> map);
	public int addWord(Map<String,Object> map);
}
