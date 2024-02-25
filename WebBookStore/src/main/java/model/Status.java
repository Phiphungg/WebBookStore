package model;

public class Status {
	private int sttID;
	private String sttName;
	
	public Status(int sttID, String sttName) {
		super();
		this.sttID = sttID;
		this.sttName = sttName;
	}

	public int getSttID() {
		return sttID;
	}

	public void setSttID(int sttID) {
		this.sttID = sttID;
	}

	public String getSttName() {
		return sttName;
	}

	public void setSttName(String sttName) {
		this.sttName = sttName;
	}

	@Override
	public String toString() {
		return "Status [sttID=" + sttID + ", sttName=" + sttName + "]";
	}

	
}
