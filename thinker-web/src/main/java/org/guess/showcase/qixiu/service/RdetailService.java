package org.guess.showcase.qixiu.service;

import org.guess.core.service.BaseService;
import org.guess.showcase.qixiu.model.Rdetail;

/**
 * 详细service
 * @author rguess
 * @version 2014-06-04
 */
public interface RdetailService extends BaseService<Rdetail, Long>{

    void delByRecordId(Long reId);
}
