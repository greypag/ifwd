package com.ifwd.fwdhk.model.motor;

import java.util.ArrayList;
import java.util.List;

public class PolicyDeclaration {
	
	private List<UnderWriting> underWritingList = new ArrayList<UnderWriting> ();
	
	private boolean psPICS;
	
	private boolean psNoDM;
	
	private boolean psNoProvidePersonalData;
	
	
	public List<UnderWriting> getUnderWritingList() {
		return underWritingList;
	}
	
	public void setUnderWritingList(List<UnderWriting> underWritingList) {
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
