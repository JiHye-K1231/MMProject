package request;

import java.util.Date;
import java.util.Map;

public class QuoteInputRequest {
    private String quoteID;
    private Date quoteDate;
    private String quoteNumber;
    private String customerCode;
    private String employeeCode;
    private String productCode;
    private Date validityPeriod;
    private Double totalAmount;
    private String status;
    private String createdVoucher;

    public QuoteInputRequest(String quoteID, Date quoteDate, String quoteNumber, String customerCode,
                             String employeeCode, String productCode, Date validityPeriod,
                             Double totalAmount, String status, String createdVoucher) {
        this.quoteID = quoteID;
        this.quoteDate = quoteDate;
        this.quoteNumber = quoteNumber;
        this.customerCode = customerCode;
        this.employeeCode = employeeCode;
        this.productCode = productCode;
        this.validityPeriod = validityPeriod;
        this.totalAmount = totalAmount;
        this.status = status;
        this.createdVoucher = createdVoucher;
    }

   
    public String getQuoteID() {
		return quoteID;
	}


	public Date getQuoteDate() {
		return quoteDate;
	}


	public String getQuoteNumber() {
		return quoteNumber;
	}


	public String getCustomerCode() {
		return customerCode;
	}


	public String getEmployeeCode() {
		return employeeCode;
	}


	public String getProductCode() {
		return productCode;
	}


	public Date getValidityPeriod() {
		return validityPeriod;
	}


	public Double getTotalAmount() {
		return totalAmount;
	}


	public String getStatus() {
		return status;
	}


	public String getCreatedVoucher() {
		return createdVoucher;
	}


	// Method to convert QuoteInputRequest to Quote
  public void validate(Map<String, Boolean> errors) {
	  if(quoteID ==null || quoteID.trim().isEmpty()) {
		  errors.put("quoteID", Boolean.TRUE);
	  }
    }
}
