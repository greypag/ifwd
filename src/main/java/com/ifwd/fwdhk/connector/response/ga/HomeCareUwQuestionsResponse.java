package com.ifwd.fwdhk.connector.response.ga;

import java.util.List;
import com.ifwd.fwdhk.connector.response.BaseResponse;

public class HomeCareUwQuestionsResponse extends BaseResponse {
	private static final long serialVersionUID = 1L;

	private List<HomeCareQuestion> homeCareQuestions;

	public List<HomeCareQuestion> getHomeCareQuestions() {
		return homeCareQuestions;
	}

	public void setHomeCareQuestions(List<HomeCareQuestion> homeCareQuestions) {
		this.homeCareQuestions = homeCareQuestions;
	}
	
	
}
