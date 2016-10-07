package com.ifwd.fwdhk.model.motor;

import java.util.ArrayList;
import java.util.List;

public class PolicyDeclaration {
	
	private List<MotorCareDeclaration> underWritingList = new ArrayList<MotorCareDeclaration> ();
	
	private boolean psPICS;
	
	private boolean psNoDM;
	
	private boolean psNoProvidePersonalData;
	
	
	public List<MotorCareDeclaration> getUnderWritingList() {
		return underWritingList;
	}
	
	public void setUnderWritingList(List<MotorCareDeclaration> underWritingList) {
		this.underWritingList = underWritingList;
	}
	
	public boolean isPsPICS() {
		return psPICS;
	}
	
	public void setPsPICS(boolean psPICS) {
		this.psPICS = psPICS;
	}
	
	public boolean isPsNoDM() {
		return psNoDM;
	}
	
	public void setPsNoDM(boolean psNoDM) {
		this.psNoDM = psNoDM;
	}
	
	public boolean isPsNoProvidePersonalData() {
		return psNoProvidePersonalData;
	}
	
	public void setPsNoProvidePersonalData(boolean psNoProvidePersonalData) {
		this.psNoProvidePersonalData = psNoProvidePersonalData;
	}	
}
