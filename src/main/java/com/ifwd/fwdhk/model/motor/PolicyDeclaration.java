package com.ifwd.fwdhk.model.motor;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "UnderWritingList",
    "PsPICS",
    "PsNoDM",
    "PsNoProvidePersonalData"    
})
public class PolicyDeclaration {
	@JsonProperty("UnderWritingList")
	private List<UnderWriting> underWritingList = new ArrayList<UnderWriting> ();
	@JsonProperty("PsPICS")
	private boolean psPICS;
	@JsonProperty("PsNoDM")
	private boolean psNoDM;
	@JsonProperty("PsNoProvidePersonalData")
	private boolean psNoProvidePersonalData;
	
	@JsonProperty("UnderWritingList")
	public List<UnderWriting> getUnderWritingList() {
		return underWritingList;
	}
	@JsonProperty("UnderWritingList")
	public void setUnderWritingList(List<UnderWriting> underWritingList) {
		this.underWritingList = underWritingList;
	}
	@JsonProperty("PsPICS")
	public boolean isPsPICS() {
		return psPICS;
	}
	@JsonProperty("PsPICS")
	public void setPsPICS(boolean psPICS) {
		this.psPICS = psPICS;
	}
	@JsonProperty("PsNoDM")
	public boolean isPsNoDM() {
		return psNoDM;
	}
	@JsonProperty("PsNoDM")
	public void setPsNoDM(boolean psNoDM) {
		this.psNoDM = psNoDM;
	}
	@JsonProperty("PsNoProvidePersonalData")
	public boolean isPsNoProvidePersonalData() {
		return psNoProvidePersonalData;
	}
	@JsonProperty("PsNoProvidePersonalData")
	public void setPsNoProvidePersonalData(boolean psNoProvidePersonalData) {
		this.psNoProvidePersonalData = psNoProvidePersonalData;
	}	
}
