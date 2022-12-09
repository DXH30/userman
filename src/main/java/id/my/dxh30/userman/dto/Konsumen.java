package id.my.dxh30.userman.dto;
import jakarta.persistence.*;
import java.sql.*;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Konsumen {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@Basic
	private String nama;
	
	@Basic
	private String alamat;
	
	@Basic
	private String kota;
	
	@Basic
	private String provinsi;
	
	@CreationTimestamp
	private Date tglRegistrasi;
	
	@Enumerated(EnumType.STRING)
	private Status status;
}
