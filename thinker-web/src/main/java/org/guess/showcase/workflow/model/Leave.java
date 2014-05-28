package org.guess.showcase.workflow.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.guess.core.orm.IdEntity;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 请假流程实体
 *
 * @author guess
 */
@Entity
@Table(name = "OA_LEAVE")
public class Leave extends IdEntity{
	
	/**
	 * 流程实例ID
	 */
	private String processInstanceId;
	
	/**
	 * 流程发起人
	 */
	private String sponsorLoginId;

	/**
	 * 开始日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date startTime;

	/**
	 * 截止日期
	 */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date endTime;
    
    /**
     * 请假类型
     */
    private String leaveType;
    
    /**
     * 请假天数
     */
    private Double leaveDays;
    
    /**
     * 请假原因
     */
    private String reason;
    
    /**
     * 部门经理审批意见
     */
    private String depAuditOpinion;
    
    /**
     * 人力审批意见
     */
    private String hrAuditOpinion;
    
    /**
     * 上传文件名称
     * @return
     */
    private String fileName;
    
    /**
     * 上传文件uuid
     */
    private String fileId;
    
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getSponsorLoginId() {
		return sponsorLoginId;
	}

	public void setSponsorLoginId(String sponsorLoginId) {
		this.sponsorLoginId = sponsorLoginId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	public Double getLeaveDays() {
		return leaveDays;
	}

	public void setLeaveDays(Double leaveDays) {
		this.leaveDays = leaveDays;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDepAuditOpinion() {
		return depAuditOpinion;
	}

	public void setDepAuditOpinion(String depAuditOpinion) {
		this.depAuditOpinion = depAuditOpinion;
	}

	public String getHrAuditOpinion() {
		return hrAuditOpinion;
	}

	public void setHrAuditOpinion(String hrAuditOpinion) {
		this.hrAuditOpinion = hrAuditOpinion;
	}
	
}
