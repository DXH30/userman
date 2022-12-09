package id.my.dxh30.userman.dto;

public enum Status {
	AKTIF("aktif"), NONAKTIF("non-aktif");
	
	private String status; 
	
	Status(String status) {
		this.status = status;
	}
}
