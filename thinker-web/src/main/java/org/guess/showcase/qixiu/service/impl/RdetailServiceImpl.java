package org.guess.showcase.qixiu.service.impl;

import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.qixiu.dao.RdetailDao;
import org.guess.showcase.qixiu.model.Rdetail;
import org.guess.showcase.qixiu.service.RdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 详细记录serviceImpl
 * @author rguess
 * @version 2014-06-04
 */
@Service
public class RdetailServiceImpl extends BaseServiceImpl<Rdetail, Long> implements RdetailService {
	
	@Autowired
	private RdetailDao rdetailDao;

    @Override
    public void delByRecordId(Long reId) {
        rdetailDao.batchExecute("delete from Rdetail where record.id = "+reId);
    }
}
