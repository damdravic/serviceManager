package ddv.com.serviceManagerBackEnd.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "service_case")
public class ServiceCase {

	@Id
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	@Column(name = "case_id")
	private int caseId;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "case_car_id",referencedColumnName = "car_id")
	private Car car;
    
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "case_workshop_id",referencedColumnName = "workshop_id")
	private Workshop workshop;
    
    @Column(name="case_active")
	private boolean caseActive;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="case_insurer_id",referencedColumnName = "insurer_id")
    private Insurer insurer;
	
	@Column (name="case_work_order")
    private int caseWorkOrder;
	
	@Column (name="case_entry_date")
	private String caseEntryDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	

	

	public int getCaseId() {
		return caseId;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}


	public Workshop getWorkshop() {
		return workshop;
	}


	public void setWorkshop(Workshop workshop) {
		this.workshop = workshop;
	}

	public Insurer getInsurer() {
		return insurer;
	}

	public void setInsurer(Insurer insurer) {
		this.insurer = insurer;
	}

	public void setCaseId(int caseId) {
		this.caseId = caseId;
	}

	public boolean isCaseActive() {
		return caseActive;
	}

	public void setCaseActive(boolean caseActive) {
		this.caseActive = caseActive;
	}

	public int getCaseWorkOrder() {
		return caseWorkOrder;
	}

	public void setCaseWorkOrder(int caseWorkOrder) {
		this.caseWorkOrder = caseWorkOrder;
	}

	public String getCaseEntryDate() {
		return caseEntryDate;
	}

	public void setCaseEntryDate(String caseEntryDate) {
		this.caseEntryDate = caseEntryDate;
	}

	
	
}
