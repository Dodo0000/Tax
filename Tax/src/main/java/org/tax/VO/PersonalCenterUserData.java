package org.tax.VO;

import java.util.Date;

import org.tax.model.TaxUser;

import lombok.Data;

@Data
public class PersonalCenterUserData {
	private String email;
	private Date lastVist;
	private long totalQuestionNum;
	private long totalAnswerNum;
}
