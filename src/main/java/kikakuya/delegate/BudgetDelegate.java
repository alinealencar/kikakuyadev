package kikakuya.delegate;

import java.sql.SQLException;
import java.util.List;

import kikakuya.model.Vendor;
import kikakuya.service.BudgetService;

public class BudgetDelegate {

	BudgetService budgetService;
	
	public BudgetService getBudgetService() {
		return budgetService;
	}

	public void setBudgetService(BudgetService budgetService) {
		this.budgetService = budgetService;
	}

	public List<Vendor> getVendors() throws SQLException {
		return budgetService.getVendors();
	}
	
	public boolean addVendor(Vendor vendor) throws SQLException {
		return budgetService.addVendor(vendor);
	}
}

