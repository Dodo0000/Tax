package org.tax.VO;

import java.util.List;

import lombok.Data;

import org.tax.model.TaxAnswer;
import org.tax.model.TaxQuestion;

/**
 * @author wyhong
 * @date 2018-7-7
 */
@Data
public class QuestionDetail {

	private TaxQuestion question;
	private List<TaxAnswer> answers;
	
}
