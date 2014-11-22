package org.guess.showcase.qixiu.service.impl;

import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.qixiu.dao.RecordDao;
import org.guess.showcase.qixiu.model.Record;
import org.guess.showcase.qixiu.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 记录serviceImpl
 * @author rguess
 * @version 2014-06-04
 */
@Service
public class RecordServiceImpl extends BaseServiceImpl<Record, Long> implements RecordService {
	
	@Autowired
	private RecordDao recordDao;

}
