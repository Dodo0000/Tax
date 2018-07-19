package org.tax.VO;

import lombok.Data;

@Data
public class PublishQuestionInfo {
	String title;
	String content;
	String type;
	Integer prize;
	//String[] invitedUserIdArr;
}
